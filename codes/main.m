clc
close all
clear all
%Reading Image:
im= im2double(imread('C:/Users/Kunal/Desktop (Hide)/Study/Internship/18062014/Image Dehazing/Project/data/hazed1.jpg'));
imshow(im); title('Original Image');

%Converting Single Image to 2 Images:
first_input= whitebalance(im);
figure; subplot(1,3,2); imshow(first_input); title('WhiteBalance');

second_input= contrast(im);
subplot(1,3,3); imshow(second_input); title('Contrast');

subplot(1,3,1); imshow(im); title('Original Image');

%Generating Weightmap of First Input:
luminance_wm1= luminancewm(first_input);
figure; subplot(1,3,1); imshow(luminance_wm1); title('Lum WM of First Input');
chrome_wm1= chromewm(first_input);
subplot(1,3,2); imshow(chrome_wm1); title('Chrome WM of First Input');
sal_wm1= salwm(first_input);
subplot(1,3,3); imshow(sal_wm1); title('Sal WM of First Input');

%Generating Weightmap of Second Input:
luminance_wm2= luminancewm(second_input);
figure; subplot(1,3,1); imshow(luminance_wm2); title('Lum WM of Second Input');
chrome_wm2= chromewm(second_input);
subplot(1,3,2); imshow(chrome_wm2); title('Chrome WM of Second Input');
sal_wm2= salwm(second_input);
subplot(1,3,3); imshow(sal_wm2); title('Sal WM of Second Input');

%Resultant Weightmap of Both Input:
result_wm1= luminance_wm1 .* chrome_wm1 .* sal_wm1;
result_wm2= luminance_wm2 .* chrome_wm2 .* sal_wm2;

%Normalized Weightmaps to delete Unwanted Characteristics:
normal_wm1= result_wm1 ./ (result_wm1 + result_wm2);
normal_wm2= result_wm2 ./ (result_wm1 + result_wm2);


%Gaussian Pyramid:
gauss_pyr1= pyr(normal_wm1,'gauss', 5);
gauss_pyr2= pyr(normal_wm2,'gauss', 5);
for i = 1 : 5
    tempImg = [];
    for j = 1 : size(im,3)
        %Generating Laplacian Pyramid for derrived inputs
        laplace_pyr1 = pyr(first_input(:,:,j),'laplace',5); 
        laplace_pyr2 = pyr(second_input(:,:,j),'laplace',5);
        
        row_size = min([size(laplace_pyr1{i},1),size(laplace_pyr2{i},1),size(gauss_pyr1{i},1),size(gauss_pyr2{i},1)]);
        column_size = min([size(laplace_pyr1{i},2),size(laplace_pyr2{i},2),size(gauss_pyr1{i},2),size(gauss_pyr2{i},2)]);
        tempImg(:,:,j) = laplace_pyr1{i}(1:row_size , 1:column_size) .* gauss_pyr1{i}(1:row_size, 1:column_size) + laplace_pyr2{i}(1:row_size, 1:column_size) .* gauss_pyr2{i}(1:row_size, 1:column_size);
    end
    fused_pyr{i} = tempImg;
end

final_img = pyr_reconstruct(fused_pyr);
figure;
imshow(final_img);
title('Dehazed Image');
figure; subplot(1,2,2); imshow(final_img); title("Dehazed Image");
subplot(1,2,1); imshow(im); title("Original Image");





