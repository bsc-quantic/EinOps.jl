struct AxisSum <: EinOperation{1}
    inds::NTuple{N,Symbol} where {N}
end
AxisSum(inds...) = AxisSum(inds)

Base.:∘(a::AxisSum, b::AxisSum) = AxisSum(a.inds..., b.inds...)

einop(op::AxisSum, a) = dropdims(sum(+, a, dims=op.inds), dims=op.inds)

function einop!(op::AxisSum, c, a)
    slices = eachslice(a, dims=Tuple(setdiff(1:ndims(a), op.inds)))
    for i in eachindex(c)
        c[i] = sum(slices[i])
    end
    return c
end
