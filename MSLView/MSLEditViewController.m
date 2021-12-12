//
//  MSLEditViewController.m
//  MSLView
//
//  Created by 王腾飞 on 2021/12/12.
//

#import "MSLEditViewController.h"

@implementation MSLEditViewController
{
    NSString *_dylibString;
    CGFloat spaceToBottomValueStartValue;
    __weak IBOutlet NSLayoutConstraint *spaceToBottomLayoutGuide;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSError *error;
    NSString *pathToFunction = [[NSBundle mainBundle] pathForResource:@"AAPLUserCompiledFunction.metal"
                                                               ofType:nil];
    _dylibString = [NSString stringWithContentsOfFile:pathToFunction
                                             encoding:NSUTF8StringEncoding
                                                error:&error];

    NSAssert(_dylibString, @"Failed to load kernel string from file: %@", error);

    [_textView setString:_dylibString];
}

/// When the "Compile" button is clicked the source for this dynamic library from the text view
/// will be compiled on the fly and inserted via insertLibraries.
- (IBAction)onClick:(NSButton *)sender
{
    [_renderer compileDylibWithString:[_textView string]];
}

@end
