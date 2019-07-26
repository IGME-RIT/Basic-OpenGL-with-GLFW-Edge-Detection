Documentation Author: Niko Procopi 2019

This tutorial was designed for Visual Studio 2017 / 2019
If the solution does not compile, retarget the solution
to a different version of the Windows SDK. If you do not
have any version of the Windows SDK, it can be installed
from the Visual Studio Installer Tool

Welcome to the Edge Detection Tutorial!
Prerequesites: Render-To-Texture

The main focus of this tutorial will be Assets/sobelFrag.glsl

For each pixel, we check one to the left, one to the right,
one above, under, and each corner. We check the difference
in the color between the pixels, and larget difference results
in larget 'g'. 'g' is the aaverage change in the color in
the 3x3 grid of pixels

We return 'g' as a color, because more 'g' means more variation
in color, edges in surfaces have higher 'g' because of more variation