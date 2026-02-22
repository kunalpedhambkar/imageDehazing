function[sal_wm]= salwm(im)
im = im2double(im);
if(size(im,3)>1)
    im_gray = rgb2gray(im);
else
    im_gray = im;
end
kernel_1D = (1/16) * [1, 4, 6, 4, 1];
kernel_2D = kron(kernel_1D, kernel_1D');
I_mean = mean(im_gray(:));
I_Whc = conv2(im_gray, kernel_2D, 'same');
sal_wm= abs(I_Whc - I_mean);
end