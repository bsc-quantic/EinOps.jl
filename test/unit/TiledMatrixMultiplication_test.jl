@testset "TiledMatrixMultiplication" begin
    using EinOps: TiledMatrixMultiplication

    op = TiledMatrixMultiplication((1,), (1,))
    a = ones(3, 2)
    b = ones(3, 4)

    @test let c = zeros(2, 4)
        einop!(op, c, a, b)
    end == fill(3, 2, 4)

    op = TiledMatrixMultiplication((2,), (2,))
    a = ones(2, 3)
    b = ones(4, 3)

    @test let c = zeros(2, 4)
        einop!(op, c, a, b)
    end == fill(3, 2, 4)

    op = TiledMatrixMultiplication((2,), (1,))
    a = ones(2, 3)
    b = ones(3, 4)

    @test let c = zeros(2, 4)
        einop!(op, c, a, b)
    end == fill(3, 2, 4)

    op = TiledMatrixMultiplication((3, 4), (1, 2))
    a = ones(2, 3, 4, 5)
    b = ones(4, 5, 6, 7)

    @test let c = zeros(2, 3, 6, 7)
        einop!(op, c, a, b)
    end == fill(20, 2, 3, 6, 7)

end
