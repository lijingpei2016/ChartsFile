//
//  JPBubbleView.m
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import "JPBubbleView.h"
#import <Masonry/Masonry.h>

@interface JPBubbleView()

/** 标签 **/
@property (nonatomic, strong) UILabel * label;

/** 父视图 **/
@property (nonatomic, strong) ChartViewBase * superChart;

@end

@implementation JPBubbleView

-(CGPoint)offset{
    return CGPointZero;
}

- (CGPoint)offsetForDrawingAtPoint:(CGPoint)atPoint{
    NSLog(@"offsetForDrawingAtPoint");
    
    return atPoint;
}

- (void)refreshContentWithEntry:(ChartDataEntry * _Nonnull)entry highlight:(ChartHighlight * _Nonnull)highlight{
    
    [self setValue:[NSString stringWithFormat:@"%.0f",entry.y]];
    
    NSLog(@"refreshContentWithEntry");
}

- (void)drawWithContext:(CGContextRef _Nonnull)context point:(CGPoint)point{
    self.frame = CGRectMake(point.x, point.y, 80, 50);
    [_superChart addSubview:self];
    NSLog(@"drawWithContext");
}


+ (id)bubbleViewWithTarget:(ChartViewBase *)target{
    JPBubbleView * bview = [JPBubbleView new];
    bview.superChart = target;
    [bview setUI];
    return bview;
}

- (void)setUI{
    
    [self addSubview:self.label];
    
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.bottom.mas_offset(0);
    }];
}

- (void)setValue:(NSString *)value{
//    _label.text = value;
    
    NSMutableAttributedString * attrStr1 = [[NSMutableAttributedString alloc] initWithString:[NSString stringWithFormat:@" %@",value]];
    [attrStr1 addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, attrStr1.string.length)];
    // 创建一个文字附件对象
    NSTextAttachment *textAttachment = [[NSTextAttachment alloc] init];
    textAttachment.image = [UIImage imageNamed:@"ll"];  //设置图片源
    textAttachment.bounds = CGRectMake(0, - 7, 27, 27);  //设置图片位置和大小
    // 将文字附件转换成属性字符串
    NSAttributedString *attachmentAttrStr = [NSAttributedString attributedStringWithAttachment:textAttachment];
    // 将转换成属性字符串插入到目标字符串
    [attrStr1 insertAttributedString:attachmentAttrStr atIndex:0];
    
    _label.attributedText = attrStr1;
}

-(UILabel *)label{
    if (!_label) {
        _label = [UILabel new];
    }
    return _label;
}

@end
