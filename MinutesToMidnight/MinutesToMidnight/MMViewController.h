//
//  MMViewController.h
//  MinutesToMidnight
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MMViewController : UIViewController
{
    IBOutlet UILabel *countDownLabel;
    NSTimer *timer;
}

- (void) updateLabel;

@end
