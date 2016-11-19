//
//  ViewController.m
//  imageView动画演示
//
//  Created by mac on 16/9/10.
//  Copyright © 2016年 mac. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
{
    UIView *_newView;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _newView = [[UIView alloc]init];
    _newView.bounds = CGRectMake(0, 0, 300, 300);
    _newView.backgroundColor = [UIColor orangeColor];
    _newView.center = self.view.center;
    [self.view addSubview:_newView];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UIView *twoView = [[UIView alloc]init];
    twoView.bounds = CGRectMake(0, 0, 100, 100);
    twoView.center = CGPointMake(150, 150);
    // 添加至父视图
    [self.view addSubview:twoView];
    // 修改属性，其实属性的修改并不会影响动画是否产生，如果属性不变化，动画该有还是有。
    twoView.backgroundColor = [UIColor redColor];
    // 稍微加一点延迟，动画效果就可以出现。
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        // 添加动画
        CATransition *transition = [CATransition animation];
        transition.type = @"cube";
        transition.subtype = kCATransitionFromRight;
        transition.duration = 1.0;
        [twoView.layer addAnimation:transition forKey:nil];
        
    });
//    // 添加动画，这个就不会出现动画，因为和上边添加至父视图的代码时间间隔太短
//    CATransition *transition = [CATransition animation];
//    transition.type = @"cube";
//    transition.subtype = kCATransitionFromRight;
//    transition.duration = 1.0;
//    [twoView.layer addAnimation:transition forKey:nil];
//    _newView.backgroundColor = [UIColor  blackColor];
    // 添加动画
//    CATransition *transition = [CATransition animation];
//    transition.type = @"cube";
//    transition.subtype = kCATransitionFromLeft;
//    transition.duration = 1.0;
//    [_newView.layer addAnimation:transition forKey:nil];
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    _newView.backgroundColor = [UIColor  yellowColor];
    //     添加动画
    CATransition *transition = [CATransition animation];
    transition.type = @"cube";
    transition.subtype = kCATransitionFromLeft;
    transition.duration = 1.0;
    [_newView.layer addAnimation:transition forKey:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
