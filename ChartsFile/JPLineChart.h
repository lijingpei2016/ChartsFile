//
//  LineChart.h
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPLineChart : UIView

/**
 创建一个lineChart对象

 @return 对象
 */
+ (JPLineChart *)lineChart;


/**
 根据参数的个数返回带N点的折线图

 @param count 点的个数
 @return 对象
 */
+ (JPLineChart *)lineChartWithNumber:(NSInteger)count;

@end
