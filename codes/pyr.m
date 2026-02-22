function[pyramid]= pyr(image, type, lvl)
pyramid= cell(1,lvl);
pyramid{1}= im2double(image);
for p= 2:lvl
    pyramid{p}= impyramid(pyramid{p-1}, 'reduce')
end
if strcmp(type,'gauss'), return; end
for p = lvl-1:-1:1
	osz = size(pyramid{p+1})*2-1;
	pyramid{p} = pyramid{p}(1:osz(1),1:osz(2),:);
end
for p = 1:lvl-1
	pyramid{p} = pyramid{p}-impyramid(pyramid{p+1}, 'expand');
end

end