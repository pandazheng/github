//
//  CalculatorViewController.h
//  Calculator
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CalculatorViewController : UIViewController
{
    IBOutlet UITextField * result;
    int num1,num2;
    NSString *numOperator;
    BOOL isAppending;
}

@property (nonatomic,assign) int num1,num2;
@property (nonatomic,strong) NSString *numOperator;
@property (nonatomic,assign) BOOL isAppending;

- (IBAction)ShowNumber: (id)sender;
- (IBAction)SetOperator: (id) sender;
- (IBAction)ShowResult: (id)sender;

@end
