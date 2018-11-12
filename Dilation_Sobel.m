a=imread('skin1.jpg');
Z=rgb2gray(a);
X=imnoise(Z,'salt & pepper',0.01);

%hist eq and noise removal using median filter
Y=histeq(X);
B=medfilt2(Y);
I=B;
subplot(2,2,1)
imshow(a);title('Original Image')
subplot(2,2,2)
imshow(X);title('Noisy Image');

%Thresholding and sobel edge detection
[~, threshold] = edge(I, 'sobel');
fudgeFactor = 0.9
BWs = edge(I,'sobel', threshold * fudgeFactor);
subplot(2,2,3), imshow(BWs), title('Binary Gradient Mask');


%defining Structuring Elements
se90 = strel('line', 3, 90);
se0 = strel('line', 3, 0);

%Dilating
BWsdil = imdilate(BWs, [se90 se0]);
BWdfill = imfill(BWsdil, 'holes');

%clearing Border
BWnobord = imclearborder(BWdfill, 4);
subplot(2,2,4), imshow(BWnobord), title('cleared border image');