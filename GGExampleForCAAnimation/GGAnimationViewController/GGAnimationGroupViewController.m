//
//  GGAnimationGroupViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/16.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGAnimationGroupViewController.h"

@interface GGAnimationGroupViewController ()

@end

@implementation GGAnimationGroupViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CAKeyframeAnimation * animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    animation.duration = 2;
    animation.removedOnCompletion = NO;
    animation.fillMode = kCAFillModeForwards;
    animation.calculationMode = kCAAnimationCubicPaced;
    animation.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 200, 200, 200)].CGPath;
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    animation2.toValue = @40;
    animation2.duration = 0.5;
    animation2.fillMode = kCAFillModeForwards;
    animation2.removedOnCompletion = NO;
    animation2.autoreverses = YES;
    animation2.repeatCount = CGFLOAT_MAX;
    
    CAAnimationGroup * group = [CAAnimationGroup animation];
    group.duration = 2;
    group.fillMode = kCAFillModeForwards;
    group.removedOnCompletion = NO;
    group.repeatCount = CGFLOAT_MAX;
    group.animations = @[animation,animation2];

    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 80, 80)];
    redView.backgroundColor = [UIColor redColor];
    [redView.layer addAnimation:group forKey:@"group"];
    [self.view addSubview:redView];
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
