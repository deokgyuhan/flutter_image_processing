#ifdef __cplusplus

#include "common.h"

extern "C"
{
#endif

    const char *opencvVersion();
    void GaussianBlur(char *path);
    void CannyDetector(char *path);

#ifdef __cplusplus
}
#endif
