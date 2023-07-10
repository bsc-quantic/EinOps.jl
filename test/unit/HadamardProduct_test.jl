@testset "HadamardProduct" begin
    using EinOps: HadamardProduct

    op = HadamardProduct()

    a = fill(2, 4)
    b = fill(3, 4)

    @test einop(op, a, b) == fill(6, 4)
    @test let c = zeros(promote_type(eltype(a), eltype(b)), 4)
        einop!(op, c, a, b)
    end == fill(6, 4)

    a = fill(2, 2, 4, 3)
    b = fill(3, 2, 4, 3)

    @test einop(op, a, b) == fill(6, 2, 4, 3)
    @test let c = zeros(promote_type(eltype(a), eltype(b)), 2, 4, 3)
        einop!(op, c, a, b)
    end == fill(6, 2, 4, 3)
end