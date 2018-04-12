//
//  JPChart.h
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPChart : UIView

typedef NS_ENUM(NSUInteger, JPChartType) {
    LineChartType,  // 折线图类型
    BarChartType,   // 柱形图类型
    CandleChartType // K线图类型
};


/**
 根据类型和实体数量创建一个图表

 @param count 实体的个数
 @param type 图表的类型
 @return 图表对象
 */
+ (JPChart *)chartWithCount:(NSInteger)count chartType:(JPChartType)type;

@end
