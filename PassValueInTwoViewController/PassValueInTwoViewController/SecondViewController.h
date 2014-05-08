//
//  SecondViewController.h
//  PassValueInTwoViewController
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UserEntity.h"

@interface SecondViewController : UIViewController
{

}

@property (nonatomic,strong) UserEntity *userEntity;
@property (nonatomic,strong) UILabel *userNameTextField;
@property (nonatomic,strong) UILabel *gendarTextField;
@property (nonatomic,strong) UILabel *ageTextField;

- (void) backButton: (id) sender;

@end
