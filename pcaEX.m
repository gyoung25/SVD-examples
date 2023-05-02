function pcaEX()

    %generate "data"
    x=rand(100,1);
    y=-2*x+.2*randn(100,1);
    
    %translate data so each column has mean 0
    xBar=x-mean(x);
    yBar=y-mean(y);
    
    %define the data matrix
    Z=[xBar yBar];
    
    %We have options for how we proceed. The first option is to compute the
    %covariance matrix of Z and then take the SVD of that. The covariance
    %matrix is a square, symmetric matrix of dimension min(m,n), where m
    %and n are the dimensions of Z, and consequently svd(cov(Z)) returns 
    %matrixes U, S, and V of (releatively) small dimension, which might be
    %easier to think about/look at. The second option is to compute the
    %SVD of Z itself. Z are the eigenvalues of Z'*Z,is a constant multiple
    %of cov(Z), and so the SVD of Z itself will return the same orthonormal
    %basis of the domain space (which is the only basis we'll care about, 
    %stored in the columns of matrix V) as cov(Z) with the same ordering of
    %singular values (the singular values of Z are a constant multiple of
    %the square root of the singular values of cov(Z)). I'll just use Z 
    %here, since it's one fewer computation.
    
    %compute SVD of the 
    [U,S,V]=svd(Z);
    
    %in case we want a vector of singular values
    singZ=S(S~=0);
    
    %extract the columns of V to use as new coordinate system (basis)
    %these vectors define the principal components
    v1=V(:,1);
    v2=V(:,2);

    %put our data matrix Z into the new coordinate system
    Zpca=Z*V;
    
    figure
    hold on
    plot(Z(:,1),Z(:,2),'or')
    plot(Zpca(:,1),Zpca(:,2),'ob')
    plot([-10*v1(1) 10*v1(1)],[-10*v1(2) 10*v1(2)],'m','linewidth',2)
    plot([-10*v2(1) 10*v2(1)],[-10*v2(2) 10*v2(2)],'c','linewidth',2)
    axis([-1 1 -1 1])
    xlabel('X')
    ylabel('Y')
    legend('Original coordinates','PC coordinates')
    set(gca,'fontsize',20) %this sets the axis label font size
    
end