//
//  MyViewController.m
//  UIViewUIImageViewUILabel
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

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
    
    [[UIApplication sharedApplication] setStatusBarHidden:YES];
    
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(10, 30, 200, 100)];
    view.backgroundColor = [UIColor colorWithRed:1 green:0 blue:0 alpha:0.6];
    [self.view addSubview:view];
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 140, 200, 100)];
    imageView.backgroundColor = [UIColor colorWithRed:0 green:1 blue:0 alpha:0.6];
    [self.view addSubview:imageView];
    
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(10, 230, 200, 100)];
    label.backgroundColor = [UIColor colorWithRed:0 green:0 blue:1 alpha:0.6];
    [self.view addSubview:label];
    
    //下面我们分别设置 imageView、 label 的各自属性 来看看他们的不同, 48 49行去掉注释
    //*******************************************************************************
    //imageView.image = [UIImage imageNamed:@"mao.jpg"];
    //label.text = @"这是一只猫。";
    //编译运行。 到这里我们可以看到他们各自独特的属性，一个可以设置图片属性，一个可以设置文字属性。
    
    //以下是UILabel的一些其他属性，你可以试着修改，并观察效果。
    //    label.font = [UIFont systemFontOfSize:60];
    //    label.textColor = [UIColor whiteColor];
    //    label.shadowColor = [UIColor yellowColor];
    //    label.shadowOffset = CGSizeMake(1, 1);
    //    label.textAlignment = NSTextAlignmentCenter;
    //    label.lineBreakMode = NSLineBreakByCharWrapping;
    //    label.numberOfLines = 2;

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
