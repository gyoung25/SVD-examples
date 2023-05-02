%% 
%%This program uses the singular value decomposition (SVD) to compress a
%%greyscale image by setting all singular values below a prescribed
%%threshold equal to zero.

%%
%Read in the (greyscale) image as a pixel matrix
A = imread('greyDog.jpg');

%convert the entries of A into doubles
A = double(A);

%Store the size of matrix A is mxn
[m,n] = size(A);

%Store the singular value decomposition in matrices U, S, and V.  U is an
%mxm orthogonal matrix, V is an nxn orthogonal matrix, and S is an
%mxn diagonal matrix, with A's singular values on the diagonal
tic
approxA=zeros(m,n);                                                 
[U,S,V] = svd(A);
Sapprox=S.*(S>max(max(S))/300);
numSingVals=nnz(Sapprox)
approxA=U*Sapprox*V';
toc

% tic
% Sapprox=S.*(S>max(max(S))/400);
% 
% numSingVals=nnz(Sapprox)
% approxA = U*Sapprox*V';
% toc


%convert the entries of A back to uint8
approxA = uint8(approxA);

%make new jpg file of compressed image
imwrite(approxA, 'compressedDog.jpg','jpg')

