//
//  JPBarChart.h
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JPBarChart : UIView

/**
 创建一个barChart对象
 
 @return 对象
 */
+ (JPBarChart *)barChart;


/**
 根据参数的个数返回带N点的折线图
 
 @param count 点的个数
 @return 对象
 */
+ (JPBarChart *)barChartWithNumber:(NSInteger)count;

@end
