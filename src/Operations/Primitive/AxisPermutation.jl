using Permutations

struct AxisPermutation <: EinOperation{1}
    permutator::Any

    function AxisPermutation(p)
        isperm(p) || throw(ArgumentError("$p must be a valid permutation"))
        new(p)
    end
end

AxisPermutation(perm...) = AxisPermutation(perm)

Base.ndims(op::AxisPermutation) = length(op.permutator)

Base.:∘(a::AxisPermutation, b::AxisPermutation) =
    AxisPermutation(b.permutator[a.permutator])

einop(op::AxisPermutation, a) = permutedims(a, op.permutator)
einop!(op::AxisPermutation, c, a) = permutedims!(c, a, op.permutator)
