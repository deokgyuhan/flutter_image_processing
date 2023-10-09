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
    void dilation(char *path, int dilation_type, int dilation_elem, int dilation_size)
    {
     int const max_elem = 2;
     int const max_kernel_size = 21;

     if( dilation_elem == 0 ){ dilation_type = MORPH_RECT; }
     else if( dilation_elem == 1 ){ dilation_type = MORPH_CROSS; }
     else if( dilation_elem == 2) { dilation_type = MORPH_ELLIPSE; }
     Mat element = getStructuringElement( dilation_type,
     Size( 2*dilation_size + 1, 2*dilation_size+1 ),
     Point( dilation_size, dilation_size ) );

     Mat img = imread(path);
     Mat temp;

     dilate(img, temp, element );
     imwrite(path, temp);
    }
}
