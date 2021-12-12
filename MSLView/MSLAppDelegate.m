/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Implementation of the cross-platform app delegate.
*/

#import "MSLAppDelegate.h"

@implementation MSLAppDelegate
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender
{
    return YES;
}

@end

