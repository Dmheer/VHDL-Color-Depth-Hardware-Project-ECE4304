close all; 
image_name = 'red_cat_lel.jpg';
I = imread(image_name);
imshow(I);
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