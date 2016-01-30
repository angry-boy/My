//
//  ViewController.m
//  MyWeatherGuide
//
//  Created by lanouhn on 16/1/30.
//  Copyright © 2016年 lanouhn. All rights reserved.
//

#define kWidth [UIScreen mainScreen].bounds.size.width
#define kHeight [UIScreen mainScreen].bounds.size.height

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIScrollView *GuideScroll;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.GuideScroll.contentSize = CGSizeMake(kWidth * 3, kHeight);
    [self setUpUserGuideSubViews];
}

- (void)setUpUserGuideSubViews {
    UIImageView *img = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kWidth * 3, kHeight)];
    img.image = [UIImage imageNamed:@"userGuide_1.jpg"];
    [_GuideScroll addSubview:img];
    
    [UIView animateWithDuration:6 delay:0.5 usingSpringWithDamping:1 initialSpringVelocity:0.5 options:UIViewAnimationOptionBeginFromCurrentState animations:^{
        CGPoint point = _GuideScroll.contentOffset;
        point.x += kWidth * 2;
        _GuideScroll.contentOffset = point;
    } completion:^(BOOL finished) {
        
        _GuideScroll.scrollEnabled = NO;
        img.userInteractionEnabled = YES;
        UITextField *tf = [[UITextField alloc] initWithFrame:CGRectMake(kWidth * 3 - 280, kHeight / 2, 200, 30)];
        tf.textColor = [UIColor whiteColor];
        tf.tag = 111;
        tf.textAlignment = NSTextAlignmentRight;
        tf.font = [UIFont systemFontOfSize:25];
        [img addSubview:tf];
        UIView *aView = [[UIView alloc] initWithFrame:CGRectMake(kWidth * 3 - 280, kHeight / 2 + 35, 200, 1)];
        aView.backgroundColor = [UIColor whiteColor];
        [img addSubview:aView];
        
        UIButton *loginBtn = [UIButton buttonWithType:UIButtonTypeSystem];
        loginBtn.frame = CGRectMake(kWidth * 3 - 120, kHeight - 100, 40, 40);
        [loginBtn setImage:[UIImage imageNamed:@"iconfont-20qianjin"] forState:UIControlStateNormal];
        loginBtn.tintColor = [UIColor whiteColor];
        [loginBtn addTarget:self action:@selector(handleLogin:) forControlEvents:UIControlEventTouchUpInside];
        [img addSubview:loginBtn];
    }];
    
}

- (void)handleLogin:(UIButton *)sender {
    UITextField *cityTF = (UITextField *)[self.view viewWithTag:111];
    NSLog(@"%@", cityTF);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
