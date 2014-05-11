//
//  SFViewController.m
//  SnowFall
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "SFViewController.h"

@interface SFViewController ()

@end

@implementation SFViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
//    timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(onTimer:) userInfo:nil repeats:YES];
}

- (void) onTimer: (CGPoint) rect
{
    UIImageView *snow = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"flake.png"]];
    
    [UIView beginAnimations:nil context:(__bridge void *)snow];
    snow.frame = CGRectMake(rect.x, rect.y, 10, 10);
    
    
    [UIView setAnimationDuration:3];
    snow.frame = CGRectMake(rect.x, rect.y, 100, 100);
    [self.view addSubview:snow];
    [UIView setAnimationDelegate:self];
    snow.alpha = 0.1;
    [UIView setAnimationDidStopSelector:@selector(onStop:finished:context:)];
}

- (void) onStop:(NSString *) animationID finished:(NSNumber *) finished context:(void *) context
{
    UIImageView *snow = (__bridge UIImageView *)(context);
    [snow removeFromSuperview];
}

- (void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSSet *allTouches = [event allTouches];
    
    switch([allTouches count])
    {
        case 1:
        {
            UITouch *touch = [[allTouches allObjects] objectAtIndex:0];
			CGPoint point=[touch locationInView:self.view];
            [self onTimer:point];
        }
            break;
        default:
            break;
    }
}

- (void) touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"success");
    UITouch *touch = [touches anyObject];
    CGPoint location = [touch locationInView:self.view];
    [self onTimer:location];
}

@end
