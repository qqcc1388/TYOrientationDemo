//
//  TYNavinationController.m
//  TYOrientationDemo
//
//  Created by Tiny on 2017/8/14.
//  Copyright © 2017年 LOVEGO. All rights reserved.
//

#import "TYNavinationController.h"

@interface TYNavinationController ()

@end

@implementation TYNavinationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (BOOL)shouldAutorotate{
    
    return [self.topViewController shouldAutorotate];
    
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return [self.topViewController supportedInterfaceOrientations];
    
}


@end
