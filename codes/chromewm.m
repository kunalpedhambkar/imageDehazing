function[chrome_wm]= chromewm(im)
hsv = rgb2hsv(im);
saturation_value = hsv(:,:,2);
saturation_max = 1 ;
sigma = .3 ;
chrome_wm= exp( -1 * (((saturation_value - saturation_max).^2) / (2*(sigma^2))) );
end