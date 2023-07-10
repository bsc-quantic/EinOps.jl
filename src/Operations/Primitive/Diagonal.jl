"""
    Diagonal
    
```math
C_{ik} = A_{iik} = \\sum_{j} A_{ijk} \\delta_{ij} 
```
"""
struct Diagonal <: EinOperation{1}
    inds::NTuple{N,Int} where {N}
end
Diagonal(inds...) = new(inds)

# TODO check that op.inds have same size
# function einop!(op::Diagonal, c, a)
#     slices = eachslice(a, dims=op.inds)

#     for i in 1:size(first(op.inds))
#         j = fill(i, length(op.inds))

#         coord = CartesianIndices(...) # TODO
#         copyto!(c, coord, a, parentindices(slices[j...]))
#     end

#     return c
# end