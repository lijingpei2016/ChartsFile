//
//  BaseView.m
//  绘图
//
//  Created by dengsir on 16/7/10.
//  Copyright © 2016年 Corain. All rights reserved.
//

#import "SYBaseLineView.h"
#define width self.frame.size.width
#define height self.frame.size.height
@implementation SYBaseLineView

-(instancetype)initWithFrame:(CGRect)frame backColor:(UIColor *)bgcolor lineColor:(UIColor *)lineColor horizonLines:(NSUInteger)H_lines viticalLines:(NSUInteger)V_lines
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = bgcolor;
        self.lineColor = lineColor;
        self.H_lines = H_lines;
        self.V_lines =V_lines;
        self.layer.borderColor = lineColor.CGColor;
        self.layer.borderWidth = 0.5;
    }
    return self;
}


-(void)drawRect:(CGRect)rect{
    
    //1.获取图形上下文
    CGContextRef ctx=UIGraphicsGetCurrentContext();

    CGFloat lengths[] = {1,1};
    CGContextSetLineDash(ctx, 0,lengths, 1);
    
    [self.lineColor setStroke];

    //2.绘图（画横线）
    for (int i = 0; i<self.H_lines; i++) {
        //设置起点
        CGContextMoveToPoint(ctx, 0, height/(self.H_lines+1)*(i+1));
        //设置终点
        CGContextAddLineToPoint(ctx, width, height/(self.H_lines+1)*(i+1));
        //渲染
        CGContextStrokePath(ctx);
    }
    
    //3。画竖线
    for (int j=0; j<self.V_lines; j++) {
        //设置起点
        CGContextMoveToPoint(ctx,width/(self.V_lines+1)*(j+1), 0);
        //设置终点
        CGContextAddLineToPoint(ctx, width/(self.V_lines+1)*(j+1), height);
        //渲染
        CGContextStrokePath(ctx);
        
    }
    
}

@end
