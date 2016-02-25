//
//  PromptView.m
//  ZhuBoJieMian
//
//  Created by 温仲斌 on 15/12/8.
//  Copyright © 2015年 温仲斌. All rights reserved.
//

#import "XWActionSheet.h"

#define W CGRectGetWidth([UIScreen mainScreen].bounds)
#define H CGRectGetHeight([UIScreen mainScreen].bounds)

@interface itemLabel : UILabel

@property (nonatomic) BOOL theDivider;

- (id)initWithFrame:(CGRect)frame theDivider:(BOOL)theDivider;
@end

@implementation itemLabel

- (id)initWithFrame:(CGRect)frame theDivider:(BOOL)theDivider {
    self = [super initWithFrame:frame];
    if (self) {
        _theDivider = theDivider;
    }
    return self;
}

- (void)drawRect:(CGRect)rect {
    if (_theDivider) {
        UIBezierPath *b = [UIBezierPath bezierPath];
        [b moveToPoint:CGPointMake(0, CGRectGetHeight(self.frame) - .5)];
        [b addLineToPoint:CGPointMake(CGRectGetWidth(self.frame), CGRectGetHeight(self.frame) - .1)];
        [[UIColor lightGrayColor]set];
        self.layer.contentsScale = [UIScreen mainScreen].scale;
        [b setLineWidth:.1];
        [b stroke];
    }
    [super drawRect:rect];
}

@end

@interface XWActionSheet ()

@property (nonatomic, strong) UIView *bigView;
@property (nonatomic) CGFloat count;

@end

@implementation XWActionSheet


- (id)initWithTitleArray:(NSArray *)titleArray {
    self = [super init];
    if (self) {
        self.frame = [UIScreen mainScreen].bounds;
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.1];
        self.bigView = [[UIView alloc]init];
        
        [self addSubview:_bigView];
        __weak typeof(self) selfBlock = self;
        
        _count = titleArray.count;
        [titleArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            itemLabel *label;
            if (idx == (titleArray.count - 1)) {
                 label =[[itemLabel alloc]initWithFrame:CGRectMake(0, idx * 44 + 10, W, 44) theDivider:NO];
            }else {
                if (idx == (titleArray.count - 2)) {
                    label = [[itemLabel alloc]initWithFrame:CGRectMake(0, idx * 44, W, 44 )  theDivider:NO];
                }else {
                    label = [[itemLabel alloc]initWithFrame:CGRectMake(0, idx * 44, W, 44 )  theDivider:YES];
                }
            }
            UITapGestureRecognizer *tapLabel = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(tap:)];
            label.userInteractionEnabled = YES;
            [label addGestureRecognizer:tapLabel];
            label.backgroundColor = [UIColor whiteColor];
            label.text = obj;
            label.textAlignment = NSTextAlignmentCenter;
            label.tag = 100 + idx;
            [selfBlock.bigView addSubview:label];
        }];
        _bigView.frame = CGRectMake(0,H + titleArray.count * 44 + 10 + 10, W, titleArray.count * 44 + 10);
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(dissmiss)];
        [self addGestureRecognizer:tap];
    }
    return self;
}

- (void)tap:(UITapGestureRecognizer *)tapG {
    UILabel *label = (UILabel *)tapG.view;
    if (_idxBlock) {
        _idxBlock(label.tag - 100);
    }
    [self dissmiss];
}

- (void)show {
    UIWindow *window = [[UIApplication sharedApplication].windows firstObject];
    
    [window addSubview:self];
    
    [UIView animateWithDuration:.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
        _bigView.transform = CGAffineTransformMakeTranslation(0, - 2 * (_count * 44 + 10 + 10) + 10);
    }];
}

- (void)dissmiss {
    [UIView animateWithDuration:.3 animations:^{
        [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
        _bigView.transform = CGAffineTransformIdentity;
    } completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}


@end
