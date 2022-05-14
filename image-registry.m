clc;
close all;
[image] = imread('teste2.jpg');
%imshow(image);
imageRotated = imrotate(image, 180,'cubic','crop');
%imshow(imageRotated);

% Get the dimensions of the image.
% numberOfColorBands should be = 1.
[rows, columns, numberOfColorBands] = size(image);
if numberOfColorBands > 1
  % It's not really gray scale like we expected - it's color.
  % Convert it to gray scale by taking only the green channel.
  grayImage = image(:, :, 2); % Take green channel.
else
  grayImage = image;
end
% Display the original gray scale image.
subplot(2, 2, 1);
imshow(grayImage, []);
fontSize = 20;
title('Original Grayscale Image', 'FontSize', fontSize, 'Interpreter', 'None');
% Set up figure properties:
% Enlarge figure to full screen.
set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
% Get rid of tool bar and pulldown menus that are along top of figure.
set(gcf, 'Toolbar', 'none', 'Menu', 'none');
% Give a name to the title bar.
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')
% Display the original gray scale image.
subplot(2, 2, 2);
F=fft2(grayImage);
S=fftshift(log(1+abs(F)));
%imshow(S,[]);
%plot(S);
polar(S);
title('Spectrum Image', 'FontSize', fontSize, 'Interpreter', 'None');



[rows, columns, numberOfColorBands] = size(imageRotated);

if numberOfColorBands > 1
  grayImageRotated = imageRotated(:, :, 2);
else
  grayImageRotated = imageRotated;
end

subplot(2, 2, 3);
imshow(grayImageRotated, []);
fontSize = 20;
title('Original Grayscale Image', 'FontSize', fontSize, 'Interpreter', 'None');

set(gcf, 'Units', 'Normalized', 'OuterPosition', [0 0 1 1]);
set(gcf, 'Toolbar', 'none', 'Menu', 'none');
set(gcf, 'Name', 'Demo by ImageAnalyst', 'NumberTitle', 'Off')

subplot(2, 2, 4);
F=fft2(grayImageRotated);
S=fftshift(log(1+abs(F)));
P = cart2pol(S);
plot(P);
title('Spectrum Image', 'FontSize', fontSize, 'Interpreter', 'None');
