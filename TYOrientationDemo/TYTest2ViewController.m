//
//  TYTest2ViewController.m
//  TYOrientationDemo
//
//  Created by Tiny on 2017/8/14.
//  Copyright © 2017年 LOVEGO. All rights reserved.
//

#import "TYTest2ViewController.h"

@interface TYTest2ViewController ()

@end

@implementation TYTest2ViewController

-(void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.title = @"按钮控制横竖屏";
    
    UIBarButtonItem *item1 = [[UIBarButtonItem alloc] initWithTitle:@"横屏" style:UIBarButtonItemStylePlain target:self action:@selector(leftAction)];
    UIBarButtonItem *item2 = [[UIBarButtonItem alloc] initWithTitle:@"竖屏" style:UIBarButtonItemStylePlain target:self action:@selector(rightAction)];
    self.navigationItem.rightBarButtonItems = @[item1,item2];
    
    UIDevice *device = [UIDevice currentDevice]; //Get the device object
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification  object:device];

}

-(void)orientationChanged:(NSNotification *)noti{
    UIDeviceOrientation orientation = [[UIDevice currentDevice] orientation];
    switch (orientation) {
        case UIDeviceOrientationPortrait:            // Device oriented
            break;
        case UIDeviceOrientationPortraitUpsideDown:  // Device oriented
            break;
        case UIDeviceOrientationLandscapeLeft :      // Device oriented
            break;
        case UIDeviceOrientationLandscapeRight:      // Device oriented horizontally, home button on the left
            break;
        default:
            break;
    }
    NSLog(@"orientation:%zi",orientation);
}

-(void)leftAction{
    [self interfaceOrientation:UIInterfaceOrientationLandscapeRight];
}

-(void)rightAction{
    [self interfaceOrientation:UIInterfaceOrientationPortrait];
}

-(BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeRight);
}

- (void)interfaceOrientation:(UIInterfaceOrientation)orientation
{
    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
        SEL selector             = NSSelectorFromString(@"setOrientation:");
        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
        [invocation setSelector:selector];
        [invocation setTarget:[UIDevice currentDevice]];
        int val                  = orientation;
        // 从2开始是因为0 1 两个参数已经被selector和target占用
        [invocation setArgument:&val atIndex:2];
        [invocation invoke];
    }
}


@end
