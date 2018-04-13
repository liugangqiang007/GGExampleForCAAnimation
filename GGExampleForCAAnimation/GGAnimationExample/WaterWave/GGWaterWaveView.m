//
//  GGWaterWaveView.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/19.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGWaterWaveView.h"
#import "GGWeakProxy.h"

/**
 正弦型函数解析式：y=Asin（ωx+φ）+h
 各常数值对函数图像的影响：
 φ（初相位）：决定波形与X轴位置关系或横向移动距离（左加右减）
 ω：决定周期（最小正周期T=2π/|ω|）
 A：决定峰值（即纵向拉伸压缩的倍数）
 h：表示波形在Y轴的位置关系或纵向移动距离（上加下减）
 */

@interface GGWaterWaveView ()
// 计时器，默认每秒刷新60次
@property (nonatomic, strong) CADisplayLink *waveDisplayLink;

@property (nonatomic, strong) CAShapeLayer *firstWaveLayer;
@property (nonatomic, strong) CAShapeLayer *secondWaveLayer;

// 水纹振幅
@property (nonatomic, assign) CGFloat waveA;
// 水纹周期
@property (nonatomic, assign) CGFloat waveW;
// 水纹速度
@property (nonatomic, assign) CGFloat waveSpeed;
// 水纹位移
@property (nonatomic, assign) CGFloat offsetX;
// 当前波浪位置Y
@property (nonatomic, assign) CGFloat currentK;
// 波浪宽度
@property (nonatomic, assign) CGFloat waterWaveWidth;

@end

@implementation GGWaterWaveView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.layer.masksToBounds = YES;
        [self initData];
        [self initUI];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    self.waveW = 3 * M_PI / self.bounds.size.width;
    self.currentK = self.bounds.size.height / 2.0;
    self.waterWaveWidth = self.bounds.size.width;
}

- (void)initData {
    self.waveA = 10;
    self.waveW = 3 * M_PI / self.bounds.size.width;
    self.offsetX = 0;
    self.waveSpeed = 0.05;
    self.currentK = self.bounds.size.height / 2.0;
    self.waterWaveWidth = self.bounds.size.width;
}

- (void)initUI {
    self.firstWaveLayer = [CAShapeLayer layer];
    self.firstWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
//    self.firstWaveLayer.strokeColor = [UIColor purpleColor].CGColor;
    self.secondWaveLayer = [CAShapeLayer layer];
    self.secondWaveLayer.fillColor = [UIColor colorWithRed:73/255.0 green:142/255.0 blue:178/255.0 alpha:0.5].CGColor;
//    self.secondWaveLayer.strokeColor = [UIColor redColor].CGColor;
    [self.layer addSublayer:self.firstWaveLayer];
    [self.layer addSublayer:self.secondWaveLayer];
    
    // CADisplayLink 直接使用 self 作为 target 会产生循环引用，造成控制器等对象无法自动释放，使用 NSProxy 消息转接，可避免这个问题
    self.waveDisplayLink = [CADisplayLink displayLinkWithTarget:[GGWeakProxy proxyWithTarget:self] selector:@selector(displayCurrentWave)];
    [self.waveDisplayLink addToRunLoop:[NSRunLoop currentRunLoop] forMode:NSRunLoopCommonModes];
    
}

- (void)displayCurrentWave {
    self.offsetX += self.waveSpeed;
    [self setCurrentWaveLayerPath];
}

- (void)setCurrentWaveLayerPath {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    UIBezierPath *path2 = [UIBezierPath bezierPath];
    CGFloat y = self.currentK;
    CGFloat y2 = self.currentK;
    
    for (NSInteger i = 0; i <= self.waterWaveWidth; i++) {
        y = self.waveA * sin(self.waveW * i - self.offsetX) + self.currentK;
        y2 = self.waveA * sin(self.waveW * i - self.offsetX + 5) + self.currentK;
        if (i == 0) {
            [path moveToPoint:CGPointMake(i, y)];
            [path2 moveToPoint:CGPointMake(i, y2)];
        } else {
            [path addLineToPoint:CGPointMake(i, y)];
            [path2 addLineToPoint:CGPointMake(i, y2)];
        }
    }
    [path addLineToPoint:CGPointMake(self.waterWaveWidth, self.bounds.size.height)];
    [path addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path closePath];
    
    [path2 addLineToPoint:CGPointMake(self.waterWaveWidth, self.bounds.size.height)];
    [path2 addLineToPoint:CGPointMake(0, self.bounds.size.height)];
    [path2 closePath];
    
    self.firstWaveLayer.path = path.CGPath;
    self.secondWaveLayer.path = path2.CGPath;
}

- (void)dealloc {
    [self.waveDisplayLink invalidate];
    NSLog(@"%s", __FUNCTION__);
}


@end
