//
//  JPBarChart.m
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import "JPBarChart.h"
#import <Charts/Charts-Swift.h>
#import <Masonry/Masonry.h>

@interface JPBarChart()

/** 折线图表 **/
@property (nonatomic, strong) BarChartView * barChart;

/** 折线数据集 **/
@property (nonatomic, strong) BarChartDataSet * dataSet;

/** 折线数据 **/
@property (nonatomic, strong) BarChartData * data;


@end

@implementation JPBarChart

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"init frame");
        
        [self initUI];
    }
    return self;
}

/**
 创建一个Chart对象
 
 @return 对象
 */
+ (JPBarChart *)barChart{
    
    JPBarChart * chart = [JPBarChart new];
    
    return chart;
}

/**
 根据参数的个数返回带N点的折线图
 
 @param count 点的个数
 @return 对象
 */
+ (JPBarChart *)barChartWithNumber:(NSInteger)count{
    
    JPBarChart * chart = [JPBarChart new];
    
    [chart creatDataWithNumber:count];
    
    return chart;
}


/**
 初始化UI
 */
- (void)initUI{
    
    //------  创建一个图表  ------//
    [self addSubview:self.barChart];
    
    [_barChart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_offset(0);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(300);
    }];
}


/**
 创建数据
 
 @param number 点的个数
 */
- (void)creatDataWithNumber:(NSInteger)number{
    //------  初始化数组  ------//
    NSMutableArray *entryArray = [NSMutableArray new];
    
    // 实例化实体
    for (int i = 0 ; i < number; i++) {
        BarChartDataEntry * entry = [[BarChartDataEntry alloc] initWithX:i y:arc4random()%10];
        [entryArray addObject:entry];
    }
    
    // 生成一个数据集
    _dataSet = [[BarChartDataSet alloc] initWithValues:entryArray label:@"折线"];
    
    // 生成一个赋值给图表的数据
    _data = [[BarChartData alloc] initWithDataSet:self.dataSet];
    
    // 赋值给图表
    _barChart.data = self.data;
}

#pragma mark - 访问器

-(BarChartView *)barChart{
    
    if (!_barChart) {
        _barChart = [BarChartView new];
        
        // 这里写图表的设置
        _barChart.backgroundColor = [UIColor redColor];
    }
    return _barChart;
}
@end
