//
//  ViewController.m
//  TYOrientationDemo
//
//  Created by Tiny on 2017/8/14.
//  Copyright © 2017年 LOVEGO. All rights reserved.
//

#import "ViewController.h"
#import "TYTest1ViewController.h"
#import "TYTest2ViewController.h"
#import "TYTest0ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.view.backgroundColor = [UIColor whiteColor];

    self.title = @"横竖屏切换";
    
}


- (IBAction)testAction:(UIButton *)sender {
    if (sender.tag == 99) {
        TYTest0ViewController *test0Vc = [[TYTest0ViewController alloc] init];
        [self.navigationController pushViewController:test0Vc animated:YES];
    }
    else if (sender.tag == 100) {
        TYTest1ViewController *test1Vc = [[TYTest1ViewController alloc] init];
        [self.navigationController pushViewController:test1Vc animated:YES];
    }else{
        TYTest2ViewController *test2Vc = [[TYTest2ViewController alloc] init];
        test2Vc.title = @"test2";
        [self.navigationController pushViewController:test2Vc animated:YES];
    }
}


-(BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    //默认竖屏
    return UIInterfaceOrientationMaskPortrait;
}




@end
