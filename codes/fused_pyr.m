function [ fused_pyr ] = fused_pyr( input_args )
for i = 1 : 5
 fused_pyr{i} = (gauss_pyr1{i} .* laplace_pyr1{i}) + (gauss_pyr2{i} .* laplace_pyr2{i});
end
end

