//
//  ViewController.h
//  Password
//
//  Created by panda zheng on 14-5-5.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <sqlite3.h>

@interface ViewController : UIViewController
{
    sqlite3 *contactDB;
    
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
    
    NSString *databasePath;
}

@property (nonatomic,strong) UITextField *passwordLength;
@property (nonatomic,strong) UITextField *password;
@property (nonatomic,strong) UITextView *phoneticPassword;
@property (nonatomic,strong) UIButton *emailPasswordButton;
@property (nonatomic,strong) UIButton *createPassword;

- (IBAction) setPassword;
- (IBAction) textFieldDoneEditing: (id) sender;
- (IBAction) emailPassword;

@end
