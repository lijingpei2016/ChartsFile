//
//  BaseView.h
//  绘图
//
//  Created by dengsir on 16/7/10.
//  Copyright © 2016年 Corain. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYBaseLineView : UIView

/**********************  枚举常量   *************************/

/**********************  控件变量   *************************/

/**********************  NSString变量   *************************/

/**********************  NSMutableArray变量   *************************/

/**********************  NSMutableDictionary变量  **********************/

/**********************  NSInteger变量   *************************/

/**
 *  横向线条数量
 */
@property(nonatomic,assign)NSUInteger H_lines;

/**
 *  垂直线条数量
 */
@property(nonatomic,assign)NSUInteger V_lines;

/**********************  BOOL变量   *************************/

/**********************  NSTimer变量   *************************/

/**********************  其他变量  **********************/

/**
 *  线条颜色
 */
@property(nonatomic,strong)UIColor *lineColor;

/**********************  类方法和对象方法  **********************/

/**
 *  初始化baseView
 *
 *  @param frame     大小位置
 *  @param bgcolor   背景颜色
 *  @param lineColor 虚线颜色
 *  @param H_lines   横向线条数
 *  @param V_lines   竖向线条数
 *
 *  @return 对象
 */
-(instancetype)initWithFrame:(CGRect)frame backColor:(UIColor *)bgcolor lineColor:(UIColor *)lineColor horizonLines:(NSUInteger)H_lines viticalLines:(NSUInteger)V_lines;



@end
