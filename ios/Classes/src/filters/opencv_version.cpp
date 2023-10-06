#include "flutter_image_processing.h"

#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

extern "C"
{
    FUNCTION_ATTRIBUTE
    const char* opencvVersion()
    {
        return CV_VERSION;
    }
}

