//
//  ViewController.m
//  NHDynamicCellPro
//
//  Created by hu jiaju on 15/11/6.
//  Copyright © 2015年 hu jiaju. All rights reserved.
//

#import "ViewController.h"
#import "NHXIBDynamicVCR.h"
#import "NHCodeDynamicVCR.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.title = @"Dynamic Cell";
    
    CGSize mainSize = [[UIScreen mainScreen] bounds].size;
    CGRect infoRect = CGRectMake(0, 100, mainSize.width, 50);
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = infoRect;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"XIB Dynamic" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(xibDynamicEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    
    infoRect.origin.y += 70;
    btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame = infoRect;
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setTitle:@"Code Dynamic" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(codeDynamicEvent) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}

- (void)xibDynamicEvent {
    
    NHXIBDynamicVCR *labelVCR = [[NHXIBDynamicVCR alloc] init];
    [self.navigationController pushViewController:labelVCR animated:true];
}

- (void)codeDynamicEvent {
    NHCodeDynamicVCR *labelVCR = [[NHCodeDynamicVCR alloc] init];
    [self.navigationController pushViewController:labelVCR animated:true];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
