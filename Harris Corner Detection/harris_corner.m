function corners = harris_corner(I, threshold, sigma)

% Image Converting to Grayscale
Ig = im2gray(I);

% Gradients Computation
I_x = conv2(Ig, [-1 0 1], 'same');
I_y = conv2(Ig, [-1; 0; 1], 'same');

% Gaussian kernel for smoothing
gaussian_kernel = fspecial('gaussian', [3 3], sigma);

% Compute products of gradients
I_x2 = conv2(I_x.^2, gaussian_kernel, 'same');
I_y2 = conv2(I_y.^2, gaussian_kernel, 'same');
I_xy = conv2(I_x.*I_y, gaussian_kernel, 'same');

% Harris Corner Detection Response Function
response = (I_x2.*I_y2 - I_xy.^2) - 0.04 * (I_x2 + I_y2).^2;

% Thresholding
corners = (response > threshold);

end
