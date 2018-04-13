//
//  GGFireViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/19.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGFireViewController.h"

@interface GGFireViewController ()
@property (nonatomic, strong) CAEmitterLayer *fireEmitter;
@end

@implementation GGFireViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    
    self.fireEmitter = [CAEmitterLayer layer];
    self.fireEmitter.birthRate = 1;  // 乘以 CAEmitterCell 的 birthRate，得出每秒产生的粒子数量，默认1
    self.fireEmitter.lifetime = 1;
    
    self.fireEmitter.emitterPosition = self.view.center;     // 发射器在xy平面的中心位置
    self.fireEmitter.emitterSize = CGSizeMake(100, 100);     // 发射器的尺寸大小
    self.fireEmitter.emitterShape = kCAEmitterLayerPoint;    // 发射器的形状，有“点”（默认）、“线”、“矩形”、“圆”、“长方体”和“球体”模式。
//    self.fireEmitter.emitterMode = kCAEmitterLayerOutline; // 发射器的发射模式，有"顶点"、"轮廓"、"表面"、"3d体表面"
    self.fireEmitter.renderMode = kCAEmitterLayerAdditive;   // 发射器渲染模式
    self.fireEmitter.preservesDepth = NO;                    // 是否保留三维效果，默认 no
    
    // 发射单元 - 火焰
    CAEmitterCell *fire = [CAEmitterCell emitterCell];
    fire.name = @"fire";
    fire.birthRate = 200;  // 粒子的创建速率，默认为1/s, 乘以 CAEmitterLayer 的 birthRate(默认1)，得出每秒产生的粒子数量
    
    fire.lifetime = 0.2;        // 粒子存活时间，乘以 CAEmitterLayer 的 lifetime(默认1)，得出粒子的生命周期时长
    fire.lifetimeRange = 0.5;   // 粒子的生存时间容差，波动范围
    
    fire.emissionLongitude = M_PI + M_PI_2;  // 粒子在xy平面的发射角度， 与x轴正方向的顺时针夹角
    fire.emissionRange = M_PI * 0.3;         // 粒子发射角度的容差，波动范围
    
    fire.velocity = 35;      // 粒子的速度
    fire.velocityRange = 10; // 粒子动画的速度容差
    
    fire.xAcceleration = 0;     // xyz轴的加速矢量
    fire.yAcceleration = - 200;
    
    fire.scale = 1.2;           // 缩放比例，容差，速度
    fire.scaleRange = 0.2;
    fire.scaleSpeed = 0.3;
    
    // 旋转度
//    fire.spin = 0.2;
    
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;    // 颜色变化
    fire.contents = (__bridge id _Nullable)([[UIImage imageNamed:@"fire"] CGImage]); // 一般设置一张纯白色图片
    
   
    self.fireEmitter.emitterCells = @[fire];
    [self.view.layer addSublayer:self.fireEmitter];
    
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
