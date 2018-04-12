//
//  JPChart.m
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import "JPChart.h"
#import <Masonry/Masonry.h>

#import "JPBarChart.h"
#import "JPLineChart.h"
#import "JPCandleChart.h"

@implementation JPChart

/**
 根据类型和实体数量创建一个图表
 
 @param count 实体的个数
 @param type 图表的类型
 @return 图表对象
 */
+ (JPChart *)chartWithCount:(NSInteger)count chartType:(JPChartType)type{
    
    JPChart * chart = [JPChart new];
    
    switch (type) {
        case LineChartType:
        {
            // 折线图
            JPLineChart * lineChart =  [JPLineChart lineChartWithNumber:count];
            [chart addSubview:lineChart];
            
            [lineChart mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.bottom.mas_offset(0);
            }];
        }
            break;
        case BarChartType:
        {
            // 柱状图
            JPBarChart * barChart =  [JPBarChart barChartWithNumber:count];
            [chart addSubview:barChart];
            
            [barChart mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.left.right.bottom.mas_offset(0);
            }];
        }
            break;
        case CandleChartType:
        {
            
        }
            break;
        default:
            break;
    }
    
    return chart;
}

@end
