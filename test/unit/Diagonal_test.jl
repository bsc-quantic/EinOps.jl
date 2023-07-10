@test "Diagonal" begin
    using EinOps: Diagonal

    op = Diagonal(1)
    a = ones(4)

    @test einop(op, a) == a
    @test let c = zeros(eltype(a), 4)
        einop!(op, c, a)
    end == a

    a = [1 2; 3 4]

    @test einop(op, a) == a
    @test let c = zeros(eltype(a), size(a)...)
        einop!(op, c, a)
    end == a

    op = Diagonal(1, 2)

    @test einop(op, a) == [1, 4]
    @test let c = zeros(eltype(a), 2)
        einop!(op, c, a)
    end == [1, 4]

    a = [1; 2;; 3; 4;;; 5; 6;; 7; 8]

    @test einop(op, a) == [1; 4;; 5; 8]
    @test let c = zeros(eltype(a), 2, 2)
        einop!(op, c, a)
    end == [1; 4;; 5; 8]

    op = Diagonal(1, 3)

    @test einop(op, a) == [1; 3;; 6; 8] # TODO or [1; 6;; 3; 8]?
    @test let c = zeros(eltype, 2, 2)
        einop!(op, c, a)
    end == [1; 3;; 6; 8]
end