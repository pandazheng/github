//
//  BFViewController.m
//  Bonfire
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "BFViewController.h"

@interface BFViewController ()

@end

@implementation BFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    UIImageView *campFireView = [[UIImageView alloc] initWithFrame:self.view.bounds];
	campFireView.animationImages = [NSArray arrayWithObjects: [UIImage imageNamed:@"campFire01.gif"],
                                    [UIImage imageNamed:@"campFire02.gif"],
                                    [UIImage imageNamed:@"campFire03.gif"],
                                    [UIImage imageNamed:@"campFire04.gif"],
                                    [UIImage imageNamed:@"campFire05.gif"],
                                    [UIImage imageNamed:@"campFire06.gif"],
                                    [UIImage imageNamed:@"campFire07.gif"],
                                    [UIImage imageNamed:@"campFire08.gif"],
                                    [UIImage imageNamed:@"campFire09.gif"],
                                    [UIImage imageNamed:@"campFire10.gif"],
                                    [UIImage imageNamed:@"campFire11.gif"],
                                    [UIImage imageNamed:@"campFire12.gif"],
                                    [UIImage imageNamed:@"campFire13.gif"],
                                    [UIImage imageNamed:@"campFire14.gif"],
                                    [UIImage imageNamed:@"campFire15.gif"],
                                    [UIImage imageNamed:@"campFire16.gif"],
                                    [UIImage imageNamed:@"campFire17.gif"],nil];
    campFireView.animationDuration = 1.75;
    campFireView.animationRepeatCount = 0;
    [campFireView startAnimating];
    [self.view addSubview:campFireView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
