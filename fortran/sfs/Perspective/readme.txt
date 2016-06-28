A = imread('dog.png');
gray = mat2gray(imresize(A,[201,201]));
dlmwrite('closed.txt',gray(:,:,1));
axis([0,1,0,1,-1.25,-1]);