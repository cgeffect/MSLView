/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Header for the cross-platform text editing view controller.
*/

@import AppKit;
@import MetalKit;

#include "MSLRenderer.h"

@interface AAPLEditViewController : NSViewController
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (atomic) MSLRenderer *renderer;

@end
