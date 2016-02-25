//
//  ViewController.m
//  XWActionSheet
//
//  Created by 温仲斌 on 15/12/8.
//  Copyright © 2015年 温仲斌. All rights reserved.
//

#import "ViewController.h"

#import "DaShangViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
   
}
- (IBAction)push:(id)sender {
    DaShangViewController *da = [[DaShangViewController alloc]initWithNibName:@"DaShangViewController" bundle:nil];
    [self.navigationController pushViewController:da animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
