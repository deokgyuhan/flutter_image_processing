#include "flutter_image_processing.h"

#include <iostream>
#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>

using namespace cv;
using namespace std;

extern "C"
{
    FUNCTION_ATTRIBUTE
    void CannyDetector(char *path) {
        cv::Mat src, src_gray;
        cv::Mat dst, detected_edges;
        int lowThreshold = 0;
        const int max_lowThreshold = 100;
        const int ratio = 3;
        const int kernel_size = 3;

        src = cv::imread(path);
        cv::cvtColor( src, src_gray, cv::COLOR_BGR2GRAY );

        cv::blur( src_gray, detected_edges, cv::Size(3,3) );
        cv::Canny( detected_edges, detected_edges, lowThreshold, lowThreshold*ratio, kernel_size );
        dst = cv::Scalar::all(0);
        src.copyTo( dst, detected_edges);

        cv::imwrite(path, dst);
    }
}
