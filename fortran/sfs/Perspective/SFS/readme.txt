
1.) Take an image on your phone camera, in a dark room with the flash on.
2.) Convert the colour picture to a black and white image by any standard photo editing application.
3.) Edit the image in such a way that all the background noises are morphed by black ink.
4.) Transfer the jpg/jpeg/png file to your working directory.
5.) Open Matlab and go to your working directory.
6.) Run the following commands in the matlab interactive terminal.
	A = imread(‘closed.png');			%Reading the image
	gray = mat2gray(imresize(A,[200,200])); 	%Converting the image to GrayScale
	dlmwrite('closed.txt',gray(:,:,1));		%Writing the matrix into .txt file
7.) A file named closed.txt is dumped to your working directory which will be taken as input for the fortranf90 code.
8.) After the code is successfully run the output file op_neumannf.txt is dumped into the working directory.
9.) We again use Matlab for visualisation of op_neumannf.txt.
10.) Run the program plot2.m for visualising the data.
