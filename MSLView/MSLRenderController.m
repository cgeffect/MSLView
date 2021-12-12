//
//  MSLRenderController.m
//  MSLView
//
//  Created by 王腾飞 on 2021/12/12.
//


#import "MSLRenderController.h"
#import "MSLEditViewController.h"
#include "MSLRenderer.h"

@implementation MSLRenderController
{
    MTKView *_view;
    
    MSLRenderer *_renderer;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    _view = (MTKView *)self.view;


    _view.device = [self selectMetalDevice];
    NSAssert(_view.device, @"Metal is not supported on this device");
    _view.framebufferOnly = NO;
    _renderer = [[MSLRenderer alloc] initWithMetalKitView:_view];
    
    NSAssert(_renderer, @"Renderer failed initialization");

    CGFloat backingScaleFactor = [[NSScreen mainScreen] backingScaleFactor];
    [_renderer mtkView:_view drawableSizeWillChange:
     CGSizeMake(_view.bounds.size.width * backingScaleFactor,
                _view.bounds.size.height * backingScaleFactor)];
    
    _view.delegate = _renderer;
}

- (void)viewWillAppear
{
    [super viewWillAppear];
    
    MSLEditViewController *editViewController = (MSLEditViewController *)[[[((NSSplitViewController *)[self parentViewController])
                                  splitViewItems]
                                 firstObject]
                                viewController];
    if(editViewController != nil)
    {
        editViewController.renderer = _renderer;
    }
}

- (id<MTLDevice>)selectMetalDevice
{
    NSArray<id<MTLDevice>> *devices = MTLCopyAllDevices();
    // Search for high-powered devices that support dynamic libraries
    for(id<MTLDevice> device in devices)
    {
        if(!device.isLowPower &&
           device.supportsDynamicLibraries)
        {
            return device;
        }
    }
    // Search for any device that supports dynamic libraries
    for(id<MTLDevice> device in devices)
    {
        if(device.supportsDynamicLibraries)
        {
            return device;
        }
    }
    
    return nil;
}
@end
