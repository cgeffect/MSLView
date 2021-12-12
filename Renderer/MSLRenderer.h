//
//  MSLRenderer.h
//  MSLView
//
//  Created by 王腾飞 on 2021/12/12.
//

#ifndef MSLRenderer_h
#define MSLRenderer_h

@import MetalKit;

// Platform independent renderer class
@interface MSLRenderer : NSObject<MTKViewDelegate>

- (nonnull instancetype)initWithMetalKitView:(nonnull MTKView *)mtkView;
- (void)compileDylibWithString:(NSString *_Nonnull)programString;

@end

#endif /* MSLRenderer_h */
