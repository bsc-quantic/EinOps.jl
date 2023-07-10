@testset "AxisPermutation" begin
    using EinOps: AxisPermutation

    @testset "a = $a" for a in [
        [1; 2;; 3; 4;;; 5; 6;; 7; 8],
        [1; 2;; 3; 4;; 5; 6;;; 7; 8;; 9; 10;; 11; 12],
    ]
        @testset "permutation = $perm" for perm in [(1, 2, 3), (1, 3, 2), (2, 1, 3), (2, 3, 1), (3, 1, 2), (3, 2, 1)]
            op = AxisPermutation(perm)

            @test einop(op, a) == permutedims(a, perm)
            @test let c = zeros(eltype(a), permute!(size(a) |> collect, collect(perm))...)
                einop!(op, c, a)
            end == permutedims(a, perm)
        end
    end
end