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
    void medianBlur(char *path) {
        Mat img = imread(path);
        Mat temp;
        for(int i = 1; i < 31; i =i+2) {
            medianBlur(img, temp, i);
        }

        imwrite(path, temp);
    }
}
