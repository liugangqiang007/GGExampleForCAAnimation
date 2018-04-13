//
//  GGSpringAnimViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/9.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGSpringAnimViewController.h"

@interface GGSpringAnimViewController ()

@end

@implementation GGSpringAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(50, 100, 50, 30)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    CASpringAnimation *springAnim = [CASpringAnimation animationWithKeyPath:@"position.x"];
    springAnim.damping = 5;         // 阻尼系数，减幅
    springAnim.stiffness = 1000;    // 刚度
    springAnim.mass = 1;            // 质量
    springAnim.initialVelocity = 0; // 初始速度
    springAnim.fromValue = @(view.layer.position.x);
    springAnim.toValue = @(view.layer.position.x + 100);
    springAnim.repeatCount = CGFLOAT_MAX;
    springAnim.duration = springAnim.settlingDuration;
    [view.layer addAnimation:springAnim forKey:springAnim.keyPath];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
