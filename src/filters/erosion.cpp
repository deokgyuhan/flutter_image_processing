#include "../flutter_image_processing.h"

#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/imgcodecs.hpp>

using namespace cv;
using namespace std;

extern "C"
{
    FUNCTION_ATTRIBUTE
    void erosion(char *path, int erosion_type, int erosion_elem, int erosion_size)
    {
     int const max_elem = 2;
     int const max_kernel_size = 21;

     if( erosion_elem == 0 ){ erosion_type = MORPH_RECT; }
     else if( erosion_elem == 1 ){ erosion_type = MORPH_CROSS; }
     else if( erosion_elem == 2) { erosion_type = MORPH_ELLIPSE; }
     Mat element = getStructuringElement( erosion_type,
     Size( 2*erosion_size + 1, 2*erosion_size+1 ),
     Point( erosion_size, erosion_size ) );

     Mat img = imread(path);
     Mat temp;
     erode( img, temp, element);

     imwrite(path, temp);
    }

}
