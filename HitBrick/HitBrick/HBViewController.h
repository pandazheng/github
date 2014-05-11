//
//  HBViewController.h
//  HitBrick
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BoardView.h"

#define BRICKHIGHT 15
#define BRICKWIDTH 44
#define BOARDHIGHT 10
#define BOARDWIDTH 48
#define TOP 40


@interface HBViewController : UIViewController
{
    IBOutlet UILabel *HighestLabel;
    IBOutlet UILabel *levelLabel;
    IBOutlet UILabel *scoreLabel;
    
    NSTimer *timer;
    UIImageView *ball;
    CGPoint moveDis;
    BoardView *board;
    NSMutableArray *bricks;
    int level,numOfBricks,score,highest;
    double speed;
}

@property (nonatomic,assign) int level,score,highest;
@property (nonatomic,assign) int numOfBricks;
@property (nonatomic,assign) double speed;

- (IBAction)onLeft: (id) sender;
- (IBAction)onRight: (id) sender;
- (IBAction)onStart: (id) sender;
- (void) levelMap: (int) inLevel;

@end
