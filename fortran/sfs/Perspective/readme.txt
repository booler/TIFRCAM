A = imread(‘closed.png');
gray = mat2gray(imresize(A,[1001,1001]));
dlmwrite('closed.txt',gray(:,:,1));
axis([0,1,0,1,-1.25,-1]);