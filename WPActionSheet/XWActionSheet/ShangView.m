//
//  ShangView.m
//  ZhuBoJieMian
//
//  Created by 温仲斌 on 15/12/7.
//  Copyright © 2015年 温仲斌. All rights reserved.
//

#import "ShangView.h"

@implementation ShangView

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    UIBezierPath *p = [UIBezierPath bezierPath];
//    [p moveToPoint:CGPointMake(self.frame.size.width / 2, 0)];
    [p addArcWithCenter:CGPointMake(self.frame.size.width / 2, 150 + self.frame.size.height) radius:300 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    [[UIColor redColor]set];
    [p fill];
//    [p stroke];
    
    
}

@end
