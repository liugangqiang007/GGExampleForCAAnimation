//
//  GGBasicAnimViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/9.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGBasicAnimViewController.h"

@interface GGBasicAnimViewController ()

@end

@implementation GGBasicAnimViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    /* CALayer 的属性注释中标有 Animatable 的，都可以作为 KeyPath 进行动画 */
    //
    
    /*----------------------旋转动画----------------------*/
    // 绕 x 轴旋转
    CABasicAnimation *rotationAnimX = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    rotationAnimX.repeatCount = CGFLOAT_MAX;
    rotationAnimX.beginTime = 0.0;
    rotationAnimX.duration = 2;
    rotationAnimX.toValue = @(2 * M_PI);
    // 控制app从后台进入前台后动画是否停止
    rotationAnimX.removedOnCompletion = NO;
    
    UIView *rotationViewX = [[UIView alloc] initWithFrame:CGRectMake(20, 100, 70, 70)];
    [rotationViewX.layer addSublayer:[self getGradientLayer]];
    [rotationViewX.layer addAnimation:rotationAnimX forKey:@"rotationAnimX"];
    [self.view addSubview:rotationViewX];
    
    // 绕 y 轴旋转
    CABasicAnimation *rotationAnimY = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    rotationAnimY.repeatCount = CGFLOAT_MAX;
    rotationAnimY.beginTime = 0.0;
    rotationAnimY.duration = 2;
    rotationAnimY.toValue = @(2 * M_PI);
    UIView *rotationViewY = [[UIView alloc] initWithFrame:CGRectMake(150, 100, 70, 70)];
    [rotationViewY.layer addSublayer:[self getGradientLayer]];
    [rotationViewY.layer addAnimation:rotationAnimY forKey:@"rotationAnimY"];
    [self.view addSubview:rotationViewY];
    
    // 绕 z 轴旋转
    CABasicAnimation *rotationAnimZ = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimZ.repeatCount = CGFLOAT_MAX;
    rotationAnimZ.beginTime = 0.0;
    rotationAnimZ.duration = 2;
    rotationAnimZ.toValue = @(2 * M_PI);
    UIView *rotationViewZ = [[UIView alloc] initWithFrame:CGRectMake(280, 100, 70, 70)];
    [rotationViewZ.layer addSublayer:[self getGradientLayer]];
    [rotationViewZ.layer addAnimation:rotationAnimZ forKey:@"rotationAnimZ"];
    [self.view addSubview:rotationViewZ];
    
    // 绕一个 3D 向量轴旋转
    CABasicAnimation *rotationAnim3D = [CABasicAnimation animationWithKeyPath:@"transform"];
    rotationAnim3D.repeatCount = CGFLOAT_MAX;
    rotationAnim3D.beginTime = 0.0;
    rotationAnim3D.duration = 2;
    rotationAnim3D.autoreverses = YES;
    rotationAnim3D.toValue = [NSValue valueWithCATransform3D:CATransform3DMakeRotation(M_PI/3.0, 1, 0.5, 0.8)];
    UIView *rotationView3D = [[UIView alloc] initWithFrame:CGRectMake(20, 200, 70, 70)];
    [rotationView3D.layer addSublayer:[self getGradientLayer]];
    [rotationView3D.layer addAnimation:rotationAnim3D forKey:@"rotationAnim3D"];
    [self.view addSubview:rotationView3D];

    /*----------------------移动动画----------------------*/
    CABasicAnimation *moveAnim = [CABasicAnimation animationWithKeyPath:@"position"];
    moveAnim.repeatCount = CGFLOAT_MAX;
    moveAnim.duration = 2;
    // 位置是 layer 的 position
    moveAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(185, 235)];
    moveAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(315, 235)];
    // 是否自动逆反动画
    moveAnim.autoreverses = true;
    /// 以下两句 控制View动画结束后，停留在动画结束的位置
    moveAnim.removedOnCompletion = NO;
    //moveAnim.fillMode = kCAFillModeForwards;

    UIView *moveView = [[UIView alloc] initWithFrame:CGRectMake(150, 200, 70, 70)];
    [moveView.layer addSublayer:[self getGradientLayer]];
    [moveView.layer addAnimation:moveAnim forKey:@"positionAnim"];
    [self.view addSubview:moveView];

    /*----------------------背景颜色变化动画----------------------*/
    CABasicAnimation *colorAnim = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    colorAnim.repeatCount = CGFLOAT_MAX;
    colorAnim.duration = 2;
    colorAnim.autoreverses = true;
    colorAnim.fromValue = (__bridge id)[[UIColor blueColor] CGColor];
    colorAnim.toValue = (__bridge id)[[UIColor redColor] CGColor];
    UIView *colorView = [[UIView alloc] initWithFrame:CGRectMake(20, 300, 70, 70)];
    [colorView.layer addAnimation:colorAnim forKey:@"colorAnim"];
    [self.view addSubview:colorView];

    /*----------------------内容变化动画----------------------*/
    CABasicAnimation *contentsAnim = [CABasicAnimation animationWithKeyPath:@"contents"];
    contentsAnim.toValue = (__bridge id)([[UIImage imageNamed:@"to"] CGImage]);
    contentsAnim.duration = 2;
    contentsAnim.autoreverses = true;
    contentsAnim.repeatCount = CGFLOAT_MAX;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(150, 300, 70, 70)];
    imageView.image =[UIImage imageNamed:@"from"];
    [imageView.layer addAnimation:contentsAnim forKey:@"contentsAnim"];
    [self.view addSubview:imageView];

    /*----------------------圆角变化动画----------------------*/
    CABasicAnimation *cornerRadiusAnim = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    cornerRadiusAnim.repeatCount = CGFLOAT_MAX;
    cornerRadiusAnim.duration = 2;
    cornerRadiusAnim.autoreverses = true;
    cornerRadiusAnim.toValue = @25;
    UIView *cornerRadiusView = [[UIView alloc] initWithFrame:CGRectMake(280, 300, 70, 70)];
    [cornerRadiusView.layer setMasksToBounds:YES];
    [cornerRadiusView.layer addSublayer:[self getGradientLayer]];
    [cornerRadiusView.layer addAnimation:cornerRadiusAnim forKey:@"cornerRadiusAnim"];
    [self.view addSubview:cornerRadiusView];

    /*----------------------比例缩放动画----------------------*/
    CABasicAnimation *scaleAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnim.repeatCount = CGFLOAT_MAX;
    scaleAnim.duration = 2;
    scaleAnim.autoreverses = true;
    scaleAnim.fromValue = @0.3;
    scaleAnim.toValue = @1.3;
    UIView *scaleView = [[UIView alloc] initWithFrame:CGRectMake(20, 400, 70, 70)];
    [scaleView.layer addSublayer:[self getGradientLayer]];
    [scaleView.layer addAnimation:scaleAnim forKey:@"scaleAnim"];
    [self.view addSubview:scaleView];

    CABasicAnimation *scaleXAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    scaleXAnim.repeatCount = CGFLOAT_MAX;
    scaleXAnim.duration = 2;
    scaleXAnim.autoreverses = true;
    scaleXAnim.fromValue = @0.3;
    scaleXAnim.toValue = @1.3;
    UIView *scaleXView = [[UIView alloc] initWithFrame:CGRectMake(150, 400, 70, 70)];
    [scaleXView.layer addSublayer:[self getGradientLayer]];
    [scaleXView.layer addAnimation:scaleXAnim forKey:@"scaleXAnim"];
    [self.view addSubview:scaleXView];

    CABasicAnimation *scaleYAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    scaleYAnim.repeatCount = CGFLOAT_MAX;
    scaleYAnim.duration = 2;
    scaleYAnim.autoreverses = true;
    scaleYAnim.fromValue = @0.3;
    scaleYAnim.toValue = @1.3;
    UIView *scaleYView = [[UIView alloc] initWithFrame:CGRectMake(280, 400, 70, 70)];
    [scaleYView.layer addSublayer:[self getGradientLayer]];
    [scaleYView.layer addAnimation:scaleYAnim forKey:@"scaleYAnim"];
    [self.view addSubview:scaleYView];

    /*----------------------指定大小缩放----------------------*/
    CABasicAnimation *boundsAnim = [CABasicAnimation animationWithKeyPath:@"bounds"];
    boundsAnim.repeatCount = CGFLOAT_MAX;
    boundsAnim.duration = 2;
    boundsAnim.autoreverses = true;
    // 这里进行动画的是 layer 的 bounds，其内部的子 layer 不发生变化
    boundsAnim.fromValue = [NSValue valueWithCGRect:CGRectMake(0,0,50,50)];
    boundsAnim.toValue = [NSValue valueWithCGRect:CGRectMake(- 10, 0, 100, 100)];
    UIView *boundsView = [[UIView alloc] initWithFrame:CGRectMake(20, 500, 70, 70)];
    boundsView.layer.masksToBounds = YES;
    boundsView.backgroundColor = [UIColor redColor];
    [boundsView.layer addSublayer:[self getGradientLayer]];
    [boundsView.layer addAnimation:boundsAnim forKey:@"boundsAnim"];
    [self.view addSubview:boundsView];
    
    CABasicAnimation *boundsSizeAnim = [CABasicAnimation animationWithKeyPath:@"bounds.size"];
    boundsSizeAnim.repeatCount = CGFLOAT_MAX;
    boundsSizeAnim.duration = 2;
    boundsSizeAnim.autoreverses = true;
    boundsSizeAnim.fromValue = [NSValue valueWithCGSize:CGSizeMake(10,10)];
    boundsSizeAnim.toValue = [NSValue valueWithCGSize:CGSizeMake(80,80)];;
    UIView *boundsSizeView = [[UIView alloc] initWithFrame:CGRectMake(150, 500, 70, 70)];
    boundsSizeView.layer.masksToBounds = YES;
    boundsSizeView.backgroundColor = [UIColor redColor];
    [boundsSizeView.layer addSublayer:[self getGradientLayer]];
    [boundsSizeView.layer addAnimation:boundsSizeAnim forKey:@"boundsAnim"];
    [self.view addSubview:boundsSizeView];
    
    
    /*----------------------透明动画(闪烁)----------------------*/
    CABasicAnimation *alphaAnim = [CABasicAnimation animationWithKeyPath:@"opacity"];
    alphaAnim.repeatCount = CGFLOAT_MAX;
    alphaAnim.duration = 0.6;
    alphaAnim.autoreverses = true;
    alphaAnim.fromValue = @0.1;
    alphaAnim.toValue = @1.0;
    UIView *alphaView = [[UIView alloc] initWithFrame:CGRectMake(280, 500, 70, 70)];
    [alphaView.layer addSublayer:[self getGradientLayer]];
    [alphaView.layer addAnimation:alphaAnim forKey:@"alphaAnim"];
    [self.view addSubview:alphaView];
}

- (CAGradientLayer *)getGradientLayer {
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.colors = @[(__bridge id)[UIColor redColor].CGColor, (__bridge id)[UIColor yellowColor].CGColor, (__bridge id)[UIColor blueColor].CGColor];
    gradientLayer.locations = @[@0.165, @0.5, @0.835];
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1.0, 1.0);
    gradientLayer.frame = CGRectMake(0, 0, 70, 70);
    return gradientLayer;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
