//
//  GGKayframeAnimViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/9.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGKayframeAnimViewController.h"

@interface GGKayframeAnimViewController ()

@end

@implementation GGKayframeAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CAKeyframeAnimation * positionAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    positionAnim.values = @[[NSValue valueWithCGPoint:CGPointMake(60, 140)],[NSValue valueWithCGPoint:CGPointMake(100, 300)],[NSValue valueWithCGPoint:CGPointMake(300, 200)],[NSValue valueWithCGPoint:CGPointMake(200, 400)]];
    positionAnim.duration = 2;
    positionAnim.removedOnCompletion = NO;
    positionAnim.fillMode = kCAFillModeForwards;
    positionAnim.autoreverses = YES;
    positionAnim.repeatCount = CGFLOAT_MAX;
    // 改变补间动画的计算模式
    //    CA_EXTERN NSString * const kCAAnimationLinear
    //    CA_EXTERN NSString * const kCAAnimationDiscrete
    //    CA_EXTERN NSString * const kCAAnimationPaced
    //    CA_EXTERN NSString * const kCAAnimationCubic
    //    CA_EXTERN NSString * const kCAAnimationCubicPaced
    positionAnim.calculationMode = kCAAnimationCubic;
    // keyTimes属性指定的是当前状态节点到初始状态节点的时间占动画总时长的比例
    positionAnim.keyTimes = @[@0,@0.8,@0.9,@1];
    
    UIView *positionView = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 80, 80)];
    positionView.backgroundColor = [UIColor redColor];
    [positionView.layer addAnimation:positionAnim forKey:@"positionAnim"];
    [self.view addSubview:positionView];
    

    CAKeyframeAnimation * ovalAnim = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    ovalAnim.duration = 3;
    ovalAnim.removedOnCompletion = NO;
    ovalAnim.fillMode = kCAFillModeForwards;
    ovalAnim.calculationMode = kCAAnimationPaced;
    // 设置此属性，layer 会跟随动画自动旋转
    ovalAnim.rotationMode = kCAAnimationRotateAutoReverse;
    ovalAnim.repeatCount = CGFLOAT_MAX;
    // 添加路径，values 属性会失效
    ovalAnim.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(50, 400, 300, 200)].CGPath;
    UIView *ovalAnimView = [[UIView alloc] initWithFrame:CGRectMake(20, 400, 80, 80)];
    ovalAnimView.backgroundColor = [UIColor redColor];
    [ovalAnimView.layer addAnimation:ovalAnim forKey:@"ovalAnim"];
    [self.view addSubview:ovalAnimView];

    CAShapeLayer *shapeLayer = [[CAShapeLayer alloc] init];
    shapeLayer.strokeColor = UIColor.greenColor.CGColor;
    shapeLayer.fillColor = UIColor.clearColor.CGColor;
    shapeLayer.lineWidth = 0.5;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(20, 400, 300, 200)].CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
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
