//
//  GGMainViewController.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/9.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGMainViewController.h"

static NSString *cellIdentifier = @"reuseIdentifier";

@interface GGMainViewController ()<UITableViewDelegate, UITableViewDataSource>

// 数据
@property (nonatomic, strong) NSArray<NSArray<NSDictionary *> *> *titleArray;
@property (nonatomic, strong) NSArray<NSString *> *sectionTitleArray;
// view
@property (nonatomic, strong) UITableView *tableView;

@end

@implementation GGMainViewController

#pragma mark - life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self initDataSource];
    [self initSubviews];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    self.tableView.frame = self.view.bounds;
}

- (void)initDataSource {
    self.titleArray = @[
                        @[
                            @{@"clsName" : @"GGBasicAnimViewController",      @"title" : @"CABasicAnimation基础动画"},
                            @{@"clsName" : @"GGKayframeAnimViewController",   @"title" : @"CAKeyframeAnimation多值动画"},
                            @{@"clsName" : @"GGTransitionAnimViewController", @"title" : @"CATransition转场动画"},
                            @{@"clsName" : @"GGSpringAnimViewController",     @"title" : @"CASpringAnimation弹簧动画"},
                            @{@"clsName" : @"GGAnimationGroupViewController", @"title" : @"CAAnimationGroup组合动画"},
                            ],
                        @[
                            @{@"clsName" : @"GGDrawLineViewController",  @"title" : @"划线动画"},
                            @{@"clsName" : @"GGWaterWaveViewController", @"title" : @"水波纹效果"},
                            @{@"clsName" : @"GGFireViewController",      @"title" : @"粒子动画——火苗效果"},
                            ]
                        ];
    self.sectionTitleArray = @[@"基础动画示例", @"常见经典动画案例"];
}

- (void)initSubviews {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectNull style:UITableViewStyleGrouped];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cellIdentifier];
    [self.view addSubview:self.tableView];
}

#pragma mark - Table view data source and delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.sectionTitleArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sectionTitleArray[section];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.titleArray[section].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *sectionArray = self.titleArray[indexPath.section];
    NSDictionary *rowDict = sectionArray[indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    cell.textLabel.text = rowDict[@"title"];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSArray *sectionArray = self.titleArray[indexPath.section];
    NSDictionary *rowDict = sectionArray[indexPath.row];
    
    UIViewController *vc = [[NSClassFromString(rowDict[@"clsName"]) alloc] init];
    vc.title = rowDict[@"title"];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end




