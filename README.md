# Bone_Segmentation
Bone Segmentation from MRI

Completed in fullfilment of the Digital Image Processing Course at BITS Pilani
Advisor: Dr. K K Gupta_

The main objective of this project is to segment, i.e. separate the bone from the tissues and other visible softer substances in the MRI. Designed to be agnostic to the anatomy of the part being scanned, be it the MRI of the knee, brain, hip, etc. It enables the doctors and hospitals by helping them look at bone or tissue selectively depending on the patient and making interpreting MRI’s easier. 

1. "Sobel_Final.m" - Sobel Filter based heuristic thresholding with an adaptive threshold (pre-processing steps implemented).
2. "Dilation_Sobel.m" - Sobel filtering and dilation hybrid method for segmentation (pre-processing steps implemented).
3. "Snakes.m" - Active contouring based thresholding implemented (pre-processing steps implemented).
4. "Otsu.m" - Otsu's thresholding implementation.

Please use fudge factors based on the suggestions in the corresponding files.

"Soebl_Function.m" uses the inbuilt MATLAB Sobel Thresholding capability. The "Sobel_Implementation.m" file has the basic Sobel thresholding implementation.

Feel free to use any off the shelf standard MRI image for your testing.
