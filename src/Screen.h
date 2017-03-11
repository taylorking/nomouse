#import <Cocoa/Cocoa.h>
#import <IOKit/graphics/IOGraphicsLib.h>
#import <ApplicationServices/ApplicationServices.h>
#import <appkit/NSEvent.h>

@interface Screen : NSObject <NSApplicationDelegate>

@property io_service_t service;
@property CFStringRef key;

- (id)init;
- (void)setBright:(float)b;
- (float)getBright;
- (void)changeBy:(float)delta;
- (void)callback;
- (void)applicationDidFinishLaunching:(NSNotification*)aNotification;

@end
