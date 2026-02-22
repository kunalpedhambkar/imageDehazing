function[whitebalanced]= whitebalance(im)
%GrayWorld Assumption Colour Balancing
R_avg = mean(mean(im(:,:,1)));
G_avg = mean(mean(im(:,:,2)));
B_avg = mean(mean(im(:,:,3)));
RGB_avg = [R_avg G_avg B_avg];

gray_value = (R_avg + G_avg + B_avg)/3
scaleValue = gray_value./RGB_avg; 
whitebalanced(:,:,1) = scaleValue(1) * im(:,:,1);
whitebalanced(:,:,2) = scaleValue(2) * im(:,:,2);
whitebalanced(:,:,3) = scaleValue(3) * im(:,:,3);

end