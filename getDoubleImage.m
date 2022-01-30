function imr=getDoubleImage(im)

%{

The function re-scales an image from uint8 (0-255) to double (0-1) image.

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

if isinteger(im) == 1
    imr = double(im)/255;
else
    imr = im;
end