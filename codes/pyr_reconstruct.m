function [ reconstruct ] = pyr_reconstruct( pyr )
for p = length(pyr)-1:-1:1
	pyr{p} = pyr{p}+impyramid(pyr{p+1}, 'expand');
end
reconstruct = pyr{1};

end

