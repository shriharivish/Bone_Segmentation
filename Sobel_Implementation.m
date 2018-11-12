close all;
clc;
a=imread('brain.jpg');
B=rgb2gray(a);
subplot(2,2,1)
imshow(B);title('Original Image')
pause(2)
I=double(B);

%Sobel Mask
for i=1:size(I,1)-2
for j=1:size(I,2)-2
%Sobel mask for x-direction:
mx=((2*I(i+2,j+1)+I(i+2,j)+I(i+2,j+2))-(2*I(i,j+1)+I(i,j)+I(i,j+2)));
%Sobel mask for y-direction:
my=((2*I(i+1,j+2)+I(i,j+2)+I(i+2,j+2))-(2*I(i+1,j)+I(i,j)+I(i+2,j)));
B(i,j)=sqrt(mx.^2+my.^2);
end
end
subplot(2,2,2)
imshow(B); title('Sobel gradient');
C=B;

%Define a threshold value
Thresh=200;
B=max(B,Thresh);
B(B==round(Thresh))=0;
B=uint8(B);
subplot(2,2,3)
imshow(B);title('Edge detected Image');

%Clearing the border for a binary image
BWnobord = imclearborder(B, 4);
subplot(2,2,4), imshow(BWnobord), title('cleared border image');