# TYOrientationDemo
a sample demo for orientation

iOS要实现横竖屏切换很简单，不需要使用任何第三方，只需要实现几个方法就可以了

1.设置系统支持横竖屏【General】->【Targets】-> 【Deployment info】->【Device Orientation】
![](http://images2017.cnblogs.com/blog/950551/201708/950551-20170814163506256-1564213017.png)


2.在控制器中实现对应的方法(默认支持竖屏)

```
-(BOOL)shouldAutorotate{
    return YES;
}

-(UIInterfaceOrientationMask)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskPortrait;
}

```

3.某些特定的页面需要横屏支持的，则单独处理（同样需要实现2个方法）

```
-(BOOL)shouldAutorotate{
    return YES;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return (UIInterfaceOrientationMaskPortrait|UIInterfaceOrientationMaskLandscapeLeft|UIInterfaceOrientationMaskLandscapeRight);
}
```

4.如果控制器中有用到导航控制器或者tabbarController，这需要在导航控制器和tabbarController分别实现以下2个方法

```
- (BOOL)shouldAutorotate{
    
    return [self.selectedViewController shouldAutorotate];
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations{
    
    return [self.selectedViewController supportedInterfaceOrientations];
}

```
5.如果需要实现点击按钮切换横竖屏的效果则可以参考如下方案：

```
//按钮点击事件
- (void)leftAction
{
    [self interfaceOrientation:UIInterfaceOrientationPortrait];
}

- (void)rightAction
{
    [self interfaceOrientation:UIInterfaceOrientationLandscapeRight];
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
```

6.如果要监听屏幕旋转事件则可以参考如下方案（监听旋转事件，控制键盘，控制frame等操作）

```
    UIDevice *device = [UIDevice currentDevice]; //Get the device object
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(orientationChanged:) name:UIDeviceOrientationDidChangeNotification  object:device];

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
}

```
