function [contrasted]= contrast(im)

luminance= im(:,:,1)*0.299+im(:,:,2)*0.587+im(:,:,3)*0.114;
avg_luminance =mean(luminance(:));
gamma = 2 * (0.5 + avg_luminance);
contrasted(:,:,1) = gamma * (im(:,:,1) - avg_luminance);
contrasted(:,:,2) = gamma * (im(:,:,2) - avg_luminance);
contrasted(:,:,3) = gamma * (im(:,:,3) - avg_luminance);
end