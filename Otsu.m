a=imread('knee.jpg');
B=rgb2gray(a);
I=B;
level = graythresh(I);
%input fudge factor f
f=input('Input the fudge factor by which you want to scale the threshold. Preferrably around 0.01, keep altering this for desired and optimised results');
BW = imbinarize(f*I,level);
imshowpair(I,BW,'montage');