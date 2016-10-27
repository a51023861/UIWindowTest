//
//  PasswordInputWindow.m
//  UIWindowTest
//
//  Created by 刘璇 on 2016/10/5.
//  Copyright © 2016年 刘璇. All rights reserved.
//

#import "PasswordInputWindow.h"

@implementation PasswordInputWindow
{
    UITextField * _textField;
}
+(PasswordInputWindow *)sharedInstance
{
    static id sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc]initWithFrame:[[UIScreen mainScreen]bounds]];
    });
    return sharedInstance;
}
-(void)show
{
    [self makeKeyWindow];
    self.hidden = NO;
}
-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel * lb = [[UILabel alloc]initWithFrame:CGRectMake(10, 50, 200, 20)];
        lb.text = @"请输入密码";
        [self addSubview:lb];
        
        UITextField * textField = [[UITextField alloc]initWithFrame:CGRectMake(10, 80, 200, 20)];
        textField.backgroundColor = [UIColor whiteColor];
        textField.secureTextEntry = YES;
        [self addSubview:textField];
        
        UIButton * button = [[UIButton alloc]initWithFrame:CGRectMake(10, 110, 200, 44)];
        [button setBackgroundColor:[UIColor blueColor]];
        button.titleLabel.textColor = [UIColor blackColor];
        [button setTitle:@"确定" forState:(UIControlStateNormal)];
        [button addTarget:self action:@selector(completeButtonPressed:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:button];
        
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        _textField = textField;
    }
    return self;
}
-(void)completeButtonPressed:(id)sender
{
    if ([_textField.text isEqualToString:@""]) {
        [_textField resignFirstResponder];
        [self resignKeyWindow];
        self.hidden = YES;
    }
    else
    {
        [self showErrorAlertView];
    }
}
-(void)showErrorAlertView
{
    UIAlertView * alertView = [[UIAlertView alloc]initWithTitle:nil message:@"密码错误" delegate:nil cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
    [alertView show];
}





















@end
