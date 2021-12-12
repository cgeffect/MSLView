/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Header for the cross-platform text editing view controller.
*/

@import AppKit;
@import MetalKit;

#include "AAPLRenderer.h"

@interface AAPLEditViewController : NSViewController
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (atomic) AAPLRenderer *renderer;

@end
