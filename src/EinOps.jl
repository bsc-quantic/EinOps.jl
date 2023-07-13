module EinOps

abstract type EinOperation{N} end

"""
    einop()
"""
function einop end

"""
    einop!()
"""
function einop! end

# TODO needs to be implemented
macro ein_str() end

include("Operations/Primitive/AxisSum.jl")
include("Operations/Primitive/AxisPermutation.jl")
include("Operations/Primitive/Diagonal.jl")
include("Operations/Primitive/OuterProduct.jl")
include("Operations/HadamardProduct.jl")
include("Operations/TiledMatrixMultiplication.jl")

export einop, einop!, @ein
export AxisSum, AxisPermutation, Diagonal, HadamardProduct, OuterProduct, TiledMatrixMultiplication

end
