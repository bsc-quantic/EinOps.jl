@testset "OuterProduct" begin
    using EinOps: OuterProduct

    op = OuterProduct()

    a = fill(2, 4)
    b = fill(3, 5)

    @test einop(op, a, b) == fill(6, 4, 5)
    @test let c = zeros(promote_type(eltype(a), eltype(b)), 4, 5)
        einop!(op, c, a, b)
    end == fill(6, 4, 5)

    # TODO more testing
end