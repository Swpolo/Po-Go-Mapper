#include <iostream>
#include <unordered_map>

#include "curl/curl.h"

#include <opencv4/opencv2/imgproc.hpp>
#include <opencv4/opencv2/imgcodecs.hpp>
#include <opencv4/opencv2/core.hpp>

using namespace std;
using namespace cv;

// CURL download from: https://answers.opencv.org/question/91344/load-image-from-url/
size_t write_data(char *ptr, size_t size, size_t nmemb, void *userdata)
{
    vector<uchar> *stream = (vector<uchar>*)userdata;
    size_t count = size * nmemb;
    stream->insert(stream->end(), ptr, ptr + count);
    return count;
}

cv::Mat curlImg(const char *img_url, int timeout=10)
{
    vector<uchar> stream;
    CURL *curl = curl_easy_init();
    curl_easy_setopt(curl, CURLOPT_URL, img_url); //the img url
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, write_data); // pass the writefunction
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &stream); // pass the stream ptr to the writefunction
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, timeout); // timeout if curl_easy hangs, 
    CURLcode res = curl_easy_perform(curl); // start curl
    curl_easy_cleanup(curl); // cleanup
    return imdecode(stream, -1); // 'keep-as-is'
}

int main(int argc, char** argv )
{
    if (argc < 3) {
        cout << "invalide parameter" << endl;
        cout << "argc: " << argc << endl;
        cout << "argv: " << argv << endl;
        return -1;
    }
    Mat src, gray, roi, binary;
    
    String imageName(argv[1]); // by default
    src = curlImg(argv[1], 10);
    // imread(samples::findFile(imageName), IMREAD_COLOR); // Load an image
    if (src.empty())
    {
        cout << "Cannot read the image: " << imageName << std::endl;
        return -1;
    }
    cvtColor( src, gray, COLOR_BGR2GRAY ); // Convert the image to Gray

    // Temporary (and oddly successful) solution for determining the ROI
    // Values are based on a 1080x1920 image for the proper ROI
    // They are then normalized to the current image size
    // Only work for portrait mode, will definitly fail for tablets
    Rect rect_roi = Rect(
        250 * src.size().width / 1080,
        150 * src.size().height / 1920,
        650 * src.size().width / 1080,    
        120 * src.size().height / 1920
    );
    roi = Mat(gray, rect_roi);
    threshold(roi, binary, 210, 255, THRESH_BINARY); 
    binary = ~binary;

    String filename = String(argv[2]) + ".jpg";
    imwrite( filename, binary);
    return 0;
}