@testset "AxisSum" begin
    using EinOps: AxisSum

    op = AxisSum(1)
    a = ones(4)

    @test einop(op, a) == fill(4)
    @test let c = zeros(eltype(a))
        einop!(op, c, a)
    end == fill(4)

    a = [1 2; 3 4]

    @test einop(op, a) == [4, 6]
    @test let c = zeros(eltype(a), 2)
        einop!(op, c, a)
    end == [4, 6]

    op = AxisSum(2)
    a = [1 2; 3 4]

    @test einop(op, a) == [3, 7]
    @test let c = zeros(eltype(a), 2)
        einop!(op, c, a)
    end == [3, 7]

    op = AxisSum(1, 2)
    a = [1 2; 3 4]

    @test einop(op, a) == fill(10)
    @test let c = zeros(eltype(a))
        einop!(op, c, a)
    end == fill(10)
end
