struct HadamardProduct <: EinOperation{2} end

einop(::HadamardProduct, a, b) = a .* b
einop!(::HadamardProduct, c, a, b) = c .= a .* b
einop!(::HadamardProduct, c, a) = c .*= a
