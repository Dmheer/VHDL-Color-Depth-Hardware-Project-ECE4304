RGB = imread('angrydognoises.jpg');
[X,map] = rgb2ind(RGB,4);
imshow(X, map);
csvwrite('index.txt',X);
csvwrite('colormap.txt',map);
quantizedmap = map/(1/16);
csvwrite('roundedrgb.txt',round(quantizedmap));
RGBver = ind2rgb(X, round(quantizedmap)/16);
imshow(RGBver);