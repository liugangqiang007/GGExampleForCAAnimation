//
//  GGTransitionAnimViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/9.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGTransitionAnimViewController.h"

@interface GGTransitionAnimViewController ()
@property (nonatomic, strong) NSArray<NSString *> *animArr;
@property (nonatomic, strong) UILabel *animLabel;
@property (nonatomic, assign) NSInteger index;
@end

@implementation GGTransitionAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.animArr = @[kCATransitionFade,         // 交叉淡化过渡(默认)
                     kCATransitionMoveIn,       // 新视图移到旧视图上面
                     kCATransitionPush,         // 新视图把旧视图推出去
                     kCATransitionReveal,       // 将旧视图移开,显示下面的新视图
                     @"cube",                   // 立方旋转
                     @"suckEffect",             // 收缩效果纸张抽走
                     @"rippleEffect",           // 水滴
                     @"oglFlip",                // 平面翻转
                     @"pageCurl",               // 翻页下一张
                     @"pageUnCurl",             // 翻页上一张
                     @"cameraIrisHollowOpen",   // 快门打开
                     @"cameraIrisHollowClose",  // 快门关闭
                     ];
    
    self.index = 0;
    
    self.animLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 300)];
    self.animLabel.center = CGPointMake([UIScreen mainScreen].bounds.size.width / 2.0, [UIScreen mainScreen].bounds.size.height / 2.0);
    self.animLabel.numberOfLines = 0;
    self.animLabel.backgroundColor = [UIColor redColor];
//    self.animLabel.textColor = [UIColor yellowColor];
    self.animLabel.font = [UIFont systemFontOfSize:20];
    self.animLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:self.animLabel];
    
    UIButton *animBtn = [[UIButton alloc] initWithFrame:CGRectMake(80, 600, 100, 50)];
    animBtn.backgroundColor = [UIColor blueColor];
    [animBtn setTitle:@"当前动画" forState:UIControlStateNormal];
    [animBtn addTarget:self action:@selector(animBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:animBtn];
    
    UIButton *nextAnimBtn = [[UIButton alloc] initWithFrame:CGRectMake(200, 600, 100, 50)];
    nextAnimBtn.backgroundColor = [UIColor blueColor];
    [nextAnimBtn setTitle:@"下一个动画" forState:UIControlStateNormal];
    [nextAnimBtn addTarget:self action:@selector(nextAnimBtnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextAnimBtn];
}


- (void)animBtnClick {
    self.animLabel.text = @"我是占位文字";
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self transitionAnimation];
         });
}

- (void)nextAnimBtnClick {
    self.index = self.index + 1 >= self.animArr.count ? 0 : self.index + 1;
    
    [self transitionAnimation];
   
}

- (void)transitionAnimation {
    NSString *animType = self.animArr[self.index];
    
    
    CATransition *transition = [[CATransition alloc] init];
    transition.duration = 2;
    transition.type = animType;
    transition.subtype = kCATransitionFromLeft;
    [self.animLabel.layer addAnimation:transition forKey:@"transitionAnim"];
    self.animLabel.text = [NSString stringWithFormat:@"动画效果：%@", animType];
    self.animLabel.backgroundColor = self.index % 2 ? [UIColor redColor] : [UIColor greenColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
