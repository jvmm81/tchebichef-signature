function t_hat = computePolyMatrix(N)


%{

The function computes Tchebychef polynomials of degree from 0 to N-1 at points 0:1:N-1

This script implements the method described in the paper by Mukundan:

R. Mukundan, "Some Computational Aspects of Discrete Orthonormal Moments"
IEEE Transactions on Image Processing, 13, pp. 1055-1059, 2004.

The matrix 't_hat' will be used to store the value of the 'N' polynomials
evaluated at'N' different points. The rows of the matrix indicates the point at which
the polynomial is evaluated. The column indicates the polynmial degree.

COPYRIGHT NOTICE
This software module was developed by the PIMOD Group of the Instituto de Optica (CSIC), Spain.
This software is provided 'as-is', without any express or implied warranty. In no event will the author
be held liable for any damages arising from the use of this software. The Spanish Research Council (CSIC)
retain full right to modify and use the code for their own purpose, assign or donate the code
to a third party, and to inhibit third parties from using the code for their products,
unless otherwise specified by contracts where CSIC is one of the contract parties. This copyright notice
must be included in all copies or derivative works. For information on its use, applications and associated
permission for use, please contact Dr. Gabriel Cristobal (gabriel(at)optica.csic.es)
or Dr. J. Victor Marcos (jvmarcos(at)gmail.com). Detailed information on the activities of the PIMOD group
can be found at http://www.iv.optica.csic.es/. Please cite our paper if you find this software useful.
Copyright © CSIC 2014.

%}

t_hat = zeros(N,N);

% First, the value tn_hat(0) is obtained for all the polynomials

t_hat(:,1)=1/sqrt(N);

% The value tn(0) is obtained from the following recursive equation: tn(0)
% = -sqrt((N-n)/(N+n))*sqrt((2n+1)/(2n-1))*tn-1(0)

for i=2:1:N
    t_hat(1,i)=-sqrt((N-(i-1))/(N+(i-1)))*sqrt((2*(i-1)+1)/(2*(i-1)-1))*t_hat(1,i-1);
end

% Second, a recursive method is used to compute the value of all the
% polynomials at every point

% The value of tn(1) is comuted for every n

t_hat(2,2:N)=(1+(1:1:N-1).*(1+(1:1:N-1))/(1-N)).*t_hat(1,2:N);

% For every polynomial of degree n, its value is computed for the first N/2 points
% of the vector x

n = 1:1:N-1;

for i=3:1:ceil(N/2)    
    x=i-1;
    gamma1 = (-n.*(n+1)-(2*x-1)*(x-N-1)-x)/(x*(N-x));
    gamma2 = (x-1)*(x-N-1)/(x*(N-x));
    t_hat(i,2:N) = gamma1.*t_hat(i-1,2:N) + gamma2.*t_hat(i-2,2:N);
end

% Then, the symmetry property for each polynomial of degree n is used
% tn(N-1-x)=(-1)^n*tn(x), n=1, ..., N-1; x=2,..., N/2

for n=1:1:N-1
    for i=ceil(N/2)+1:1:N
        t_hat(i,n+1) = (-1)^(n)*t_hat(N+1-i,n+1);
    end
end



