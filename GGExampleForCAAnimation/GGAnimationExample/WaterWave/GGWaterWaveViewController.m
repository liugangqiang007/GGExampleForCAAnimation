//
//  GGWaterWaveViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/19.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGWaterWaveViewController.h"
#import "GGWaterWaveView.h"
/**
 正弦型函数解析式：y=Asin（ωx+φ）+h
 各常数值对函数图像的影响：
 φ（初相位）：决定波形与X轴位置关系或横向移动距离（左加右减）
 ω：决定周期（最小正周期T=2π/|ω|）
 A：决定峰值（即纵向拉伸压缩的倍数）
 h：表示波形在Y轴的位置关系或纵向移动距离（上加下减）
 */

@interface GGWaterWaveViewController ()
@property (nonatomic, strong) GGWaterWaveView *waveView;
@end

@implementation GGWaterWaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.waveView = [[GGWaterWaveView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.waveView];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.waveView.frame = self.view.bounds;
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
