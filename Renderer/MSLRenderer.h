/*
See LICENSE folder for this sample’s licensing information.

Abstract:
Header for the renderer class that performs Metal setup and per-frame rendering.
*/

#ifndef MSLRenderer_h
#define MSLRenderer_h

@import MetalKit;

// Platform independent renderer class
@interface MSLRenderer : NSObject<MTKViewDelegate>

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;
- (void)compileDylibWithString:(NSString *_Nonnull)programString;

@end

#endif /* MSLRenderer_h */
