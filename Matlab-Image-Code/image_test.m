close all; 
I = imread('red_cat_lel.jpg');
imshow(I);
dlmwrite('dataexport.txt',I,'newline','pc');
threshForPlanes = zeros(3,7);			

for i = 1:3
    threshForPlanes(i,:) = multithresh(I(:,:,i),7);
end
quantPlane = zeros( size(I) );

for i = 1:3
    value = [0 threshForPlanes(i,2:end) 255]; 
    quantPlane(:,:,i) = imquantize(I(:,:,i),threshForPlanes(i,:),value);
end

quantPlane = uint8(quantPlane);
imshowpair(I,quantPlane,'montage')
title('Gay                                                         Boy');
% Extract color channels.
redChannel = I(:,:,1); % Red channel
greenChannel = I(:,:,2); % Green channel
blueChannel = I(:,:,3); % Blue channel
dlmwrite('red_channel_b.txt',fliplr(de2bi(redChannel)),'');
dlmwrite('green_channel_b.txt',fliplr(de2bi(greenChannel)),'');
dlmwrite('blue_channel_b.txt',fliplr(de2bi(blueChannel)),'');
dlmwrite('red_channel.txt',redChannel,'newline','pc');
dlmwrite('green_channel.txt',greenChannel,'newline','pc');
dlmwrite('blue_channel.txt',blueChannel,'newline','pc');