clear
clc

%--- Image Reading ---%
I = imread("grayscale_brain.png");
I2 = imread("grayscale_brain_2.png");
I3 = imread("heart_ultrasound.jpeg");
I4 = imread("im1.png");
I5 = imread("im2.png");
I7 = imread("mri_brain.jpeg");
I8 = imread("nerve_cells.jpg");

%--- Image Converting to Grayscale ---%
Ig = im2gray(I);
Ig2 = im2gray(I2);
Ig3 = im2gray(I3);
Ig4 = im2gray(I4);
Ig5 = im2gray(I5);
Ig7 = im2gray(I7);
Ig8 = im2gray(I8);

%--- Parameters Setting ---%
threshold = 10000;
threshold2 = 10000; 
threshold3 = 230000; 
threshold4 = 10000; 
threshold5 = 10000; 
threshold7 = 100000; 
sigma = 1.5; 
sigma2 = 1.5; 
sigma3 = 0.5; 
sigma4 = 1.5; 
sigma5 = 1.5; 
sigma7 = 0.5; 

%--- Run the Funtion ---%
corners = harris_corner(Ig, threshold, sigma);
corners2 = harris_corner(Ig2, threshold2, sigma2);
corners3 = harris_corner(Ig3, threshold3, sigma3);
corners4 = harris_corner(Ig4, threshold4, sigma4);
corners5 = harris_corner(Ig5, threshold5, sigma5);
corners7 = harris_corner(Ig7, threshold7, sigma7);


%--- Plotting the Results ---%
% First Figure
subplot(2,2,1)
imshow(Ig);
hold on;
[rows, cols] = find(corners);
plot(cols, rows, 'r.');
hold off;
subplot(2,2,2)
imshow(Ig2);
hold on;
[rows2, cols2] = find(corners2);
plot(cols2, rows2, 'b.');
hold off;
subplot(2,2,3)
imshow(Ig3);
hold on;
[rows3, cols3] = find(corners3);
plot(cols3, rows3, 'g.');
hold off;
subplot(2,2,4)
imshow(Ig4);
hold on;
[rows4, cols4] = find(corners4);
plot(cols4, rows4, 'r.');
hold off;
% Second Figure
figure
subplot(2,2,1)
imshow(Ig5);
hold on;
[rows5, cols5] = find(corners5);
plot(cols5, rows5, 'r.');
hold off;
subplot(2,2,3)
imshow(Ig7);
hold on;
[rows7, cols7] = find(corners7);
plot(cols7, rows7, 'g.');
hold off;
