close all;
clc;

%add name of file here
a=imread('brain.jpg');
Z=rgb2gray(a);
X=imnoise(Z,'salt & pepper',0.02);

%hist eq and noise removal using median filter
Y=histeq(X);
B=medfilt2(Y);
I=B;

subplot(2,2,1)
imshow(a);title('Original Image')
subplot(2,2,2)
imshow(X);title('Noisy Image');
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

%Define a threshold value
Thresh=220;
B=max(B,Thresh);
B(B==round(Thresh))=0;
B=uint8(B);

%Clearing the border for a binary image
BWnobord = imclearborder(B, 4);
subplot(2,2,3), imshow(BWnobord), title('cleared border image');

level = graythresh(I);
%input fudge factor f
f=input('Input the fudge factor by which you want to scale the threshold. Preferrably under 0.005, keep altering this for desired and optimised results');
BW = imbinarize(f*I,level);
subplot(2,2,4), imshow(BW), title('Otsus Thresholded Image');
