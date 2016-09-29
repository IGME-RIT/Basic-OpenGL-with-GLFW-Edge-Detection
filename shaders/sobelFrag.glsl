/*
Title: Edge Detection
File Name: sobelFrag.glsl
Copyright ? 2016
Author: David Erbelding
Written under the supervision of David I. Schwartz, Ph.D., and
supported by a professional development seed grant from the B. Thomas
Golisano College of Computing & Information Sciences
(https://www.rit.edu/gccis) at the Rochester Institute of Technology.

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or (at
your option) any later version.

This program is distributed in the hope that it will be useful, but
WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.
*/


#version 400 core

in vec2 uv;
uniform sampler2D tex;

// The sobel operator
mat3 sx = mat3(1, 2, 1, 0, 0, 0, -1, -2, -1);
mat3 sy = mat3(1, 0, -1, 2, 0, -2, -1, 0, -1);

void main(void)
{
	vec2 g = vec2(0);
	
	// Loop over all pixels within a square
	for(int i = 0; i < 3; i ++)
	{
		for(int j = 0; j < 3; j ++)
		{
			// read from the square of pixels around this pixel
			vec3 s = texelFetch(tex, ivec2(gl_FragCoord) + ivec2(i - 1, j - 1), 0 ).rgb;

			// scale by the corresponding value from the matrix, and add up all the results:
			g.x += sx[i][j] * (s.x + s.y + s.z) / 3; 
			g.y += sy[i][j] * (s.x + s.y + s.z) / 3; 
		}
	}

	// Here we get the length of g (the average change in value over the pixel), and return it as a color!
	gl_FragColor = vec4(vec3(length(g)), 1.0);
}