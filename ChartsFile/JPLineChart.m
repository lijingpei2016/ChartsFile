//
//  LineChart.m
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import "JPLineChart.h"
#import <Charts/Charts-Swift.h>
#import <Masonry/Masonry.h>
#import "SYBaseLineView.h"
#import "JPBubbleView.h"

@interface JPLineChart () <IChartAxisValueFormatter,IChartFillFormatter,IChartValueFormatter>

/** 折线图表 **/
@property (nonatomic, strong) LineChartView * lineChart;

/** 折线数据集 **/
@property (nonatomic, strong) LineChartDataSet * dataSet;

/** 折线数据 **/
@property (nonatomic, strong) LineChartData * data;

@end

@implementation JPLineChart

#pragma mark - =============生命周期================

-(instancetype)init{
    if (self = [super init]) {
        NSLog(@"init");
        
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {
        NSLog(@"init frame");
        
        [self initUI];
    }
    return self;
}

#pragma mark - =============代理方法=================

#pragma mark - IChartAxisValueFormatter

-(NSString *)stringForValue:(double)value axis:(ChartAxisBase *)axis{
    
    if(_lineChart.leftAxis == axis){
        return [NSString stringWithFormat:@"左%.0f个",value];
    }
    
    if(_lineChart.rightAxis == axis){
        return [NSString stringWithFormat:@"右%.0f个",value];
    }
    
    if (_lineChart.xAxis == axis) {
        return [NSString stringWithFormat:@"第%.0f天",value];
    }
    
    return @"";
}

#pragma mark - IChartFillFormatter

-(CGFloat)getFillLinePositionWithDataSet:(id<ILineChartDataSet>)dataSet dataProvider:(id<LineChartDataProvider>)dataProvider{
    return 5;
}

#pragma mark - IChartValueFormatter

-(NSString *)stringForValue:(double)value entry:(ChartDataEntry *)entry dataSetIndex:(NSInteger)dataSetIndex viewPortHandler:(ChartViewPortHandler *)viewPortHandler{
    return [NSString stringWithFormat:@"*%.0f",value];
}

#pragma mark - =============事件处理=================

#pragma mark - =============网络数据处理==============

#pragma mark - =============声明的成员方法和类方法======

/**
 创建一个lineChart对象
 
 @return 对象
 */
+ (JPLineChart *)lineChart{
    
    JPLineChart * chart = [JPLineChart new];
    
    return chart;
}

/**
 根据参数的个数返回带N点的折线图
 
 @param count 点的个数
 @return 对象
 */
+ (JPLineChart *)lineChartWithNumber:(NSInteger)count{
    
    JPLineChart * chart = [JPLineChart new];
    
    [chart creatDataWithNumber:count];
    
    return chart;
}

#pragma mark - =============私有方法=================

/**
 初始化UI
 */
- (void)initUI{
    
    //------  创建一个图表  ------//
    [self addSubview:self.lineChart];
    
    [_lineChart mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.mas_offset(0);
        make.left.right.mas_offset(0);
        make.height.mas_equalTo(300);
    }];
    
    //------  添加背景虚线  ------//
    SYBaseLineView *chartBaseView = [[SYBaseLineView alloc] initWithFrame:_lineChart.frame backColor:[UIColor clearColor] lineColor:[UIColor colorWithWhite:0.600 alpha:1.000] horizonLines:3 viticalLines:3];
    chartBaseView.backgroundColor = [UIColor whiteColor];
    [self addSubview:chartBaseView];
    [self bringSubviewToFront:_lineChart];
    
    [chartBaseView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.bottom.left.right.mas_equalTo(_lineChart);
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
        ChartDataEntry * entry = [[ChartDataEntry alloc] initWithX:i y:arc4random()%10];
        [entryArray addObject:entry];
    }
    
    // 生成一个数据集
    _dataSet = [[LineChartDataSet alloc] initWithValues:entryArray label:@"折线"];
    
    [self dataSetSetting];
    
    // 生成一个赋值给图表的数据
    _data = [[LineChartData alloc] initWithDataSet:self.dataSet];
    
    // 赋值给图表
    _lineChart.data = self.data;
}


/**
 数据集设置
 */
- (void)dataSetSetting{
    
    // 画圆设置
    _dataSet.drawCircleHoleEnabled = NO;
    _dataSet.drawCirclesEnabled = NO;
    
    _dataSet.circleColors = @[[UIColor redColor],[UIColor greenColor],[UIColor blueColor]];
    _dataSet.circleHoleColor = [UIColor blueColor];
    
    // 线的设置
//    _dataSet.fillColor = [UIColor lightGrayColor];
//    _dataSet.fillFormatter = self;
    _dataSet.drawFilledEnabled = YES;
    _dataSet.colors = @[[UIColor blackColor]];
    _dataSet.lineWidth = 2;
    _dataSet.drawCubicEnabled = YES; // 圆滑处理
    
    //------  填充渐变色  ------//
    
    NSArray *gradientColors = @[
                                (id)[UIColor colorWithRed:1.000 green:0.886 blue:0.520 alpha:1].CGColor,
                                (id)[UIColor colorWithRed:1.000 green:0.286 blue:0.020 alpha:1.000].CGColor
                                ];
    CGGradientRef gradient     = CGGradientCreateWithColors(nil, (CFArrayRef)gradientColors, nil);
    _dataSet.fillAlpha         = 0.5f;
    _dataSet.fill              = [ChartFill fillWithLinearGradient:gradient angle:90.f];
    _dataSet.drawFilledEnabled = YES;
    
    //------  值的格式化  ------//
    _dataSet.valueFormatter = self;
    _dataSet.drawValuesEnabled = NO;
    
    //------  高亮线的设置  ------//
    
    _dataSet.highlightColor = [UIColor blackColor];
    _dataSet.highlightLineWidth = 2;
    
    _dataSet.drawHorizontalHighlightIndicatorEnabled = NO;
    
}

#pragma mark - =============访问器方法===============

- (LineChartView *)lineChart{
    if (!_lineChart) {
        _lineChart = [LineChartView new];
        
        // 这里写图表的设置
        _lineChart.backgroundColor = [UIColor clearColor];
        
        // X轴显示与否
        _lineChart.xAxis.drawLabelsEnabled = YES;
        //        _lineChart.xAxis.enabled = NO;
        _lineChart.xAxis.valueFormatter = self;
        
        // Y轴不显示值
        _lineChart.leftAxis.enabled = YES;
        _lineChart.rightAxis.enabled = NO;
        _lineChart.leftAxis.drawLabelsEnabled = YES;
        _lineChart.rightAxis.drawLabelsEnabled = NO;
        
        _lineChart.leftAxis.valueFormatter = self;
        _lineChart.rightAxis.valueFormatter = self;
        
        // 显示X轴在下面
        _lineChart.xAxis.labelPosition = XAxisLabelPositionBottom;
        
        // 网络设置
        _lineChart.xAxis.drawGridLinesEnabled = NO;
        _lineChart.leftAxis.gridLineDashLengths = @[@5,@10];
        _lineChart.rightAxis.drawGridLinesEnabled = NO;
        _lineChart.leftAxis.drawGridLinesEnabled = NO;
        
        // 标签说明
        ChartDescription * des = [[ChartDescription alloc] init];
        des.text = @"JP图";
        des.textAlign = NSTextAlignmentCenter;
        des.textColor = [UIColor redColor];
        _lineChart.chartDescription = des;
        
        // 图例样式
        _lineChart.legend.form = ChartLegendFormCircle;
        
        //------  小气泡  ------//
        
        JPBubbleView * bView = [JPBubbleView bubbleViewWithTarget:_lineChart];
        _lineChart.marker = bView;
        
        /*
        
         BalloonMarker *marker = [[BalloonMarker alloc]
                                 initWithColor: [UIColor colorWithWhite:180/255. alpha:1.0]
                                 font: [UIFont systemFontOfSize:12.0]
                                 textColor: UIColor.whiteColor
                                 insets: UIEdgeInsetsMake(8.0, 8.0, 20.0, 8.0)];
        marker.chartView = _chartView;
        marker.minimumSize = CGSizeMake(80.f, 40.f);
        _chartView.marker = marker;
         
         */
        
    }
    return _lineChart;
}

@end
