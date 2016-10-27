//
//  ViewController.m
//  UIWindowTest
//
//  Created by 刘璇 on 2016/10/5.
//  Copyright © 2016年 刘璇. All rights reserved.
//

#import "ViewController.h"
#import "PasswordInputWindow.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor greenColor];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    PasswordInputWindow * window = [PasswordInputWindow sharedInstance];
    [window show];
    
    
    
}

@end
