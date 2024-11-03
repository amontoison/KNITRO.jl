# Copyright (c) 2016: Ng Yee Sian, Miles Lubin, other contributors
#
# Use of this source code is governed by an MIT-style license that can be found
# in the LICENSE.md file or at https://opensource.org/licenses/MIT.

module KNITRO

import Libdl
import MathOptInterface as MOI
using KNITRO_jll

has_knitro() = true

function __init__()
    version = knitro_version()
    if version < v"11.0"
        error(
            "You have installed version $version of Artelys " *
            "Knitro, which is not supported by KNITRO.jl. We require a " *
            "Knitro version greater than 11.0.",
        )
    end
    return
end

function knitro_version()
    length = 15
    release = zeros(Cchar, length)
    KN_get_release(length, release)
    version_string = GC.@preserve(release, unsafe_string(pointer(release)))
    return VersionNumber(split(version_string, " ")[2])
end

include("libknitro.jl")
include("C_wrapper.jl")
include("MOI_wrapper.jl")

# KNITRO exports all `KN_XXX` symbols. If you don't want all of these symbols in
# your environment, then use `import KNITRO` instead of `using KNITRO`.

for name in filter(s -> startswith("$s", "KN_"), names(@__MODULE__; all=true))
    @eval export $name
end

end
