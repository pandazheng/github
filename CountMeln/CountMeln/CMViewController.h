//
//  CMViewController.h
//  CountMeln
//
//  Created by panda zheng on 14-5-11.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CMViewController : UIViewController
{
    IBOutlet UILabel *numberLabel;
}

- (IBAction) onAdd: (id) sender;
- (IBAction) onSubtract: (id) sender;

@end
