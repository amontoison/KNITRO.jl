# This list was obtained through AWK with Knitro 11.1 (and then pared down) with the following two commands:
# grep "#define" knitro.h | awk '{ printf("const %s = Int32(%s)\n",$2,$3) }'
# grep "#  define" knitro.h | awk '{ printf("const %s = Int32(%s)\n",$3,$4) }'
# For version up until 10.3, use following commands :
# grep "#define" knitro.h | awk '{ printf("const %s = Int32(%s)\n",$2,$3) }'
# grep "#  define" knitro.h | awk '{ printf("const %s = Int32(%s)\n",$3,$4) }'


const KNTRUE = Int32(1)
const KNFALSE = Int32(0)
const KN_INFINITY = Float64(1.79769e+308) # equal to DBL_MAX
const KN_PARAMTYPE_INTEGER = Int32(0)
const KN_PARAMTYPE_FLOAT = Int32(1)
const KN_PARAMTYPE_STRING = Int32(2)
const KN_OBJGOAL_MINIMIZE = Int32(0)
const KN_OBJGOAL_MAXIMIZE = Int32(1)
const KN_OBJTYPE_CONSTANT = Int32(-1)
const KN_OBJTYPE_GENERAL = Int32(0)
const KN_OBJTYPE_LINEAR = Int32(1)
const KN_OBJTYPE_QUADRATIC = Int32(2)
const KN_CONTYPE_CONSTANT = Int32(-1)
const KN_CONTYPE_GENERAL = Int32(0)
const KN_CONTYPE_LINEAR = Int32(1)
const KN_CONTYPE_QUADRATIC = Int32(2)
const KN_CONTYPE_CONIC = Int32(3)
const KN_RSDTYPE_CONSTANT = Int32(-1)
const KN_RSDTYPE_GENERAL = Int32(0)
const KN_RSDTYPE_LINEAR = Int32(1)
const KN_CCTYPE_VARVAR = Int32(0)
const KN_CCTYPE_VARCON = Int32(1)
const KN_CCTYPE_CONCON = Int32(2)
const KN_VARTYPE_CONTINUOUS = Int32(0)
const KN_VARTYPE_INTEGER = Int32(1)
const KN_VARTYPE_BINARY = Int32(2)
const KN_VAR_LINEAR = Int32(1)
const KN_OBJ_CONVEX = Int32(1)
const KN_OBJ_CONCAVE = Int32(2)
const KN_OBJ_CONTINUOUS = Int32(4)
const KN_OBJ_DIFFERENTIABLE = Int32(8)
const KN_OBJ_TWICE_DIFFERENTIABLE = Int32(16)
const KN_OBJ_NOISY = Int32(32)
const KN_OBJ_NONDETERMINISTIC = Int32(64)
const KN_CON_CONVEX = Int32(1)
const KN_CON_CONCAVE = Int32(2)
const KN_CON_CONTINUOUS = Int32(4)
const KN_CON_DIFFERENTIABLE = Int32(8)
const KN_CON_TWICE_DIFFERENTIABLE = Int32(16)
const KN_CON_NOISY = Int32(32)
const KN_CON_NONDETERMINISTIC = Int32(64)
const KN_DENSE = Int32(-1)
const KN_DENSE_ROWMAJOR = Int32(-2)
const KN_DENSE_COLMAJOR = Int32(-3)
const KN_RC_EVALFC = Int32(1)
const KN_RC_EVALGA = Int32(2)
const KN_RC_EVALH = Int32(3)
const KN_RC_EVALHV = Int32(7)
const KN_RC_EVALH_NO_F = Int32(8)
const KN_RC_EVALHV_NO_F = Int32(9)
const KN_RC_EVALR = Int32(10)
const KN_RC_EVALRJ = Int32(11)
const KN_RC_EVALFCGA = Int32(12)
const KN_RC_OPTIMAL_OR_SATISFACTORY = Int32(0)
const KN_RC_OPTIMAL = Int32(0)
const KN_RC_NEAR_OPT = Int32(-100)
const KN_RC_FEAS_XTOL = Int32(-101)
const KN_RC_FEAS_NO_IMPROVE = Int32(-102)
const KN_RC_FEAS_FTOL = Int32(-103)
const KN_RC_INFEASIBLE = Int32(-200)
const KN_RC_INFEAS_XTOL = Int32(-201)
const KN_RC_INFEAS_NO_IMPROVE = Int32(-202)
const KN_RC_INFEAS_MULTISTART = Int32(-203)
const KN_RC_INFEAS_CON_BOUNDS = Int32(-204)
const KN_RC_INFEAS_VAR_BOUNDS = Int32(-205)
const KN_RC_UNBOUNDED = Int32(-300)
if KNITRO_VERSION > v"12.0"
    const KN_RC_UNBOUNDED_OR_INFEAS = Int32(-301)
end
const KN_RC_ITER_LIMIT_FEAS = Int32(-400)
const KN_RC_TIME_LIMIT_FEAS = Int32(-401)
const KN_RC_FEVAL_LIMIT_FEAS = Int32(-402)
const KN_RC_MIP_EXH_FEAS = Int32(-403)
const KN_RC_MIP_TERM_FEAS = Int32(-404)
const KN_RC_MIP_SOLVE_LIMIT_FEAS = Int32(-405)
const KN_RC_MIP_NODE_LIMIT_FEAS = Int32(-406)
const KN_RC_ITER_LIMIT_INFEAS = Int32(-410)
const KN_RC_TIME_LIMIT_INFEAS = Int32(-411)
const KN_RC_FEVAL_LIMIT_INFEAS = Int32(-412)
const KN_RC_MIP_EXH_INFEAS = Int32(-413)
const KN_RC_MIP_SOLVE_LIMIT_INFEAS = Int32(-415)
const KN_RC_MIP_NODE_LIMIT_INFEAS = Int32(-416)
const KN_RC_CALLBACK_ERR = Int32(-500)
const KN_RC_LP_SOLVER_ERR = Int32(-501)
const KN_RC_EVAL_ERR = Int32(-502)
const KN_RC_OUT_OF_MEMORY = Int32(-503)
const KN_RC_USER_TERMINATION = Int32(-504)
const KN_RC_OPEN_FILE_ERR = Int32(-505)
const KN_RC_BAD_N_OR_F = Int32(-506)
const KN_RC_BAD_CONSTRAINT = Int32(-507)
const KN_RC_BAD_JACOBIAN = Int32(-508)
const KN_RC_BAD_HESSIAN = Int32(-509)
const KN_RC_BAD_CON_INDEX = Int32(-510)
const KN_RC_BAD_JAC_INDEX = Int32(-511)
const KN_RC_BAD_HESS_INDEX = Int32(-512)
const KN_RC_BAD_CON_BOUNDS = Int32(-513)
const KN_RC_BAD_VAR_BOUNDS = Int32(-514)
const KN_RC_ILLEGAL_CALL = Int32(-515)
const KN_RC_BAD_KCPTR = Int32(-516)
const KN_RC_NULL_POINTER = Int32(-517)
const KN_RC_BAD_INIT_VALUE = Int32(-518)
const KN_RC_LICENSE_ERROR = Int32(-520)
const KN_RC_BAD_PARAMINPUT = Int32(-521)
const KN_RC_LINEAR_SOLVER_ERR = Int32(-522)
const KN_RC_DERIV_CHECK_FAILED = Int32(-523)
const KN_RC_DERIV_CHECK_TERMINATE = Int32(-524)
const KN_RC_OVERFLOW_ERR = Int32(-525)
const KN_RC_BAD_SIZE = Int32(-526)
const KN_RC_BAD_VARIABLE = Int32(-527)
const KN_RC_BAD_VAR_INDEX = Int32(-528)
const KN_RC_BAD_OBJECTIVE = Int32(-529)
const KN_RC_BAD_OBJ_INDEX = Int32(-530)
const KN_RC_BAD_RESIDUAL = Int32(-531)
const KN_RC_BAD_RSD_INDEX = Int32(-532)
const KN_RC_INTERNAL_ERROR = Int32(-600)
const KN_PARAM_NEWPOINT = Int32(1001)
const KN_PARAM_HONORBNDS = Int32(1002)
const KN_PARAM_ALGORITHM = Int32(1003)
const KN_PARAM_ALG = Int32(1003)
const KN_PARAM_BAR_MURULE = Int32(1004)
const KN_PARAM_BAR_FEASIBLE = Int32(1006)
const KN_PARAM_GRADOPT = Int32(1007)
const KN_PARAM_HESSOPT = Int32(1008)
const KN_PARAM_BAR_INITPT = Int32(1009)
const KN_PARAM_ACT_LPSOLVER = Int32(1012)
const KN_PARAM_CG_MAXIT = Int32(1013)
const KN_PARAM_MAXIT = Int32(1014)
const KN_PARAM_OUTLEV = Int32(1015)
const KN_PARAM_OUTMODE = Int32(1016)
const KN_PARAM_SCALE = Int32(1017)
const KN_PARAM_SOC = Int32(1019)
const KN_PARAM_DELTA = Int32(1020)
const KN_PARAM_BAR_FEASMODETOL = Int32(1021)
const KN_PARAM_FEASTOL = Int32(1022)
const KN_PARAM_FEASTOLABS = Int32(1023)
const KN_PARAM_MAXTIMECPU = Int32(1024)
const KN_PARAM_BAR_INITMU = Int32(1025)
const KN_PARAM_OBJRANGE = Int32(1026)
const KN_PARAM_OPTTOL = Int32(1027)
const KN_PARAM_OPTTOLABS = Int32(1028)
const KN_PARAM_LINSOLVER_PIVOTTOL = Int32(1029)
const KN_PARAM_XTOL = Int32(1030)
const KN_PARAM_DEBUG = Int32(1031)
const KN_PARAM_MULTISTART = Int32(1033)
const KN_PARAM_MSENABLE = Int32(1033)
const KN_PARAM_MSMAXSOLVES = Int32(1034)
const KN_PARAM_MSMAXBNDRANGE = Int32(1035)
const KN_PARAM_MSMAXTIMECPU = Int32(1036)
const KN_PARAM_MSMAXTIMEREAL = Int32(1037)
const KN_PARAM_LMSIZE = Int32(1038)
const KN_PARAM_BAR_MAXCROSSIT = Int32(1039)
const KN_PARAM_MAXTIMEREAL = Int32(1040)
const KN_PARAM_CG_PRECOND = Int32(1041)
const KN_PARAM_BLASOPTION = Int32(1042)
const KN_PARAM_BAR_MAXREFACTOR = Int32(1043)
const KN_PARAM_LINESEARCH_MAXTRIALS = Int32(1044)
const KN_PARAM_BLASOPTIONLIB = Int32(1045)
const KN_PARAM_OUTAPPEND = Int32(1046)
const KN_PARAM_OUTDIR = Int32(1047)
const KN_PARAM_CPLEXLIB = Int32(1048)
const KN_PARAM_BAR_PENRULE = Int32(1049)
const KN_PARAM_BAR_PENCONS = Int32(1050)
const KN_PARAM_MSNUMTOSAVE = Int32(1051)
const KN_PARAM_MSSAVETOL = Int32(1052)
const KN_PARAM_PRESOLVEDEBUG = Int32(1053)
const KN_PARAM_MSTERMINATE = Int32(1054)
const KN_PARAM_MSSTARTPTRANGE = Int32(1055)
const KN_PARAM_INFEASTOL = Int32(1056)
const KN_PARAM_LINSOLVER = Int32(1057)
const KN_PARAM_BAR_DIRECTINTERVAL = Int32(1058)
const KN_PARAM_PRESOLVE = Int32(1059)
const KN_PARAM_PRESOLVE_TOL = Int32(1060)
const KN_PARAM_BAR_SWITCHRULE = Int32(1061)
const KN_PARAM_HESSIAN_NO_F = Int32(1062)
const KN_PARAM_MA_TERMINATE = Int32(1063)
const KN_PARAM_MA_MAXTIMECPU = Int32(1064)
const KN_PARAM_MA_MAXTIMEREAL = Int32(1065)
const KN_PARAM_MSSEED = Int32(1066)
const KN_PARAM_MA_OUTSUB = Int32(1067)
const KN_PARAM_MS_OUTSUB = Int32(1068)
const KN_PARAM_XPRESSLIB = Int32(1069)
const KN_PARAM_TUNER = Int32(1070)
const KN_PARAM_TUNER_OPTIONSFILE = Int32(1071)
const KN_PARAM_TUNER_MAXTIMECPU = Int32(1072)
const KN_PARAM_TUNER_MAXTIMEREAL = Int32(1073)
const KN_PARAM_TUNER_OUTSUB = Int32(1074)
const KN_PARAM_TUNER_TERMINATE = Int32(1075)
const KN_PARAM_LINSOLVER_OOC = Int32(1076)
const KN_PARAM_BAR_RELAXCONS = Int32(1077)
const KN_PARAM_MSDETERMINISTIC = Int32(1078)
const KN_PARAM_BAR_REFINEMENT = Int32(1079)
const KN_PARAM_DERIVCHECK = Int32(1080)
const KN_PARAM_DERIVCHECK_TYPE = Int32(1081)
const KN_PARAM_DERIVCHECK_TOL = Int32(1082)
const KN_PARAM_LINSOLVER_INEXACT = Int32(1083)
const KN_PARAM_LINSOLVER_INEXACTTOL = Int32(1084)
const KN_PARAM_MAXFEVALS = Int32(1085)
const KN_PARAM_FSTOPVAL = Int32(1086)
const KN_PARAM_DATACHECK = Int32(1087)
const KN_PARAM_DERIVCHECK_TERMINATE = Int32(1088)
const KN_PARAM_BAR_WATCHDOG = Int32(1089)
const KN_PARAM_FTOL = Int32(1090)
const KN_PARAM_FTOL_ITERS = Int32(1091)
const KN_PARAM_ACT_QPALG = Int32(1092)
const KN_PARAM_BAR_INITPI_MPEC = Int32(1093)
const KN_PARAM_XTOL_ITERS = Int32(1094)
const KN_PARAM_LINESEARCH = Int32(1095)
const KN_PARAM_OUT_CSVINFO = Int32(1096)
const KN_PARAM_INITPENALTY = Int32(1097)
const KN_PARAM_ACT_LPFEASTOL = Int32(1098)
const KN_PARAM_CG_STOPTOL = Int32(1099)
const KN_PARAM_RESTARTS = Int32(1100)
const KN_PARAM_RESTARTS_MAXIT = Int32(1101)
const KN_PARAM_BAR_SLACKBOUNDPUSH = Int32(1102)
const KN_PARAM_CG_PMEM = Int32(1103)
const KN_PARAM_BAR_SWITCHOBJ = Int32(1104)
const KN_PARAM_OUTNAME = Int32(1105)
const KN_PARAM_OUT_CSVNAME = Int32(1106)
const KN_PARAM_ACT_PARAMETRIC = Int32(1107)
const KN_PARAM_ACT_LPDUMPMPS = Int32(1108)
const KN_PARAM_ACT_LPALG = Int32(1109)
const KN_PARAM_ACT_LPPRESOLVE = Int32(1110)
const KN_PARAM_ACT_LPPENALTY = Int32(1111)
const KN_PARAM_BNDRANGE = Int32(1112)
const KN_PARAM_BAR_CONIC_ENABLE = Int32(1113)
const KN_PARAM_CONVEX = Int32(1114)
const KN_PARAM_OUT_HINTS = Int32(1115)
const KN_PARAM_EVAL_FCGA = Int32(1116)
const KN_PARAM_MIP_METHOD = Int32(2001)
const KN_PARAM_MIP_BRANCHRULE = Int32(2002)
const KN_PARAM_MIP_SELECTRULE = Int32(2003)
const KN_PARAM_MIP_INTGAPABS = Int32(2004)
const KN_PARAM_MIP_INTGAPREL = Int32(2005)
const KN_PARAM_MIP_MAXTIMECPU = Int32(2006)
const KN_PARAM_MIP_MAXTIMEREAL = Int32(2007)
const KN_PARAM_MIP_MAXSOLVES = Int32(2008)
const KN_PARAM_MIP_INTEGERTOL = Int32(2009)
const KN_PARAM_MIP_OUTLEVEL = Int32(2010)
const KN_PARAM_MIP_OUTINTERVAL = Int32(2011)
const KN_PARAM_MIP_OUTSUB = Int32(2012)
const KN_PARAM_MIP_DEBUG = Int32(2013)
const KN_PARAM_MIP_IMPLICATNS = Int32(2014)
const KN_PARAM_MIP_GUB_BRANCH = Int32(2015)
const KN_PARAM_MIP_KNAPSACK = Int32(2016)
const KN_PARAM_MIP_ROUNDING = Int32(2017)
const KN_PARAM_MIP_ROOTALG = Int32(2018)
const KN_PARAM_MIP_LPALG = Int32(2019)
const KN_PARAM_MIP_TERMINATE = Int32(2020)
const KN_PARAM_MIP_MAXNODES = Int32(2021)
const KN_PARAM_MIP_HEURISTIC = Int32(2022)
const KN_PARAM_MIP_HEUR_MAXIT = Int32(2023)
const KN_PARAM_MIP_HEUR_MAXTIMECPU = Int32(2024)
const KN_PARAM_MIP_HEUR_MAXTIMEREAL = Int32(2025)
const KN_PARAM_MIP_PSEUDOINIT = Int32(2026)
const KN_PARAM_MIP_STRONG_MAXIT = Int32(2027)
const KN_PARAM_MIP_STRONG_CANDLIM = Int32(2028)
const KN_PARAM_MIP_STRONG_LEVEL = Int32(2029)
const KN_PARAM_MIP_INTVAR_STRATEGY = Int32(2030)
const KN_PARAM_MIP_RELAXABLE = Int32(2031)
const KN_PARAM_MIP_NODEALG = Int32(2032)
const KN_PARAM_MIP_HEUR_TERMINATE = Int32(2033)
const KN_PARAM_MIP_SELECTDIR = Int32(2034)
const KN_PARAM_PAR_NUMTHREADS = Int32(3001)
const KN_PARAM_PAR_CONCURRENT_EVALS = Int32(3002)
const KN_PARAM_PAR_BLASNUMTHREADS = Int32(3003)
const KN_PARAM_PAR_LSNUMTHREADS = Int32(3004)
const KN_PARAM_PAR_MSNUMTHREADS = Int32(3005)
const KN_NEWPOINT_NONE = Int32(0)
const KN_NEWPOINT_SAVEONE = Int32(1)
const KN_NEWPOINT_SAVEALL = Int32(2)
const KN_HONORBNDS_NO = Int32(0)
const KN_HONORBNDS_ALWAYS = Int32(1)
const KN_HONORBNDS_INITPT = Int32(2)
const KN_ALG_AUTOMATIC = Int32(0)
const KN_ALG_AUTO = Int32(0)
const KN_ALG_BAR_DIRECT = Int32(1)
const KN_ALG_BAR_CG = Int32(2)
const KN_ALG_ACT_CG = Int32(3)
const KN_ALG_ACT_SQP = Int32(4)
const KN_ALG_MULTI = Int32(5)
const KN_BAR_MURULE_AUTOMATIC = Int32(0)
const KN_BAR_MURULE_AUTO = Int32(0)
const KN_BAR_MURULE_MONOTONE = Int32(1)
const KN_BAR_MURULE_ADAPTIVE = Int32(2)
const KN_BAR_MURULE_PROBING = Int32(3)
const KN_BAR_MURULE_DAMPMPC = Int32(4)
const KN_BAR_MURULE_FULLMPC = Int32(5)
const KN_BAR_MURULE_QUALITY = Int32(6)
const KN_BAR_FEASIBLE_NO = Int32(0)
const KN_BAR_FEASIBLE_STAY = Int32(1)
const KN_BAR_FEASIBLE_GET = Int32(2)
const KN_BAR_FEASIBLE_GET_STAY = Int32(3)
const KN_GRADOPT_EXACT = Int32(1)
const KN_GRADOPT_FORWARD = Int32(2)
const KN_GRADOPT_CENTRAL = Int32(3)
const KN_GRADOPT_USER_FORWARD = Int32(4)
const KN_GRADOPT_USER_CENTRAL = Int32(5)
const KN_HESSOPT_AUTO = Int32(0)
const KN_HESSOPT_EXACT = Int32(1)
const KN_HESSOPT_BFGS = Int32(2)
const KN_HESSOPT_SR1 = Int32(3)
const KN_HESSOPT_PRODUCT_FINDIFF = Int32(4)
const KN_HESSOPT_PRODUCT = Int32(5)
const KN_HESSOPT_LBFGS = Int32(6)
const KN_HESSOPT_GAUSS_NEWTON = Int32(7)
const KN_BAR_INITPT_AUTO = Int32(0)
const KN_BAR_INITPT_CONVEX = Int32(1)
const KN_BAR_INITPT_NEARBND = Int32(2)
const KN_BAR_INITPT_CENTRAL = Int32(3)
const KN_ACT_LPSOLVER_INTERNAL = Int32(1)
const KN_ACT_LPSOLVER_CPLEX = Int32(2)
const KN_ACT_LPSOLVER_XPRESS = Int32(3)
const KN_OUTLEV_NONE = Int32(0)
const KN_OUTLEV_SUMMARY = Int32(1)
const KN_OUTLEV_ITER_10 = Int32(2)
const KN_OUTLEV_ITER = Int32(3)
const KN_OUTLEV_ITER_VERBOSE = Int32(4)
const KN_OUTLEV_ITER_X = Int32(5)
const KN_OUTLEV_ALL = Int32(6)
const KN_OUTMODE_SCREEN = Int32(0)
const KN_OUTMODE_FILE = Int32(1)
const KN_OUTMODE_BOTH = Int32(2)
const KN_SCALE_NEVER = Int32(0)
const KN_SCALE_NO = Int32(0)
const KN_SCALE_USER_INTERNAL = Int32(1)
const KN_SCALE_USER_NONE = Int32(2)
const KN_SCALE_INTERNAL = Int32(3)
const KN_SOC_NO = Int32(0)
const KN_SOC_MAYBE = Int32(1)
const KN_SOC_YES = Int32(2)
const KN_DEBUG_NONE = Int32(0)
const KN_DEBUG_PROBLEM = Int32(1)
const KN_DEBUG_EXECUTION = Int32(2)
const KN_MULTISTART_NO = Int32(0)
const KN_MULTISTART_YES = Int32(1)
const KN_CG_PRECOND_NONE = Int32(0)
const KN_CG_PRECOND_CHOL = Int32(1)
const KN_BLASOPTION_KNITRO = Int32(0)
const KN_BLASOPTION_INTEL = Int32(1)
const KN_BLASOPTION_DYNAMIC = Int32(2)
const KN_OUTAPPEND_NO = Int32(0)
const KN_OUTAPPEND_YES = Int32(1)
const KN_BAR_PENRULE_AUTO = Int32(0)
const KN_BAR_PENRULE_SINGLE = Int32(1)
const KN_BAR_PENRULE_FLEX = Int32(2)
const KN_BAR_PENCONS_AUTO = Int32(0)
const KN_BAR_PENCONS_NONE = Int32(1)
const KN_BAR_PENCONS_ALL = Int32(2)
const KN_BAR_PENCONS_EQUALITIES = Int32(3)
const KN_BAR_PENCONS_INFEAS = Int32(4)
const KN_PRESOLVEDBG_NONE = Int32(0)
const KN_PRESOLVEDBG_BASIC = Int32(1)
const KN_PRESOLVEDBG_VERBOSE = Int32(2)
const KN_MSTERMINATE_MAXSOLVES = Int32(0)
const KN_MSTERMINATE_OPTIMAL = Int32(1)
const KN_MSTERMINATE_FEASIBLE = Int32(2)
const KN_MSTERMINATE_ANY = Int32(3)
const KN_LINSOLVER_AUTO = Int32(0)
const KN_LINSOLVER_INTERNAL = Int32(1)
const KN_LINSOLVER_HYBRID = Int32(2)
const KN_LINSOLVER_DENSEQR = Int32(3)
const KN_LINSOLVER_MA27 = Int32(4)
const KN_LINSOLVER_MA57 = Int32(5)
const KN_LINSOLVER_MKLPARDISO = Int32(6)
const KN_LINSOLVER_MA97 = Int32(7)
const KN_LINSOLVER_MA86 = Int32(8)
const KN_PRESOLVE_NONE = Int32(0)
const KN_PRESOLVE_BASIC = Int32(1)
const KN_PRESOLVE_ADVANCED = Int32(2)
if KNITRO_VERSION >= v"12.0"
    const KN_PRESOLVE_NO = Int32(0)
    const KN_PRESOLVE_YES = Int32(1)
    const KN_PRESOLVE_ADVANCED = Int32(2)
end
const KN_BAR_SWITCHRULE_AUTO = Int32(0)
const KN_BAR_SWITCHRULE_NEVER = Int32(1)
const KN_BAR_SWITCHRULE_MODERATE = Int32(2)
const KN_BAR_SWITCHRULE_AGGRESSIVE = Int32(3)
const KN_HESSIAN_NO_F_FORBID = Int32(0)
const KN_HESSIAN_NO_F_ALLOW = Int32(1)
const KN_MA_TERMINATE_ALL = Int32(0)
const KN_MA_TERMINATE_OPTIMAL = Int32(1)
const KN_MA_TERMINATE_FEASIBLE = Int32(2)
const KN_MA_TERMINATE_ANY = Int32(3)
const KN_MA_OUTSUB_NONE = Int32(0)
const KN_MA_OUTSUB_YES = Int32(1)
const KN_MS_OUTSUB_NONE = Int32(0)
const KN_MS_OUTSUB_YES = Int32(1)
const KN_TUNER_OFF = Int32(0)
const KN_TUNER_ON = Int32(1)
const KN_TUNER_OUTSUB_NONE = Int32(0)
const KN_TUNER_OUTSUB_SUMMARY = Int32(1)
const KN_TUNER_OUTSUB_ALL = Int32(2)
const KN_TUNER_TERMINATE_ALL = Int32(0)
const KN_TUNER_TERMINATE_OPTIMAL = Int32(1)
const KN_TUNER_TERMINATE_FEASIBLE = Int32(2)
const KN_TUNER_TERMINATE_ANY = Int32(3)
const KN_LINSOLVER_OOC_NO = Int32(0)
const KN_LINSOLVER_OOC_MAYBE = Int32(1)
const KN_LINSOLVER_OOC_YES = Int32(2)
const KN_BAR_RELAXCONS_NONE = Int32(0)
const KN_BAR_RELAXCONS_EQS = Int32(1)
const KN_BAR_RELAXCONS_INEQS = Int32(2)
const KN_BAR_RELAXCONS_ALL = Int32(3)
const KN_MSDETERMINISTIC_NO = Int32(0)
const KN_MSDETERMINISTIC_YES = Int32(1)
const KN_BAR_REFINEMENT_NO = Int32(0)
const KN_BAR_REFINEMENT_YES = Int32(1)
const KN_DERIVCHECK_NONE = Int32(0)
const KN_DERIVCHECK_FIRST = Int32(1)
const KN_DERIVCHECK_SECOND = Int32(2)
const KN_DERIVCHECK_ALL = Int32(3)
const KN_DERIVCHECK_FORWARD = Int32(1)
const KN_DERIVCHECK_CENTRAL = Int32(2)
const KN_LINSOLVER_INEXACT_NO = Int32(0)
const KN_LINSOLVER_INEXACT_YES = Int32(1)
const KN_DATACHECK_NO = Int32(0)
const KN_DATACHECK_YES = Int32(1)
const KN_DERIVCHECK_STOPERROR = Int32(1)
const KN_DERIVCHECK_STOPALWAYS = Int32(2)
const KN_BAR_WATCHDOG_NO = Int32(0)
const KN_BAR_WATCHDOG_YES = Int32(1)
const KN_ACT_QPALG_AUTO = Int32(0)
const KN_ACT_QPALG_BAR_DIRECT = Int32(1)
const KN_ACT_QPALG_BAR_CG = Int32(2)
const KN_ACT_QPALG_ACT_CG = Int32(3)
const KN_LINESEARCH_AUTO = Int32(0)
const KN_LINESEARCH_BACKTRACK = Int32(1)
const KN_LINESEARCH_INTERPOLATE = Int32(2)
const KN_OUT_CSVINFO_NO = Int32(0)
const KN_OUT_CSVINFO_YES = Int32(1)
const KN_BAR_SWITCHOBJ_NONE = Int32(0)
const KN_BAR_SWITCHOBJ_SCALARPROX = Int32(1)
const KN_BAR_SWITCHOBJ_DIAGPROX = Int32(2)
const KN_ACT_PARAMETRIC_NO = Int32(0)
const KN_ACT_PARAMETRIC_MAYBE = Int32(1)
const KN_ACT_PARAMETRIC_YES = Int32(2)
const KN_ACT_LPDUMPMPS_NO = Int32(0)
const KN_ACT_LPDUMPMPS_YES = Int32(1)
const KN_ACT_LPALG_DEFAULT = Int32(0)
const KN_ACT_LPALG_PRIMAL = Int32(1)
const KN_ACT_LPALG_DUAL = Int32(2)
const KN_ACT_LPALG_BARRIER = Int32(3)
const KN_ACT_LPPRESOLVE_OFF = Int32(0)
const KN_ACT_LPPRESOLVE_ON = Int32(1)
const KN_ACT_LPPENALTY_ALL = Int32(1)
const KN_ACT_LPPENALTY_NONLINEAR = Int32(2)
const KN_ACT_LPPENALTY_DYNAMIC = Int32(3)
const KN_BAR_CONIC_ENABLE_NONE = Int32(0)
const KN_BAR_CONIC_ENABLE_SOC = Int32(1)
const KN_CONVEX_NO = Int32(0)
const KN_CONVEX_YES = Int32(1)
const KN_OUT_HINTS_NO = Int32(0)
const KN_OUT_HINTS_YES = Int32(1)
const KN_EVAL_FCGA_NO = Int32(0)
const KN_EVAL_FCGA_YES = Int32(1)
const KN_MIP_METHOD_AUTO = Int32(0)
const KN_MIP_METHOD_BB = Int32(1)
const KN_MIP_METHOD_HQG = Int32(2)
const KN_MIP_METHOD_MISQP = Int32(3)
const KN_MIP_BRANCH_AUTO = Int32(0)
const KN_MIP_BRANCH_MOSTFRAC = Int32(1)
const KN_MIP_BRANCH_PSEUDOCOST = Int32(2)
const KN_MIP_BRANCH_STRONG = Int32(3)
const KN_MIP_SEL_AUTO = Int32(0)
const KN_MIP_SEL_DEPTHFIRST = Int32(1)
const KN_MIP_SEL_BESTBOUND = Int32(2)
const KN_MIP_SEL_COMBO_1 = Int32(3)
const KN_MIP_OUTLEVEL_NONE = Int32(0)
const KN_MIP_OUTLEVEL_ITERS = Int32(1)
const KN_MIP_OUTLEVEL_ITERSTIME = Int32(2)
const KN_MIP_OUTLEVEL_ROOT = Int32(3)
const KN_MIP_OUTSUB_NONE = Int32(0)
const KN_MIP_OUTSUB_YES = Int32(1)
const KN_MIP_OUTSUB_YESPROB = Int32(2)
const KN_MIP_DEBUG_NONE = Int32(0)
const KN_MIP_DEBUG_ALL = Int32(1)
const KN_MIP_IMPLICATNS_NO = Int32(0)
const KN_MIP_IMPLICATNS_YES = Int32(1)
const KN_MIP_GUB_BRANCH_NO = Int32(0)
const KN_MIP_GUB_BRANCH_YES = Int32(1)
const KN_MIP_KNAPSACK_NO = Int32(0)
const KN_MIP_KNAPSACK_NONE = Int32(0)
const KN_MIP_KNAPSACK_INEQ = Int32(1)
const KN_MIP_KNAPSACK_INEQ_EQ = Int32(2)
const KN_MIP_ROUND_AUTO = Int32(0)
const KN_MIP_ROUND_NONE = Int32(1)
const KN_MIP_ROUND_HEURISTIC = Int32(2)
const KN_MIP_ROUND_NLP_SOME = Int32(3)
const KN_MIP_ROUND_NLP_ALWAYS = Int32(4)
const KN_MIP_ROOTALG_AUTO = Int32(0)
const KN_MIP_ROOTALG_BAR_DIRECT = Int32(1)
const KN_MIP_ROOTALG_BAR_CG = Int32(2)
const KN_MIP_ROOTALG_ACT_CG = Int32(3)
const KN_MIP_ROOTALG_ACT_SQP = Int32(4)
const KN_MIP_ROOTALG_MULTI = Int32(5)
const KN_MIP_LPALG_AUTO = Int32(0)
const KN_MIP_LPALG_BAR_DIRECT = Int32(1)
const KN_MIP_LPALG_BAR_CG = Int32(2)
const KN_MIP_LPALG_ACT_CG = Int32(3)
const KN_MIP_TERMINATE_OPTIMAL = Int32(0)
const KN_MIP_TERMINATE_FEASIBLE = Int32(1)
const KN_MIP_HEURISTIC_AUTO = Int32(0)
const KN_MIP_HEURISTIC_NONE = Int32(1)
const KN_MIP_HEURISTIC_FEASPUMP = Int32(2)
const KN_MIP_HEURISTIC_MPEC = Int32(3)
const KN_MIP_PSEUDOINIT_AUTO = Int32(0)
const KN_MIP_PSEUDOINIT_AVE = Int32(1)
const KN_MIP_PSEUDOINIT_STRONG = Int32(2)
const KN_MIP_INTVAR_STRATEGY_NONE = Int32(0)
const KN_MIP_INTVAR_STRATEGY_RELAX = Int32(1)
const KN_MIP_INTVAR_STRATEGY_MPEC = Int32(2)
const KN_MIP_RELAXABLE_NONE = Int32(0)
const KN_MIP_RELAXABLE_ALL = Int32(1)
const KN_MIP_NODEALG_AUTO = Int32(0)
const KN_MIP_NODEALG_BAR_DIRECT = Int32(1)
const KN_MIP_NODEALG_BAR_CG = Int32(2)
const KN_MIP_NODEALG_ACT_CG = Int32(3)
const KN_MIP_NODEALG_ACT_SQP = Int32(4)
const KN_MIP_NODEALG_MULTI = Int32(5)
const KN_MIP_HEUR_TERMINATE_FEASIBLE = Int32(1)
const KN_MIP_HEUR_TERMINATE_LIMIT = Int32(2)
const KN_MIP_SELECTDIR_DOWN = Int32(0)
const KN_MIP_SELECTDIR_UP = Int32(1)
const KN_PAR_CONCURRENT_EVALS_NO = Int32(0)
const KN_PAR_CONCURRENT_EVALS_YES = Int32(1)
const KN_PAR_MSNUMTHREADS_AUTO = Int32(0)
if KNITRO_VERSION >= v"12.0"
    # Cuts parameters
    const KN_PARAM_MIP_ZEROHALF = Int32(2036)
    const KN_MIP_ZEROHALF_NONE = Int32(0)
    const KN_MIP_ZEROHALF_ROOT = Int32(1)
    const KN_MIP_ZEROHALF_TREE = Int32(2)
    const KN_MIP_ZEROHALF_ALL = Int32(3)
    const KN_PARAM_MIP_MIR = Int32(2037)
    const KN_MIP_MIR_NONE = Int32(0)
    const KN_MIP_MIR_TREE = Int32(1)
    const KN_PARAM_MIP_CLIQUE = Int32(2038)
    const KN_MIP_CLIQUE_NONE = Int32(0)
    const KN_MIP_CLIQUE_ROOT = Int32(1)
    const KN_MIP_CLIQUE_TREE = Int32(2)
    const KN_MIP_CLIQUE_ALL = Int32(3)
    # SOCP parameters
    const KN_PARAM_PAR_CONICNUMTHREADS = Int32(3006)
    # Presolve parameters
    const KN_PARAM_PRESOLVE_PASSES = Int32(1121)
    const KN_PARAM_PRESOLVE_LEVEL = Int32(1122)
    const KN_PRESOLVE_LEVEL_AUTO = Int32(-1)
    const KN_PRESOLVE_LEVEL_1 = Int32(1)
    const KN_PRESOLVE_LEVEL_2 = Int32(2)
end
if KNITRO_VERSION >= v"12.1"
    const KN_PARAM_FINDIFF_RELSTEPSIZE = Int32(1123)
    const KN_PARAM_INFEASTOL_ITERS = Int32(1124)
    # New options for MIP MIR cuts
    const KN_MIP_MIR_AUTO = Int32(-1)
    const KN_MIP_MIR_NLP = Int32(2)
    # New options for presolve
    const KN_PARAM_PRESOLVEOP_TIGHTEN = Int32(1125)
    const KN_PRESOLVEOP_TIGHTEN_AUTO = Cint(-1)
    const KN_PRESOLVEOP_TIGHTEN_NONE = Cint(0)
    const KN_PRESOLVEOP_TIGHTEN_VARBND = Cint(1)
end
