# VHDL-Color-Depth-Hardware-Project-ECE4304

How to use 
1. Pick an Image 
2. If not a Jpeg convert to one
3. Use Image_test.m script to output the channels into txt files note: change the names of the file to match yours
4. Use the bit_reducer.vhd source and bit_reducer_tbv3 located in hardware/tb/tb_txt 
5. Ensure the directorys are correct in bit_reducer_tbv3
6. Run the simulation for 1ms
7. It should output r,g, and b outputs
8. Use the Image_make.m with the r,g, and b outputs from the previous step with this script to reconstruct the image










Reconfigurable hardware is a term used for merging the two different mediums of hardware and software and how they interact with one another. This computing technique performs calculations in a hardware platform while presenting the solution in the format of software in order to boost performance. This allows developers to have a fast, reliable and accurate solution to solve many system problems. Our reconfigurable hardware in this context is an FPGA (field programmable gate array) board. An FPGA board acts as a powerful computing solution in order to load, calculate, and process information. The FPGA was specifically chosen since it is completely reconfigurable and allows for different kinds of logic depending on the solution needed. The project aims to use this reconfigurable hardware solution in the realm of computer graphics for color quantization in which an image’s original RGB colors are reduced and the image is then reproduced to a similar looking image but at a smaller size. Our project is a 4-stage process in which our hardware (FPGA) stores an image of any color depth and size, reduces this color depth and outputs it to MATLAB in order to be displayed.  This project in turn, aims to solve problems in system incompatibility in terms of an image being unable to be displayed on a screen.
