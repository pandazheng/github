//
//  MyViewController.m
//  UIButtonUITextFieldUITextView
//
//  Created by panda zheng on 14-5-7.
//  Copyright (c) 2014年 panda zheng. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController () <UITextFieldDelegate,UITextViewDelegate>
{
    UITextField *textField;
    UITextView  *textView;
}

@end

@implementation MyViewController

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
    
    textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 20, 200, 40)];
    textField.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:0.5];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.delegate = self;
    textField.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [self.view addSubview:textField];
    textField.placeholder = @"请输入文字";
    
    UIButton *textFieldButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 20, 90, 40)];
    textFieldButton.backgroundColor = [UIColor redColor];
    [textFieldButton setTitle:@"清除文字" forState:UIControlStateNormal];
    [textFieldButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [textFieldButton addTarget:self action:@selector(onTextFieldButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textFieldButton];
    
    textView = [[UITextView alloc] initWithFrame:CGRectMake(10, 60, 200, 200)];
    textView.backgroundColor = [UIColor colorWithRed:0.5 green:0.5 blue:0 alpha:0.5];
    textView.font = [UIFont systemFontOfSize:18];
    textView.textColor = [UIColor redColor];
    textView.textAlignment = NSTextAlignmentLeft;
    textView.delegate = self;
    [self.view addSubview:textView];
    
    UIButton *textViewButton = [[UIButton alloc] initWithFrame:CGRectMake(220, 140, 90, 40)];
    textViewButton.backgroundColor = [UIColor redColor];
    [textViewButton setTitle:@"清除文字" forState:UIControlStateNormal];
    [textViewButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [textViewButton addTarget:self action:@selector(onTextViewButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:textViewButton];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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

//以下是UITextFieldDelegate 的部分委托实现
//*******************************************************************************
#pragma mark -------------------
#pragma mark UITextFieldDelegate

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    // return NO to disallow editing.
    return YES;
}
- (void)textFieldDidBeginEditing:(UITextField *)textField{
    // became first responder
    // 在这里监听UITextField becomeFirstResponder事件
}
- (BOOL)textFieldShouldEndEditing:(UITextField *)textField{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    return YES;
}
- (void)textFieldDidEndEditing:(UITextField *)textField{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    // 在这里监听UITextField resignFirstResponder事件
}
- (BOOL)textField:(UITextField *)_textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    // return NO to not change text
    NSLog(@"inputText: %@", textField.text);
    return YES;
}
//*******************************************************************************
#pragma mark -------------------
#pragma mark textFieldButton 的响应函数
- (void)onTextFieldButtonClicked:(UIButton*)button{
    [textView resignFirstResponder];
    [textField resignFirstResponder];
    textField.text = @"";
}

//以下是UITextViewDelegate 的部分委托实现
//*******************************************************************************
#pragma mark -------------------
#pragma mark UITextViewDelegate

- (BOOL)textViewShouldBeginEditing:(UITextView *)textView{
    // return NO to disallow editing.
    return YES;
}
- (void)textViewDidBeginEditing:(UITextView *)textView{
    // became first responder
    // 在这里监听UITextView becomeFirstResponder事件
}
- (BOOL)textViewShouldEndEditing:(UITextView *)textView{
    // return YES to allow editing to stop and to resign first responder status. NO to disallow the editing session to end
    return YES;
}
- (void)textViewDidEndEditing:(UITextView *)textView{
    // may be called if forced even if shouldEndEditing returns NO (e.g. view removed from window) or endEditing:YES called
    // 在这里监听UITextView resignFirstResponder事件
}
- (void)textViewDidChangeSelection:(UITextView *)_textView{
    NSLog(@"textView: %@", textView.text);
}

//*******************************************************************************
#pragma mark -------------------
#pragma mark textViewButton 的响应函数
- (void)onTextViewButtonClicked:(UIButton*)button{
    [textView resignFirstResponder];
    [textField resignFirstResponder];
    textView.text = @"";
}

@end
