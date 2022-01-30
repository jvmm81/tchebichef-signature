# tchebichef-signature
Texture characterisation by using Tchebichef moments

Discrete Tchebichef moments (DTM) were introduced by R. Mukundan et al. (see R. Mukundan, S.H. Ong, and P.A. Lee, “Image analysis by Tchebichef moments,” IEEE Trans. Image Process. 10, 1357-1364, 2001) in order to overcome the limitations of conventional orthogonal moments based on Legendre and Zernike polynomials. DTM are computed by projecting the original image f(x,y) (x, y = 0, 1, …, N - 1) onto a set of Tchebichef polynomial kernels, which include basis functions of the DCT as a special case. The moment Tpq (p, q = 0, 1, …, N - 1) of order s = p + q is obtained from the Tchebichef kernel rpq(x,y). The orthogonality between Tchebichef polynomials ensures exact image reconstruction from the set of moments Tpq.

The value of Tpq can be interpreted as the correlation between the image f(x,y) and the discrete Tchebichef polynomial rpq(x,y). These kernel functions are characterized by an oscillating behavior, showing a sine-like profile. Fig. 1 shows the set of Tchebichef kernels for N = 8 in both spatial and frequency domains. As can be observed, as the order of the kernel increases, the energy of the kernel function tends to be concentrated in higher frequencies.

![image](https://user-images.githubusercontent.com/54883803/151695426-03775b7c-2d5c-4b66-9eb1-6e2d1622c82d.png)

Fig. 1 Tchebichef kernels

The kernel rpq(x,y) acts as a filter for the computation of Tpq. The magnitude of Tpq will be higher for images oscillating at a similar rate to rpq(x,y) along both directions. This is an interesting property for texture analysis since texture involves the spatial repetition of intensity patterns. Thus, a description of texture properties can be obtained by assessing the dependence of the moment magnitude on the order s, which is related to the frequency content of the kernels. For this purpose, the following feature vector M(s) (s = 1, …, 2N - 2) is proposed:

![image](https://user-images.githubusercontent.com/54883803/151695460-1a055449-b1a4-443a-a644-5042f602722a.png)

The feature M(s) provides information about the properties of the texture and can be viewed as a texture signature. To evaluate the specific attributes captured by M(s), the behavior of Tchebichef kernels in both spatial and frequency domains is studied. An example of M(s) is shown in Fig. 2.

![image](https://user-images.githubusercontent.com/54883803/151695448-f65fe21a-90e5-46a0-a7b1-f55ff35ca4f7.png)

Fig. 2. Tchebicheff signatures extracted from three Brodatz textures

A detailed analysis on the properties of M(s) in the context of texture characterization can be found in the following paper:

[1] J.V. Marcos and G. Cristobal, “Texture classification using discrete Tchebichef moments”, JOSA A, Vol. 30, Issue 8, pp. 1580-1591 (2013)

The project includes the Matlab functions to compute the texture signature M(s) from an image of size NxN pixels. Call the function “M = getTchebichefSignature(im)”, where “im” denotes the input image, to obtain its signature in the variable “M”. Please, cite our article when using this software in your studies.
