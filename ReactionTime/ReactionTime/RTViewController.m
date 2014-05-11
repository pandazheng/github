//
//  RTViewController.m
//  ReactionTime
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "RTViewController.h"
#define RED 0
#define YELLOW 1
#define GREEN 2

@interface RTViewController ()

@end

@implementation RTViewController
@synthesize state,startDate;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    state = YELLOW;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) alertView: (UIAlertView *) alertview didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    state = YELLOW;
    timer = [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
    [imageView setImage:[UIImage imageNamed:@"yellowLightSmall.png"]];
}

- (IBAction) onClick: (id) sender;
{
    NSString *temp;
    if (state != GREEN)
    {
        temp = @"冷静一下,必须等到绿灯了才能点击";
    }
    else
    {
        NSLog(@"success");
        double time = (double)[startDate timeIntervalSinceNow] * -1000;
        temp = [[NSString alloc] initWithFormat:@"非常好，你的反应时间是 %1.0f 微秒，再试试看能不能做的更好吧!",time];
    }
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"反应时间" message:temp delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
    [alert show];
    [timer invalidate];
}

- (void) onTimer
{
    if (state == RED)
    {
        [imageView setImage:[UIImage imageNamed:@"greenLightSmall.png"]];
        state = GREEN;
        self.startDate = [NSDate date];
    }
    else if (state == YELLOW)
    {
        [timer invalidate];
        timer = [NSTimer scheduledTimerWithTimeInterval:rand()%6 target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        [imageView setImage:[UIImage imageNamed:@"redLightSmall.png"]];
        state = RED;
    }
}

@end
