using Test
using EinOps

@testset "Unit tests" verbose = true begin
    include("unit/AxisSum_test.jl")
    include("unit/AxisPermutation_test.jl")
    # include("unit/Diagonal_test.jl")
    include("unit/HadamardProduct_test.jl")
    include("unit/OuterProduct_test.jl")
    include("unit/TiledMatrixMultiplication_test.jl")
end
