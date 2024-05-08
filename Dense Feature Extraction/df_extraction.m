% Specify the directory containing the images
imageDir = '/Users/macbookair/Desktop/University/EEE 3.2/Biomedical System Design/Image Processing with MATLAB/Homeworks/HW6/Harris Corner Detection';

% Get a list of all image files in the directory
imageFiles = dir(fullfile(imageDir, '*.jpg')); % Change the file extension if needed

% Initialize an empty cell array to store the images
images = cell(1, numel(imageFiles));

% Loop through each image file and load it
for i = 1:numel(imageFiles)
    imagePath = fullfile(imageDir, imageFiles(i).name);
    images{i} = imread(imagePath);
end

% Display the loaded images
figure;
numImages = numel(images);
for i = 1:numImages
    subplot(1, numImages, i);
    imshow(images{i});
    title(['Image ', num2str(i)]);
end

% Specify the desired image size
targetSize = [256, 256]; % Change the size as per your needs

% Initialize an empty cell array to store the preprocessed images
preprocessedImages = cell(size(images));

% Loop through each image and preprocess it
for i = 1:numel(images)
    preprocessedImages{i} = imresize(images{i}, targetSize);
end

% Initialize an empty cell array to store the extracted features
features = cell(size(preprocessedImages));

% Create a HOG feature extractor object
hogExtractor = extractHOGFeatures('CellSize', [16 16], 'BlockSize', [2 2], 'NumBins', 9);

% Loop through each preprocessed image and extract features
for i = 1:numel(preprocessedImages)
    features{i} = extractFeatures(hogExtractor, preprocessedImages{i});
end


