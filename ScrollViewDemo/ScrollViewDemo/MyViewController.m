//
//  MyViewController.m
//  ScrollViewDemo
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()
{
    UIScrollView *_scrollView;
}

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
    
    //创建UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
//    scrollView.frame = CGRectMake(0, 0, 250, 250);
    scrollView.frame = self.view.bounds;
    scrollView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:scrollView];
    
    //创建UIImageView (图片)
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.image = [UIImage imageNamed:@"big.jpg"];
    CGFloat imgW = imageView.image.size.width;
    CGFloat imgH = imageView.image.size.height;
    imageView.frame = CGRectMake(0, 0, imgW, imgH);
    [scrollView addSubview:imageView];
    
    //设置scrollView的属性,设置UIScrollView的滚动范围（内容大小)
    scrollView.contentSize = imageView.image.size;
    
    //隐藏水平滚动条
    scrollView.showsHorizontalScrollIndicator = NO;
    scrollView.showsVerticalScrollIndicator = NO;
    
    // 用来记录scrollview滚动的位置
    //    scrollView.contentOffset = ;
    
    // 去掉弹簧效果
    //    scrollView.bounces = NO;
    
    // 增加额外的滚动区域
    // top  left  bottom  right
    scrollView.contentInset = UIEdgeInsetsMake(20, 20, 20, 20);
    
    _scrollView = scrollView;
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
- (void) down:(UIButton *)sender
{
    [UIView animateWithDuration:1.0 animations:^{
        _scrollView.contentOffset = CGPointMake(0, 0);
    }];
}

@end
