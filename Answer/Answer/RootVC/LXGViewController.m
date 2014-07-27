//
//  LXGViewController.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "LXGViewController.h"
#import "UIView+Label.h"
#import "LXGLoginCustionBtn.h"
#import "LXGRegistViewController.h"
#import "LXGLoginViewController.h"
#import "LXGMatchViewController.h"

#define LOGO_Y      50
#define BGVIEW_X    15
#define TOP_FONT    20
#define BOTTOM_FONT 30
#define BTN_HEIGHT  40
#define TOP_TEXT    @"WELCOME TO"
#define BOTTOM_TEXT @"QuizUp"
#define REGIST_TAG  100
#define LOGIN_TAG   101

@interface LXGViewController ()

@end

@implementation LXGViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES];
    
    UIImage *logoImg = [UIImage imageNamed:LOGO_ICON_NAME];
    
    UIImageView  *logoView=[[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - logoImg.size.width) / 2.0,
                                                                          LOGO_Y,
                                                                          logoImg.size.width,
                                                                          logoImg.size.height)];
    
    
    [logoView setImage:logoImg];
    [self.view addSubview:logoView];
    
    UILabel *topLabel = [self.view showLabelWithFrame:CGRectMake(0,
                                            logoView.bottom + 20,
                                            kScreenWidth,
                                            TOP_FONT)
                         fontsize:TOP_FONT
                             text:TOP_TEXT];
    
    UILabel *bottomLabel = [self.view showLabelWithFrame:CGRectMake(0,
                                                                 topLabel.bottom + 5,
                                                                 kScreenWidth,
                                                                 BOTTOM_FONT)
                                             fontsize:BOTTOM_FONT
                                                 text:BOTTOM_TEXT];
    
    LXGLoginCustionBtn *signupBtn = [LXGLoginCustionBtn buttonWithType:UIButtonTypeRoundedRect];
    signupBtn.frame = CGRectMake(BGVIEW_X, bottomLabel.bottom + 40, kScreenWidth - 2 * BGVIEW_X, BTN_HEIGHT);
    [signupBtn setTitle:@"Sign Up With Email" forState:UIControlStateNormal];
    signupBtn.titleLabel.font = [UIFont boldSystemFontOfSize:TOP_FONT];
    [signupBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [signupBtn setTag:REGIST_TAG];
    [self.view addSubview:signupBtn];
    
    LXGLoginCustionBtn *loginBtn = [LXGLoginCustionBtn buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(BGVIEW_X, signupBtn.bottom + 20, kScreenWidth - 2 * BGVIEW_X, BTN_HEIGHT);
    loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:TOP_FONT];
    [loginBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTag:LOGIN_TAG];
    [loginBtn setTitle:@"Login Up" forState:UIControlStateNormal];
    
    [self.view addSubview:loginBtn];
    
//    UIView *signUpView = [UIView alloc] initWithFrame:<#(CGRect)#>
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)btnAction:(UIButton *)btn
{
    switch (btn.tag) {
        case REGIST_TAG:
        {
            LXGRegistViewController *regVC = [[LXGRegistViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
            [self.navigationController pushViewController:regVC animated:YES];
        }
            break;
        case LOGIN_TAG:
        {
            
            LXGLoginViewController *regVC = [[LXGLoginViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
            [self.navigationController pushViewController:regVC animated:YES];
        }
            break;
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
