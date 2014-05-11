//
//  CalculatorViewController.m
//  Calculator
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "CalculatorViewController.h"

@interface CalculatorViewController ()

@end

@implementation CalculatorViewController
@synthesize num1,num2,numOperator,isAppending;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    numOperator = nil;
    num1 = -1;
    num2 = -1;
    isAppending = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction) ShowNumber: (id)sender
{
    NSString *temp;
    temp = [[NSString alloc] initWithString:result.text];
    if (isAppending != YES)
    {
        temp = @"";
        isAppending = YES;
    }
    
    if ([result.text isEqualToString:@"0"])
    {
        temp = @"";
    }
    result.text = [temp stringByAppendingString:[[(UIButton*) sender titleLabel] text]];
}

- (IBAction) SetOperator: (id)sender
{
    NSString *temp;
    if (num1 != -1 && numOperator != nil)
    {
        [self ShowResult:sender];
    }
    
    temp = [[NSString alloc] initWithString:result.text];
    numOperator = [[(UIButton *) sender titleLabel] text];
    num1 = [temp intValue];
    isAppending = NO;
}

- (IBAction) ShowResult: (id)sender
{
    NSString *temp;
    temp = [[NSString alloc] initWithString:result.text];
    num2 = [temp intValue];
    isAppending = NO;
    if ([numOperator isEqualToString:@"+"])
    {
        result.text = [NSString stringWithFormat:@"%i",num1 + num2];
    }
    else if ([numOperator isEqualToString:@"-"])
    {
        result.text = [NSString stringWithFormat:@"%i",num1 - num2];
    }
    else if ([numOperator isEqualToString:@"*"])
    {
        result.text = [NSString stringWithFormat:@"%i",num1 * num2];
    }
    else if ([numOperator isEqualToString:@"/"])
    {
        if (num2 == 0)
        {
            result.text = @"The divider can't be zero";
        }
        else
        {
            result.text = [NSString stringWithFormat:@"%i",num1/num2];
        }
    }
    
    num1 = -1;
    num2 = -1;
    numOperator = nil;
}

@end
