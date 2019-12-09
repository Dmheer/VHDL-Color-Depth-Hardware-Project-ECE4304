close all;                                      %close all figures
Row_Count = 512;                                %picture height
Coloumn_count = 512;                            %picture width
original_image= 'Mohamed_El-Hadedy.jpg';              %orignal image
single_recompacted_image = 'aly.jpg';     %new image
montage_image = 'alymontage.jpg';           %them put together
r_txt = 'output_red.txt';                       %red channel 
g_txt = 'output_green.txt';                     %green channel 
b_txt = 'output_blue.txt';                      %blue channel 
O_I = imread(original_image);                   %read the original image
r_f = strsplit(fileread(r_txt), {'\r', '\n'});  %read file and split into lines
g_f = strsplit(fileread(g_txt), {'\r', '\n'});  %read file and split into lines
b_f = strsplit(fileread(b_txt), {'\r', '\n'});  %read file and split into lines
r_int8= zeros(Row_Count,Coloumn_count);         %precreate our matrices
b_int8= zeros(Row_Count,Coloumn_count);         %precreate our matrices
g_int8= zeros(Row_Count,Coloumn_count);         %precreate our matrices
r_count = 1;                                    %establish count
c_count = 1;                                    %establish count
for i=1:(Row_Count*Coloumn_count)
    r_array = fliplr(bin2dec(r_f(i)));           %convert binary to decimal and flip for matlab
    g_array = fliplr(bin2dec(g_f(i)));           %convert binary to decimal and flip for matlab
    b_array = fliplr(bin2dec(b_f(i)));           %convert binary to decimal and flip for matlab
    r_int8(r_count,c_count) = int8(r_array)*16;  %multiply to obtain amplitutde
    g_int8(r_count,c_count) = int8(g_array)*16;  %multiply to obtain amplitutde
    b_int8(r_count,c_count) = int8(b_array)*16;  %multiply to obtain amplitutde
    r_count = r_count+1;                         %increment our row
    if(r_count == Row_Count+1)                   %if we are done counting down
       c_count = c_count+1;                      %move to next column
       r_count = 1;                              %reset count
    end
end
R_final = uint8(r_int8);                         %cast to unsigned 8 bit integer
G_final = uint8(g_int8);                         %cast to unsigned 8 bit integer
B_final = uint8(b_int8);                         %cast to unsigned 8 bit integer

rgbImage(:,:,1) = uint8(R_final);                %store result in r channel
rgbImage(:,:,2) = uint8(G_final);                %store result in g channel
rgbImage(:,:,3) = uint8(B_final);                %store result in b channel


f_single=figure;                                 %create figure
imshow(rgbImage)
title('Color Depth Changed to 4 bits');
saveas(f_single,single_recompacted_image,'jpeg');

f_pair=figure;                                   %create figure
imshowpair(rgbImage,O_I,'montage')
title('4bit                                                         8bit');
saveas(f_pair,montage_image,'jpeg');
