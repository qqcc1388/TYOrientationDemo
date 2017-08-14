//
//  TYTest0ViewController.m
//  TYOrientationDemo
//
//  Created by Tiny on 2017/8/14.
//  Copyright © 2017年 LOVEGO. All rights reserved.
//

#import "TYTest0ViewController.h"

@interface TYTest0ViewController ()

@end

@implementation TYTest0ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"默认竖屏";

}


-(BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait);
}



@end
