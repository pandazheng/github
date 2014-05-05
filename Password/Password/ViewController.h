//
//  ViewController.h
//  Password
//
//  Created by panda zheng on 14-5-5.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
{
    IBOutlet UITextField *passwordLength;
    IBOutlet UISwitch *includeLowerCase;
    IBOutlet UISwitch *includeNumbers;
    IBOutlet UISwitch *includePunctuation;
    IBOutlet UISwitch *includeUpperCase;
    IBOutlet UISwitch *showPhonetics;
    IBOutlet UITextField *password;
    IBOutlet UITextView *phoneticPassword;
    IBOutlet UIButton *emailPasswordButton;
    IBOutlet UIButton *createPassword;
}

@property (nonatomic,strong) UITextField *passwordLength;
@property (nonatomic,strong) UITextView *phoneticPassword;
@property (nonatomic,strong) UIButton *emailPasswordButton;
@property (nonatomic,strong) UIButton *createPassword;

- (IBAction) setPassword;
- (IBAction) textFieldDoneEditing: (id) sender;
- (IBAction) emailPassword;

@end
