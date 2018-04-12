//
//  JPBubbleView.h
//  ainiuguApp
//
//  Created by dengsir on 30/05/2017.
//  Copyright © 2017 dengsir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Charts/Charts-Swift.h>

@interface JPBubbleView : UIView <IChartMarker>

+ (id)bubbleViewWithTarget:(ChartViewBase *)target;

- (void)setValue:(NSString *)value;

@end
