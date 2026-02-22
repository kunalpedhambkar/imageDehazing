function[luminance_wm]= luminancewm(im)
 l = mean(im,3);

luminance_wm= sqrt((1/3)*(im(:, :, 1)-l).^2+(im(:, :, 2)-l).^2+(im(:, :, 3)-l).^2);
end