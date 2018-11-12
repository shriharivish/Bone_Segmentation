a=imread('brain.jpg');
B=rgb2gray(a);
BW=edge(B,'sobel',0.1);
imshow(BW);
%Clearing the border for a binary image
BWnobord = imclearborder(BW, 4);
%subplot(2,2,4), 
imshow(BWnobord), title('cleared border image');