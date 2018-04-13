//
//  GGDrawLineViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/19.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGDrawLineViewController.h"

@interface GGDrawLineViewController ()

@end

@implementation GGDrawLineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CAShapeLayer *shapeLayer = [CAShapeLayer layer];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor lightGrayColor].CGColor;
    shapeLayer.lineWidth = 2.0;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 100, 250, 500)].CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 5.0;
    animation.fromValue = @0;
    animation.toValue = @1.0;
    animation.autoreverses = YES;
    animation.fillMode = kCAFillModeForwards;
    animation.repeatCount = CGFLOAT_MAX;
    [shapeLayer addAnimation:animation forKey:@"strokeEndAnim"];
    
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
