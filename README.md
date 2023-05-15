# SVD-examples
Some MATLAB code 

intended to show off some applications of the singular value decomposition (SVD).

pcaEX.m transforms some (fabricated) two-dimensional data to plot it along the principal components

SVD_Greyscale.m is an image compression algorithm. It takes in a greyscale image, converts it to a pixel matrix, throws away all singular values below a prescribed threshold threshold, then rewrites the image as a new jpg file
