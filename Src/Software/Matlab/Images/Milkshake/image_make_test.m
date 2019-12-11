redChannel = zeros(100, 100, 'uint8');
greenChannel = zeros(100, 100, 'uint8');
blueChannel = zeros(100, 100, 'uint8');
redChannel(1:50,:) = 255;
greenChannel(:, 1:50) = 255;
blueChannel(51:100, 51:100) = 255;
coloredImage = cat(3, redChannel, greenChannel, blueChannel);
imshow(coloredImage)
dlmwrite('dataexport.txt',coloredImage,'newline','pc');