################################################################################
# MOI wrapper
################################################################################
# This file is largely inspired from MOI wrappers existing in other
# JuliaOpt packages:
# https://www.juliaopt.org/
# The authors are indebted to the developers of JuliaOpt for
# the current MOI wrapper.
#
#--------------------------------------------------
# Specifications
#--------------------------------------------------
# The MOI wrapper works only for KNITRO version >= 11.0.
#
# - linear coefs are handled directly by KNITRO, via
#  `KN_add_con_linear_struct , KN_add_obj_linear_struct
#
# - quadratic coefs are also handled directly by KNITRO, via
#  `KN_add_con_quad_struct , KN_add_obj_quad_struct
#
# - NLP data are handled via KNITRO's callbacks
#
# NB: If `model.nlp_data` is empty, KNITRO would not use any
#     callbacks during solve.
#
#--------------------------------------------------

import MathOptInterface
const MOI  = MathOptInterface
const MOIU = MathOptInterface.Utilities

# TODO
const SF = Union{MOI.ScalarAffineFunction{Float64},
                 MOI.ScalarQuadraticFunction{Float64}}

const SS = Union{MOI.EqualTo{Float64},
                 MOI.GreaterThan{Float64},
                 MOI.LessThan{Float64},
                 MOI.Interval{Float64},
                 MOI.Zeros,
                 MOI.Nonnegatives,
                 MOI.Nonpositives}

const VS = Union{MOI.EqualTo{Float64},
                 MOI.GreaterThan{Float64},
                 MOI.LessThan{Float64}}

##################################################
# Define custom error for MOI wrapper.
struct UpdateObjectiveError <: MOI.NotAllowedError end
struct AddVariableError <: MOI.NotAllowedError end
struct AddConstraintError <: MOI.NotAllowedError end

# Import some utils.
include(joinpath("MOI_wrapper", "utils.jl"))


##################################################
mutable struct VariableInfo
    lower_bound::Float64  # May be -Inf even if has_lower_bound == true
    has_lower_bound::Bool # Implies lower_bound == Inf
    upper_bound::Float64  # May be Inf even if has_upper_bound == true
    has_upper_bound::Bool # Implies upper_bound == Inf
    is_fixed::Bool        # Implies lower_bound == upper_bound and !has_lower_bound and !has_upper_bound.
    name::String
end
VariableInfo() = VariableInfo(-Inf, false, Inf, false, false, "")


##################################################
# EmptyNLPEvaluator for non-NLP problems.
struct EmptyNLPEvaluator <: MOI.AbstractNLPEvaluator end
MOI.features_available(::EmptyNLPEvaluator) = [:Grad, :Jac, :Hess]
MOI.initialize(::EmptyNLPEvaluator, features) = nothing
MOI.eval_objective(::EmptyNLPEvaluator, x) = NaN
function MOI.eval_constraint(::EmptyNLPEvaluator, g, x)
    return
end
MOI.eval_objective_gradient(::EmptyNLPEvaluator, g, x) = nothing
MOI.jacobian_structure(::EmptyNLPEvaluator) = Tuple{Int64,Int64}[]
MOI.hessian_lagrangian_structure(::EmptyNLPEvaluator) = Tuple{Int64,Int64}[]
function MOI.eval_constraint_jacobian(::EmptyNLPEvaluator, J, x)
    return
end
function MOI.eval_hessian_lagrangian(::EmptyNLPEvaluator, H, x, σ, μ)
    return
end

empty_nlp_data() = MOI.NLPBlockData([], EmptyNLPEvaluator(), false)


##################################################
# MOI Optimizer
mutable struct Optimizer <: MOI.AbstractOptimizer
    inner::Union{Model, Nothing}
    # We only keep in memory some information about variables
    # as we cannot delete variables, we do not have to store an index.
    variable_info::Vector{VariableInfo}
    # Get number of solve for restart.
    number_solved::Int
    # Specify if NLP is loaded inside KNITRO to avoid double definition.
    nlp_loaded::Bool
    nlp_data::MOI.NLPBlockData
    # Store index of nlp constraints.
    nlp_index_cons::Vector{Cint}
    # Store optimization sense.
    sense::MOI.OptimizationSense
    # Store the structure of the objective.
    objective::Union{MOI.SingleVariable,MOI.ScalarAffineFunction{Float64},MOI.ScalarQuadraticFunction{Float64},Nothing}
    # Constraint counters.
    number_zeroone_constraints::Int
    number_integer_constraints::Int
    # Constraint mappings.
    constraint_mapping::Dict{MOI.ConstraintIndex, Union{Cint, Vector{Cint}}}
    license_manager::Union{LMcontext, Nothing}
    options::Dict
end

function set_options(model::Optimizer)
    # Set KNITRO option.
    for (name, value) in model.options
        sname = string(name)
        if sname == "option_file"
            KN_load_param_file(model.inner, value)
        elseif sname == "tuner_file"
            KN_load_tuner_file(model.inner, value)
        else
            if haskey(KN_paramName2Indx, sname) # KN_PARAM_*
                KN_set_param(model.inner, paramName2Indx[sname], value)
            else # string name
                KN_set_param(model.inner, sname, value)
            end
        end
    end
    return
end

function Optimizer(;license_manager=nothing, options...)
    # Create KNITRO context.
    if isa(license_manager, LMcontext)
        kc = Model(license_manager)
    else
        kc = Model()
    end
    model = Optimizer(kc, [], 0, false, empty_nlp_data(),
                      Cint[], MOI.FEASIBILITY_SENSE, nothing, 0, 0,
                      Dict{MOI.ConstraintIndex, Int}(), license_manager, options)

    set_options(model)
    return model
end

# Print Optimizer.
function Base.show(io::IO, model::Optimizer)
    println(io, "A MathOptInterface model with backend:")
    println(io, model.inner)
    return
end

# copy
MOIU.supports_default_copy_to(model::Optimizer, copy_names::Bool) = true
function MOI.copy_to(model::Optimizer, src::MOI.ModelLike; kws...)
    return MOI.Utilities.automatic_copy_to(model, src; kws...)
end

function MOI.empty!(model::Optimizer)
    # Free KNITRO model properly.
    if model.inner != nothing
        KN_free(model.inner)
    end
    # Handle properly license manager
    if isa(model.license_manager, LMcontext)
        model.inner = Model(model.license_manager)
    else
        model.inner = Model()
    end
    empty!(model.variable_info)
    model.number_solved = 0
    model.nlp_data = empty_nlp_data()
    model.nlp_loaded = false
    model.sense = MOI.FEASIBILITY_SENSE
    model.objective = nothing
    model.number_zeroone_constraints = 0
    model.number_integer_constraints = 0
    model.constraint_mapping = Dict()
    model.license_manager = model.license_manager
    set_options(model)
    return
end

function MOI.is_empty(model::Optimizer)
    return isempty(model.variable_info) &&
           model.nlp_data.evaluator isa EmptyNLPEvaluator &&
           model.sense == MOI.FEASIBILITY_SENSE &&
           model.number_solved == 0 &&
           model.sense == MOI.FEASIBILITY_SENSE &&
           isa(model.objective, Nothing) &&
           model.number_zeroone_constraints == 0 &&
           model.number_integer_constraints == 0 &&
           !model.nlp_loaded
end

number_variables(model::Optimizer) = length(model.variable_info)
number_constraints(model::Optimizer) = KN_get_number_cons(model.inner)


##################################################
# Optimize
##################################################
function MOI.optimize!(model::Optimizer)
    # Add NLP structure if specified.
    # FIXME: ideally, the following code should be moved
    # inside set(::Optimizer, ::NLPBlockData) function.
    # However, we encounter an error if we do so, because currently
    # the definition of eval_*_cb functions should be in the same
    # scope as KN_solve (may be due to a closure limitation).
    if !isa(model.nlp_data.evaluator, EmptyNLPEvaluator) && !model.nlp_loaded
        # Instantiate NLPEvaluator once and for all.
        features = MOI.features_available(model.nlp_data.evaluator)
        has_hessian = (:Hess in features)
        # Build initial features for solver.
        init_feat = [:Grad]
        has_hessian && push!(init_feat, :Hess)
        num_nlp_constraints = length(model.nlp_data.constraint_bounds)
        num_nlp_constraints > 0 && push!(init_feat, :Jac)
        # initialize!
        MOI.initialize(model.nlp_data.evaluator, init_feat)

        # The callbacks must match the signature of the callbacks
        # defined in knitro.h.
        # Objective callback (set both objective and constraint evaluation).
        function eval_f_cb(kc, cb, evalRequest, evalResult, userParams)
            # Evaluate objective if specified in nlp_data.
            if model.nlp_data.has_objective
                evalResult.obj[1] = MOI.eval_objective(model.nlp_data.evaluator,
                                                       evalRequest.x)
            end
            # Evaluate nonlinear term in constraint.
            MOI.eval_constraint(model.nlp_data.evaluator,
                                evalResult.c, evalRequest.x)
            return 0
        end

        # Objective gradient callback.
        function eval_grad_cb(kc, cb, evalRequest, evalResult, userParams)
            # Evaluate non-linear term in objective gradient.
            if model.nlp_data.has_objective
                MOI.eval_objective_gradient(model.nlp_data.evaluator,
                                            evalResult.objGrad,
                                            evalRequest.x)
            end
            # Evaluate non linear part of jacobian.
            MOI.eval_constraint_jacobian(model.nlp_data.evaluator,
                                         evalResult.jac,
                                         evalRequest.x)
        end

        if has_hessian
            # Hessian callback.
            function eval_h_cb(kc, cb, evalRequest, evalResult, userParams)
                MOI.eval_hessian_lagrangian(model.nlp_data.evaluator,
                                            evalResult.hess,
                                            evalRequest.x,
                                            evalRequest.sigma,
                                            evalRequest.lambda)
            end
        else
            eval_h_cb = nothing
        end

        # Be careful that sometimes objective is not evaluated here.
        # In any case, NLP objective has precedence other model.objective.
        if model.nlp_data.has_objective
            # Here, we assume that the full objective is evaluated in eval_f.
            cb = KN_add_eval_callback(model.inner, eval_f_cb)
        else
            indexcons = collect(Int32, 0:length(model.nlp_data.constraint_bounds)-1)
            cb = KN_add_eval_callback(model.inner, false, indexcons, eval_f_cb)

            # If a objective is specified in model.objective, load it.
            !isa(model.objective, Nothing) && add_objective!(model, model.objective)
        end

        # Get jacobian structure.
        jacob_structure = MOI.jacobian_structure(model.nlp_data.evaluator)
        nnzJ = length(jacob_structure)
        if nnzJ == 0
            KN_set_cb_grad(model.inner, cb, eval_grad_cb)
        else
            # Take care to convert 1-indexing to 0-indexing!
            # KNITRO supports only Int32 array for integer.
            jacIndexCons = Int32[i-1 for (i, _) in jacob_structure]
            jacIndexVars = Int32[j-1 for (_, j) in jacob_structure]
            KN_set_cb_grad(model.inner, cb, eval_grad_cb,
                        jacIndexCons=jacIndexCons, jacIndexVars=jacIndexVars)
        end

        if has_hessian
            # Get hessian structure.
            hessian_structure = MOI.hessian_lagrangian_structure(model.nlp_data.evaluator)
            nnzH = length(hessian_structure)
            # Take care to convert 1-indexing to 0-indexing!
            # kNITRO supports only Int32 array for integer.
            hessIndexVars1 = Int32[i-1 for (i, _) in hessian_structure]
            hessIndexVars2 = Int32[j-1 for (_, j) in hessian_structure]

            KN_set_cb_hess(model.inner, cb, nnzH, eval_h_cb,
                        hessIndexVars1=hessIndexVars1,
                        hessIndexVars2=hessIndexVars2)
        end

        model.nlp_loaded = true
    elseif !isa(model.objective, Nothing)
        add_objective!(model, model.objective)
    end

    KN_solve(model.inner)
    model.number_solved += 1
    return
end

include(joinpath("MOI_wrapper", "variables.jl"))
include(joinpath("MOI_wrapper", "constraints.jl"))
include(joinpath("MOI_wrapper", "objective.jl"))
include(joinpath("MOI_wrapper", "results.jl"))
include(joinpath("MOI_wrapper", "nlp.jl"))