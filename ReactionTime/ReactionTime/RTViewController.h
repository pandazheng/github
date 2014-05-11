//
//  RTViewController.h
//  ReactionTime
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RTViewController : UIViewController{
    IBOutlet UIImageView *imageView;
    NSTimer *timer;
    int state;
    NSDate *startDate;
}

@property (nonatomic,assign) int state;
@property (nonatomic,copy) NSDate* startDate;
- (IBAction)onClick :(id)sender;

@end
