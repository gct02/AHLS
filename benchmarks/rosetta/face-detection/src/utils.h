/*===============================================================*/
/*                                                               */
/*                           utils.h                             */
/*                                                               */
/*                       Utility functions                       */
/*                                                               */
/*===============================================================*/

#include "typedefs.h"
#include <string>

void print_usage(char* filename);

void parse_command_line_args(
    int argc,
    char** argv,
    unsigned char Data[IMAGE_HEIGHT][IMAGE_WIDTH]);

