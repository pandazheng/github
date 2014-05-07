//
//  LLViewController.m
//  UINavViewController
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "LLViewController.h"

@interface LLViewController ()

@end

@implementation LLViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIButton *popBtn = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 100, 60)];
    [popBtn addTarget:self action:@selector(popVC:) forControlEvents:UIControlEventTouchUpInside];
    [popBtn setTitle:@"popVC" forState:UIControlStateNormal];
    [self.view addSubview:popBtn];
}

- (void) popVC: (UIButton *) btn
{
    //由于是push过来的，这里使用pop方式导航回去
    //*******************************************************************************
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
