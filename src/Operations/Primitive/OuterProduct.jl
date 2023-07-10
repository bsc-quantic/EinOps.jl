struct OuterProduct <: EinOperation{2} end

einop(::OuterProduct, a, b) = reshape(kron(vec(a), vec(b)), size(a)..., size(b)...)
einop!(::OuterProduct, c, a, b) = (kron!(vec(c), vec(a), vec(b)); c)
