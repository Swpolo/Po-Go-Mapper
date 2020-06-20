#include <iostream>
#include <unordered_map>
#include <opencv4/opencv2/imgproc.hpp>
#include <opencv4/opencv2/imgcodecs.hpp>
#include <opencv4/opencv2/core.hpp>

using namespace std;
using namespace cv;


int main( int argc, char** argv )
{
    Mat src, gray, roi, binary;
    unordered_map<string, Rect> rects;
    rects["1080x1920"] = Rect(250, 150, 650, 140); 

    String imageName("../stuff.jpg"); // by default
    src = imread( samples::findFile( imageName ), IMREAD_COLOR); // Load an image
    if (src.empty())
    {
        cout << "Cannot read the image: " << imageName << std::endl;
        return -1;
    }
    cvtColor( src, gray, COLOR_BGR2GRAY ); // Convert the image to Gray
    roi = Mat(gray, rects["1080x1920"]);
    threshold(roi, binary, 210, 255, THRESH_BINARY); 
    binary = ~binary;

    imwrite( "../result.jpg", binary);
    return 0;
}