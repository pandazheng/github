//
//  FirstViewController.h
//  PassValueInTwoViewController
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController
{
    
}

@property (nonatomic,strong) UITextField *userNameTextField;
@property (nonatomic,strong) UITextField *gendarTextField;
@property (nonatomic,strong) UITextField *ageTextField;

- (void) passValueButton: (id) sender;

@end
