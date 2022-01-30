function M = getTchebichefSignature(im)

%{
M = getTchebichefSignature(im)

The function computes the signature that describes the properties of the texture image using the method based on discrete Tchebichef moments.
Input:
im: original image (uint8) of size NxN
Output:
M: texture signature (double) of length 2N - 2 (the element corresponding to the DC component is removed)

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

im = getDoubleImage(im);

[num_rows, num_cols] = size(im);
num_diags = (num_rows + num_cols - 1);

T = computeTchebMoment(im);
T_mirror = computeMirrorImage(T);
clear T;

for k=-(num_diags-1)/2:1:(num_diags-1)/2
    aux(1,k + ((num_diags-1)/2) + 1) = sum(abs(diag(T_mirror,k)));
end
clear T_mirror;
M = computeMirrorImage(aux);

% The DC component of the texture is removed
M = M(2:length(M));

