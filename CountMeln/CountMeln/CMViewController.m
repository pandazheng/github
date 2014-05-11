//
//  CMViewController.m
//  CountMeln
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "CMViewController.h"

@interface CMViewController ()

@end

@implementation CMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    numberLabel.text = @"0";
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) onAdd:(id)sender
{
    int temp = [numberLabel.text intValue] + 1;
    NSLog(@"%i",temp);
    numberLabel.text = [NSString stringWithFormat:@"%i",temp];
}

- (IBAction) onSubtract:(id)sender
{
    int temp = [numberLabel.text intValue] - 1;
    NSLog(@"%i",temp);
    numberLabel.text = [NSString stringWithFormat:@"%i",temp];
}

@end
