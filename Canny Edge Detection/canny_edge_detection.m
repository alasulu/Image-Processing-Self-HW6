clear
clc

% First Image Operations
I = imread("grayscale_brain.png");
Ig = im2gray(I);
ImageDouble = double(Ig);

% Second Image Operations
I2 = imread("grayscale_brain_2.png");
Ig2 = im2gray(I2);
ImageDouble2 = double(Ig2);


%--- First Image Canny Edge Implementation ---%
sigmas = [2 4 16];

for i=1:length(sigmas)
    % Step 1
    % Filter the image by Gaussian lowpass filter
    N = 25;
    [X, Y] = meshgrid(-N/2:N/2-1, -N/2:N/2-1);
    G = 1/(2*pi*sigmas(i)^2)*exp(-(X.^2 + Y.^2)/(2*sigmas(i)^2));
    G = G/sum(G(:));
end
figure
    bluredImage = (conv2(ImageDouble, G, 'same'));
    subplot(2,2,1); 
    imshow(uint8(Ig))
    title('Original Picture')
    % Filter image with Laplacian filter
    H = [-1 1; 1 -1];
    laplacian = conv2(bluredImage, H, 'same');
    logImage = laplacian;
    logImage(abs(laplacian) < .04*max(laplacian(:))) = 128;
    subplot(2,2,2); 
    imshow(uint8(logImage))
    title('2(a)')
    edgeImage = zeros(size(bluredImage));
    edgeImage(laplacian > 0) = 255;
    subplot(2,2,3); 
    imshow(uint8(edgeImage))
    title('2(b)')
    zeroImage = zeros(size(bluredImage));
    zeroImage(abs(laplacian) > .04*max(laplacian(:))) = 255;
    subplot(2,2,4); 
    imshow(uint8(zeroImage));
    title('2(c)')


%--- Second Image Canny Edge Implementation ---%
sigmas2 = [1 3 9];

for i=1:length(sigmas2)
    % Step 1
    % Filter the image by Gaussian lowpass filter
    N2 = 25;
    [X2, Y2] = meshgrid(-N2/2:N2/2-1, -N2/2:N2/2-1);
    G2 = 1/(2*pi*sigmas2(i)^2)*exp(-(X2.^2 + Y2.^2)/(2*sigmas2(i)^2));
    G2 = G2/sum(G2(:));
end
figure
    bluredImage2 = (conv2(ImageDouble2, G2, 'same'));
    subplot(2,2,1); 
    imshow(uint8(Ig2))
    title('Original Picture')
    % Filter image with Laplacian filter
    H2 = [-1 1; 1 -1];
    laplacian2 = conv2(bluredImage2, H2, 'same');
    logImage2 = laplacian2;
    logImage2(abs(laplacian2) < .04*max(laplacian2(:))) = 128;
    subplot(2,2,2); 
    imshow(uint8(logImage2))
    title('2(a)')
    edgeImage2 = zeros(size(bluredImage2));
    edgeImage2(laplacian2 > 0) = 255;
    subplot(2,2,3); 
    imshow(uint8(edgeImage2))
    title('2(b)')
    zeroImage2 = zeros(size(bluredImage2));
    zeroImage2(abs(laplacian2) > .04*max(laplacian2(:))) = 255;
    subplot(2,2,4); 
    imshow(uint8(zeroImage2));
    title('2(c)')

% Another Method to Implement
figure
subplot(1,2,1)
A = edge(Ig,"canny");
imshow(A)
subplot(1,2,2)
B = edge(Ig2,"canny");
imshow(B)

% Algorithm inspired from Seth Balodi (github.com/shashwb)
% Code is written and edited by Oğuzhan Alasulu, Hayriye Kaymaz