//
//  SecondViewController.m
//  PassValueInTwoViewController
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()
{
    UILabel *userNameTextField;
    UILabel *gendarTextField;
    UILabel *ageTextField;
}

@end

@implementation SecondViewController
@synthesize userEntity,userNameTextField,gendarTextField,ageTextField;

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
    userNameTextField = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, 200, 100)];
    userNameTextField.backgroundColor = [UIColor redColor];
    gendarTextField = [[UILabel alloc] initWithFrame:CGRectMake(10, 100, 200, 100)];
    gendarTextField.backgroundColor = [UIColor redColor];
    ageTextField = [[UILabel alloc] initWithFrame:CGRectMake(10, 180, 200, 100)];
    ageTextField.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:userNameTextField];
    [self.view addSubview:gendarTextField];
    [self.view addSubview:ageTextField];
    
    UIButton *back = [[UIButton alloc] initWithFrame:CGRectMake(10, 240, 200, 100)];
    back.backgroundColor = [UIColor blueColor];
    [back setTitle:@"返回" forState:UIControlStateNormal];
    [back addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:back];
    
    self.userNameTextField.text = self.userEntity.userName;
    self.gendarTextField.text = self.userEntity.gendar;
    self.ageTextField.text = [NSString stringWithFormat:@"%d",self.userEntity.age];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) backButton:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:^(void){
        
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
