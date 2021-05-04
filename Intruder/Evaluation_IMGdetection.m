                     
%% Read in Images
[filename1,pathname1] = uigetfile('*.*','Select the 1st Image'); 
filewithpath1 = strcat(pathname1,filename1);
img1 = imread(filewithpath1);
[filename2,pathname2] = uigetfile('*.*','Select the 2nd Image');
filewithpath2 = strcat(pathname2,filename2);
img2 = imread(filewithpath2);



%%  Display Color Images
figure
imshow(img1);
figure
imshow(img2);

%% Convert Images to Black and White
img1BW = rgb2gray(img1);
img2BW = rgb2gray(img2);

%% Display black and white images

figure
imshow(img1BW);
figure
imshow(img2BW);

%% Subtract Images
imgDiff = abs(img1BW - img2BW);
% simple math operation since imgs are made of matrices
% imDiff = imsubtract(img1BW - img2BW);
figure
imshow(imgDiff);

%% Find Maximium Location of Difference
maxDiff = max(max(imgDiff));
[iRow,iCol] = find(imgDiff == maxDiff);
[m,n] = size(imgDiff);

imshow(imgDiff);
hold on
plot(iCol,iRow,'r*')

%% Use imtool to Determine Threshold and Length
imtool(imgDiff);

%% Threshhold Image
imgThresh = imgDiff > 8;
figure
imshow(imgThresh);
hold on
plot(iCol,iRow,'r*')
hold off

%% Fill in Regions
imgFilled = bwareaopen(imgThresh, 15);
figure
imshow(imgFilled);

%% Overlay Onto Original Image
% Utility from File Exchange

imgBoth = imoverlay(img2,imgFilled,[1 0 0]);
figure
imshow(imgBoth);

%% Only Care About Things Large Than 80

imageStats = regionprops(imgFilled, 'MajorAxisLength');

imgLengths = [imageStats.MajorAxisLength];
idx = imgLengths > 80;
imageStatsFinal = imageStats(idx);
disp(imageStatsFinal);

%% Determine if Change is Significant

if isempty(imageStatsFinal)
    disp('Nothing Different Here')
else
    disp('Something is Here!')
end

