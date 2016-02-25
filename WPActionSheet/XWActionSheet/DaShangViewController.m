//
//  DaShangViewController.m
//  ZhuBoJieMian
//
//  Created by 温仲斌 on 15/12/7.
//  Copyright © 2015年 温仲斌. All rights reserved.
//

#import "DaShangViewController.h"


#import "XWActionSheet.h"

@interface DaShangViewController ()
@property (strong, nonatomic) IBOutletCollection(UIButton) NSArray *buttons;
@property (strong, nonatomic) UIButton *selectbutton;

@end

@implementation DaShangViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    for (UIButton *button in _buttons) {
        button.layer.cornerRadius = 5;
        button.layer.masksToBounds = YES;
        button.layer.borderColor = [UIColor orangeColor].CGColor;
        button.backgroundColor = [UIColor whiteColor];
        button.layer.borderWidth = .5f;
        button.layer.contentsScale = [UIScreen mainScreen].scale;
        [button addTarget:self action:@selector(button1BackGroundHighlighted:) forControlEvents:UIControlEventTouchDown];
//        [button addTarget:self action:@selector(button1BackGroundNormal:) forControlEvents:UIControlEventTouchUpInside];
         }
}

- (void)button1BackGroundNormal:(UIButton *)sender
{
    sender.backgroundColor = [UIColor whiteColor];
    [sender setTitleColor:[UIColor orangeColor] forState:UIControlStateNormal];
}


- (void)button1BackGroundHighlighted:(UIButton *)sender
{
    [self button1BackGroundNormal:_selectbutton];
    sender.backgroundColor = [UIColor orangeColor];
    [sender setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    _selectbutton = sender;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)shangButton:(id)sender {
    
    XWActionSheet *p = [[XWActionSheet alloc]initWithTitleArray:@[@"微信支付", @"支付宝", @"银联", @"花呗", @"信用卡", @"招商", @"取消"]];
    [p show];
    
    [p setIdxBlock:^(NSInteger idx) {
        NSLog(@"%@", @(idx));
    }];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
