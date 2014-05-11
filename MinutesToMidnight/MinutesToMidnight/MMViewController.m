//
//  MMViewController.m
//  MinutesToMidnight
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MMViewController.h"

@interface MMViewController ()

@end

@implementation MMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(updateLabel) userInfo:nil repeats:YES];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    [timer invalidate];
}

- (void) updateLabel
{
    NSUInteger unitFlags = NSHourCalendarUnit | NSMinuteCalendarUnit | NSSecondCalendarUnit;
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSGregorianCalendar];
    NSDateComponents *now = [calendar components:unitFlags fromDate:[NSDate date]];
    countDownLabel.text = [NSString stringWithFormat:@"%02d:%02d:%02d",[now hour],[now minute],[now second]];
    NSLog(@"success");
}

@end
