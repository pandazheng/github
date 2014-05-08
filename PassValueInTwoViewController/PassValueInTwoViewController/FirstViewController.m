//
//  FirstViewController.m
//  PassValueInTwoViewController
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "FirstViewController.h"
#import "SecondViewController.h"
#import "UserEntity.h"

@interface FirstViewController ()
{
    UITextField *userNameTextField;
    UITextField *gendarTextField;
    UITextField *ageTextField;
}

@end

@implementation FirstViewController
@synthesize userNameTextField,gendarTextField,ageTextField;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    userNameTextField =  [[UITextField alloc] initWithFrame:CGRectMake(10, 20, 200, 40)];
    userNameTextField.borderStyle = UITextBorderStyleRoundedRect;
    userNameTextField.contentVerticalAlignment = NSTextAlignmentLeft;
    gendarTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 80, 200, 40)];
    gendarTextField.borderStyle = UITextBorderStyleRoundedRect;
    gendarTextField.contentVerticalAlignment = NSTextAlignmentLeft;
    ageTextField = [[UITextField alloc] initWithFrame:CGRectMake(10, 140, 200, 40)];
    ageTextField.borderStyle = UITextBorderStyleRoundedRect;
    ageTextField.contentVerticalAlignment = NSTextAlignmentLeft;
    
    UIButton *pass = [[UIButton alloc] initWithFrame:CGRectMake(10, 200, 200, 100)];
    pass.backgroundColor = [UIColor blueColor];
    [pass setTitle:@"传值过去" forState:UIControlStateNormal];
    [pass addTarget:self action:@selector(passValueButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:pass];
    
    [self.view addSubview:userNameTextField];
    [self.view addSubview:gendarTextField];
    [self.view addSubview:ageTextField];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) passValueButton:(id)sender
{
    //构建UserEntity对象
    UserEntity *userEntity = [[UserEntity alloc] init];
    userEntity.userName = self.userNameTextField.text;
    userEntity.gendar = self.gendarTextField.text;
    userEntity.age = [self.ageTextField.text intValue];
    
    SecondViewController *secondView = [[SecondViewController alloc] initWithNibName:nil bundle:nil];
    secondView.userEntity = userEntity;
    
    [self presentViewController:secondView animated:YES completion:^(void){
        
    }];
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
