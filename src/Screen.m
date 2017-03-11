#import "Screen.h"
#import "config.h"

@implementation Screen

@synthesize service;
@synthesize key;

- (id)init {
    self = [super init];
    if (self != nil) {
        self.service = CGDisplayIOServicePort(CGMainDisplayID());
        self.key = CFSTR(kIODisplayBrightnessKey);
    }
    return self;
}

- (void)setBright:(float)b {
    b = fmin(1.0, fmax(0.0, b));
    IODisplaySetFloatParameter(self.service, 0, self.key, b);
}

- (float)getBright {
    float b = 0;
    IODisplayGetFloatParameter(self.service, 0, self.key, &b);
    return b;
}

- (void)changeBy:(float)delta {
    [self setBright:[self getBright] + delta];
};

- (void)callback {
    [self changeBy:BRIGHTNESS_INCREMENT];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    NSTimer* timer = [NSTimer scheduledTimerWithTimeInterval:1
                                                      target:self
                                                    selector:@selector(callback)
                                                    userInfo:nil
                                                     repeats:YES];

    [NSEvent addGlobalMonitorForEventsMatchingMask:NSLeftMouseDownMask
                                           handler:^(NSEvent* event) {
                                               [self changeBy:BRIGHTNESS_DECREMENT];
                                           }];
}
 
@end
