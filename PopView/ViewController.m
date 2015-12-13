//
//  ViewController.m
//  PopView
//
//  Created by chentianyu on 15/12/11.
//  Copyright © 2015年 chentianyu. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@property BOOL isShow;
@property(nonatomic,strong)PopView *popView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.isShow = false;
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setFrame:CGRectMake(150, 50, 50, 30)];
    [button setBackgroundColor:[UIColor blackColor]];
    [button setTitle:@"单击" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(isshow) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    self.array = [[NSArray alloc] initWithObjects:@"Item1",@"Item2",@"Item3", nil];

    self.popView = [[PopView alloc] initWithFrame:CGRectMake(100, 100, 200, 300) direction:Bottom stachView:button items:self.array];
    self.popView.delegate = self;//实现委托
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)isshow
{
    if (!self.isShow) {
        self.isShow = true;
        [self.view addSubview:self.popView];
    }else{
        self.isShow = false;
        [self.popView removeFromSuperview];
    }
}

- (void)itemSelected:(int)index
{
    
    NSLog(@"%@",[self.array objectAtIndex:(NSUInteger)index]);
}

@end
