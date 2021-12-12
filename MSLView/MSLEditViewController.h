//
//  MSLEditViewController.h
//  MSLView
//
//  Created by 王腾飞 on 2021/12/12.
//

@import AppKit;
@import MetalKit;

#include "MSLRenderer.h"

@interface MSLEditViewController : NSViewController
@property (unsafe_unretained) IBOutlet NSTextView *textView;
@property (atomic) MSLRenderer *renderer;

@end
