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

    i1, i2 = collect.(first(op.left) == 1 ? (op.left, setdiff(1:ndims(a), op.left)) : (setdiff(1:ndims(a), op.left), op.left))
    a_mat = reshape(a, prod.((
        collect(size(a))[i1],
        collect(size(a))[i2],
    ))...)

    i1, i2 = collect.(first(op.right) == 1 ? (op.right, setdiff(1:ndims(a), op.right)) : (setdiff(1:ndims(a), op.right), op.right))
    b_mat = reshape(b, prod.((
        collect(size(b))[i1],
        collect(size(b))[i2],
    ))...)

    if first(op.left) == 1
        a_mat = transpose(a_mat)
    end

    if first(op.right) != 1
        b_mat = transpose(b_mat)
    end

    c_mat = reshape(c, size(a_mat, 1), size(b_mat, 2))


    mul!(c_mat, a_mat, b_mat)
    return c
end
