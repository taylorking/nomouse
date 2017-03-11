#import <Cocoa/Cocoa.h>
#import "Screen.h"

int main(int argc, char** argv)
{
    @autoreleasepool {
        Screen* screen = [[Screen alloc] init];
        [[NSApplication sharedApplication] setDelegate:screen];
        [NSApp run];
    }
    return 0;
}
