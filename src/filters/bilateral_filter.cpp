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
    void bilateralFilter(char *path) {
        Mat img = imread(path);
        Mat temp;
        bilateralFilter(img, temp, 0, 0, 0);
        imwrite(path, temp);
    }
}
