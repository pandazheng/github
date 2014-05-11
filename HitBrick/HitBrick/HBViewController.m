//
//  HBViewController.m
//  HitBrick
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "HBViewController.h"

@interface HBViewController ()

@end

@implementation HBViewController
@synthesize level,numOfBricks,speed,score,highest;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    moveDis = CGPointMake(-3, -3);
    speed = 0.03;
    board = [[BoardView alloc] initWithImage:[UIImage imageNamed:@"board.png"]];
    [board setUserInteractionEnabled:YES];
    board.frame = CGRectMake(160, 360, BOARDWIDTH, BOARDHIGHT);
    ball = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fireball.png"]];
    [self.view addSubview:board];
    level = 1;
    score = 0;
    highest = 0;
    levelLabel.text = [NSString stringWithFormat:@"Level %i",level];
    scoreLabel.text = [NSString stringWithFormat:@"Score: %i",score];
    HighestLabel.text = [NSString stringWithFormat:@"Highest: %i",highest];
    [self levelMap:level];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) levelMap:(int)inLevel
{
    UIImageView *brick;
    switch(inLevel)
    {
        case 1:
            bricks = [NSMutableArray arrayWithCapacity:20];
            numOfBricks = 18;
            for (int i = 0 ; i < 3 ; i++)
            {
                for (int j = 0 ; j < 6 ; j++)
                {
                    brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.png"]];
                    brick.frame = CGRectMake(20+j*BRICKWIDTH+j*5, TOP+10+BRICKHIGHT*i+5*i, BRICKWIDTH, BRICKHIGHT);
                    [self.view addSubview:brick];
                    [bricks addObject:brick];
                }
            }
            
/*            brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.png"]];
            brick.frame = CGRectMake(20, TOP+10+20*2+5*4, BRICKWIDTH, BRICKHIGHT);
            [self.view addSubview:brick];
            brick = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.png"]];
            brick.frame = CGRectMake(20+5*BRICKWIDTH+5*5, TOP+10+20*2+5*4, BRICKWIDTH, BRICKHIGHT);
            [self.view addSubview:brick];
            [bricks addObject:brick];*/
            break;
        case 2:
			bricks=[NSMutableArray arrayWithCapacity:28];
			numOfBricks=20;
			for (int i=0; i<7; i++) {
				for (int j=0;j<2;j++) {
					brick=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.png"]];
					brick.frame=CGRectMake(20+j*BRICKWIDTH+j*5, TOP+10+BRICKHIGHT*i+5*i, BRICKWIDTH, BRICKHIGHT);
					[self.view addSubview:brick];
					[bricks addObject:brick];
				}
			}
			for (int i=0; i<7; i++) {
				for (int j=0;j<2;j++) {
					brick=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"brick.png"]];
					brick.frame=CGRectMake(20+j*BRICKWIDTH+j*5+180, TOP+10+BRICKHIGHT*i+5*i, BRICKWIDTH, BRICKHIGHT);
					[self.view addSubview:brick];
					[bricks addObject:brick];
				}
			}
            break;
        default:
            break;
    }
}

- (void) onTimer
{
	float posx,posy;
	posx=ball.center.x; posy=ball.center.y;
	ball.center = CGPointMake(posx+moveDis.x, posy+moveDis.y);
	if (ball.center.x>320 || ball.center.x<0 ) {
		moveDis.x=-moveDis.x;
	}
	if ( ball.center.y<TOP ) {
		moveDis.y=-moveDis.y;
	}
	int j=[bricks count];
	for (int i=0; i<j; i++) {
		UIImageView *brick=(UIImageView *)[bricks objectAtIndex:i];
		if (CGRectIntersectsRect(ball.frame, brick.frame)&&[brick superview]) {
			score+=100;
			[brick removeFromSuperview];
			if (rand()%5==0) {
				UIImageView* imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"shorten.png"]];
				imageView.frame = CGRectMake(brick.frame.origin.x, brick.frame.origin.y, 48, 48);
				[self.view addSubview:imageView];
				[UIView beginAnimations:nil context:(__bridge void *)(imageView)];
				[UIView setAnimationDuration:5.0];
				[UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
				imageView.frame = CGRectMake(brick.frame.origin.x, 380, 40, 40);
				[UIView setAnimationDelegate:self];
				[UIView setAnimationDidStopSelector:@selector(removeSmoke:finished:context:)];
				[UIView commitAnimations];
			}
			numOfBricks--;
			if ((ball.center.y-16<brick.frame.origin.y+BRICKHIGHT || ball.center.y+16>brick.frame.origin.y) && ball.center.x>brick.frame.origin.x && ball.center.x<brick.frame.origin.x+BRICKWIDTH) {
				moveDis.y=-moveDis.y;
			}else if (ball.center.y>brick.frame.origin.y && ball.center.y<brick.frame.origin.y+BRICKHIGHT && (ball.center.x+16>brick.frame.origin.x || ball.center.x-16<brick.frame.origin.x+BRICKWIDTH)){
				moveDis.x=-moveDis.x;
			}else{
				moveDis.x=-moveDis.x;
				moveDis.y=-moveDis.y;
			}
			break;
		}
	}
	if (numOfBricks==0) {
		if (level<2) {
			[ball removeFromSuperview];
			[timer invalidate];
			level++; speed=speed-0.003;
			levelLabel.text=[NSString stringWithFormat:@"Level %i",level];
			[self levelMap:level];
		}else{
			UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"K.O." message:@"Congratulations!You win!" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
		}
	}
	if (CGRectIntersectsRect(ball.frame, board.frame)) {
		if (ball.center.x > board.frame.origin.x&&ball.center.x<board.frame.origin.x+BOARDWIDTH) {
			moveDis.y=-moveDis.y;
		}else {
			moveDis.x=-moveDis.x;
			moveDis.y=-moveDis.y;
		}
	}else{
		if (ball.center.y>380){
			[ball removeFromSuperview];
			[timer invalidate];
			timer=NULL;
			UIAlertView *alert=[[UIAlertView alloc] initWithTitle:@"Game over" message:@"You lose!Let's see if you can do better..." delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil];
			[alert show];
		}
	}
	scoreLabel.text=[NSString stringWithFormat:@"Score:%i",score];
}

- (void) removeSmoke: (NSString *) animationID finished: (NSNumber *) finished context:(void *) context
{
    UIImageView *imageView = (__bridge UIImageView *)(context);
    [imageView removeFromSuperview];
}

- (IBAction) onLeft:(id)sender
{
    board.center = CGPointMake(board.center.x - 10, board.center.y);
}

- (IBAction) onRight:(id)sender
{
    board.center = CGPointMake(board.center.x + 10, board.center.y);
}

- (IBAction) onStart:(id)sender
{
    if (!timer)
    {
        timer = [NSTimer scheduledTimerWithTimeInterval:speed target:self selector:@selector(onTimer) userInfo:nil repeats:YES];
        ball.frame = CGRectMake(160, 328, 32, 32);
        [self.view addSubview:ball];
        board.frame = CGRectMake(160, 360, 48, 10);
    }
}

@end
