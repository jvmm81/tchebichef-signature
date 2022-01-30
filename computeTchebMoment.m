function [Tmn, tm_hat, tn_hat] = computeTchebMoment(im)

%{

[Tmn, tm_hat, tn_hat] = computeTchebMoment(im)

The function calculates the matrix of discrete Tchebychef moments for
an input image.

im: input image (double)

Tmn: matrix of discrete Tchebichef moments
tm_hat and tn_hat: univariate Tchebichef polynomials

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

[num_rows,num_cols] = size(im);

% Matrix of Tchebychef polynomials evaluated at x=0:1:num_rows-1. The degree
% (m) of the polynomials is in the range from 0 to num_rows-1

tm_hat = computePolyMatrix(num_rows);

% Matrix of Tchebychef polynomials evaluated at y=0:1:num_cols-1. The degree
% (n) of the polynomials is in the range from 0 to num_cols-1

tn_hat = computePolyMatrix(num_cols);

% Compute the matrix Tmn that contains the moments

Tmn = tm_hat'*im*tn_hat;