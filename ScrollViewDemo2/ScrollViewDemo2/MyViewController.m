//
//  MyViewController.m
//  ScrollViewDemo2
//
//  Created by panda zheng on 14-5-10.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController () <UIScrollViewDelegate>
{
    UIImageView *_imageView;
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
    
    //添加UIScrollView
    UIScrollView *scrollView = [[UIScrollView alloc] init];
    scrollView.frame = self.view.bounds;
    [self.view addSubview:scrollView];
    
    //添加图片
    UIImage *image = [UIImage imageNamed:@"big.jpg"];
    _imageView = [[UIImageView alloc] initWithImage:image];
    
    [scrollView addSubview:_imageView];
    
    //设置内容范围
    scrollView.contentSize = image.size;
    
    //设置scrollView的代理对象
    scrollView.delegate = self;
    
    
    //设置最大伸缩比例
    scrollView.maximumZoomScale = 2.0;
    
    //设置最小伸缩比例
    scrollView.minimumZoomScale = 0.2;
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

#pragma mark --UIScrollView 的代理方法
#pragma mark 这个方法返回的控件就能进行捏合手势缩放操作
#pragma mark 当UIScrollView尝试进行缩放的时候就会调用
- (UIView *) viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    return _imageView;
}

#pragma mark 当缩放完毕的时候调用
- (void) scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale
{
    NSLog(@"结束缩放 - %f",scale);
}

#pragma mark 当正在缩放的时候调用
- (void) scrollViewDidZoom:(UIScrollView *)scrollView
{
    NSLog(@"----------");
}

@end
