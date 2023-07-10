using LinearAlgebra: mul!

struct TiledMatrixMultiplication <: EinOperation{2}
    left::NTuple
    right::NTuple
end

# TODO current implementation only allows matrix mult. write gradual tiling.
function einop!(op::TiledMatrixMultiplication, c, a, b)
    # ba = eachslice(a, ...)
    # bb = eachslice(b, ...)
    # bc = eachslice(c, ...)

    @assert issorted(op.left) && all(op.left .== range(extrema(op.left)...))
    @assert issorted(op.right) && all(op.right .== range(extrema(op.right)...))

    a_mat = reshape(a, prod.(Base.split_rest(size(a), first(op.left) == 1 ? ndims(a) - length(op.left) : length(op.left)))...)
    b_mat = reshape(b, prod.(Base.split_rest(size(b), first(op.right) == 1 ? ndims(b) - length(op.right) : length(op.right)))...)
    c_mat = reshape(c, prod.(Base.split_rest(size(c), ndims(b) - length(op.right)))...)

    if first(op.left) == 1
        a_mat = transpose(a_mat)
    end

    if first(op.right) != 1
        b_mat = transpose(b_mat)
    end

    mul!(c_mat, a_mat, b_mat)
    return c
end
