//
//  SFViewController.h
//  SnowFall
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SFViewController : UIViewController
{
    NSTimer *timer;
}

- (void) onTimer: (CGPoint) rect;

@end
