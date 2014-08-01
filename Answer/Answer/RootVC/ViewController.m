//
//  LXGViewController.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "ViewController.h"
#import "UIView+Label.h"
#import "LoginCustionBtn.h"
#import "RegistViewController.h"
#import "LoginViewController.h"
#import "MatchViewController.h"

#define TITLE_Y     50
#define LOGO_Y      130
#define BGVIEW_X    15
#define TOP_FONT    20
#define BOTTOM_FONT 30
#define BTN_HEIGHT  55
#define TOP_TEXT    @"WELCOME TO"
#define BOTTOM_TEXT @"QuizUp"
#define REGIST_TAG  100
#define LOGIN_TAG   101
#define LOGO_WIDTH  130

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    [self.navigationController setNavigationBarHidden:YES];
    
    [self.navigationController.navigationBar setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                     [UIColor whiteColor], UITextAttributeTextColor,
                                                                     [UIColor whiteColor], UITextAttributeTextShadowColor,
                                                                     [NSValue valueWithUIOffset:UIOffsetMake(0, 0)], UITextAttributeTextShadowOffset,
                                                                     [UIFont fontWithName:@"Arial-Bold" size:17], UITextAttributeFont,
                                                                     nil]];
    
    if (IS_SYSTEM_VERSION_7_GREATER) {
        // 64px
        [self.navigationController.navigationBar setBarTintColor:[UIColor blackColor]];
    }else{
        [[UINavigationBar appearance] setTintColor:[UIColor blackColor]];
        [[UINavigationBar appearance] setBackgroundColor:[UIColor clearColor]];
    }
    
    UIImage *titleImg = [UIImage imageNamed:LOGO_TITLE_NAME];
    
    UIImageView  *titleView=[[UIImageView alloc] initWithFrame:CGRectMake((kScreenWidth - titleImg.size.width / 2.0) / 2.0,
                                                                         TITLE_Y,
                                                                         titleImg.size.width / 2.0,
                                                                         titleImg.size.height / 2.0)];
    
    
    [titleView setImage:titleImg];
    [self.view addSubview:titleView];
    
    UIView *logoBgView = [[UIView alloc] initWithFrame:CGRectMake((kScreenWidth - LOGO_WIDTH) / 2,
                                                                LOGO_Y,
                                                                LOGO_WIDTH,
                                                                LOGO_WIDTH)];
    logoBgView.backgroundColor = [UIColor whiteColor];
    logoBgView.layer.cornerRadius = logoBgView.frame.size.width / 2;
    [self.view addSubview:logoBgView];
    
    
    UIImage *logoImg = [UIImage imageNamed:LOGO_ICON_NAME];
    
    UIImageView  *logoView=[[UIImageView alloc] initWithFrame:CGRectMake((logoBgView.width - logoImg.size.width / 2.0) / 2.0,
                                                                          (logoBgView.height - logoImg.size.height / 2.0) / 2.0,
                                                                          logoImg.size.width / 2.0,
                                                                          logoImg.size.height / 2.0)];
    
    
    [logoView setImage:logoImg];
    [logoBgView addSubview:logoView];
    
    LoginCustionBtn *signupBtn = [LoginCustionBtn buttonWithType:UIButtonTypeRoundedRect];
    signupBtn.frame = CGRectMake(BGVIEW_X, logoBgView.bottom + 55, kScreenWidth - 2 * BGVIEW_X, BTN_HEIGHT);
    [signupBtn setTitle:@"注册" forState:UIControlStateNormal];
    signupBtn.titleLabel.font = [UIFont boldSystemFontOfSize:TOP_FONT];
    [signupBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [signupBtn setTag:REGIST_TAG];
    [signupBtn updateBackgroundColor:m_REGIST];
    [self.view addSubview:signupBtn];
    
    LoginCustionBtn *loginBtn = [LoginCustionBtn buttonWithType:UIButtonTypeRoundedRect];
    loginBtn.frame = CGRectMake(BGVIEW_X, signupBtn.bottom + 20, kScreenWidth - 2 * BGVIEW_X, BTN_HEIGHT);
    loginBtn.titleLabel.font = [UIFont boldSystemFontOfSize:TOP_FONT];
    [loginBtn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    [loginBtn setTag:LOGIN_TAG];
    [loginBtn updateBackgroundColor:m_LOGIN];
    [loginBtn setTitle:@"已有账号登录" forState:UIControlStateNormal];
    
    [self.view addSubview:loginBtn];
    
//    UIView *signUpView = [UIView alloc] initWithFrame:<#(CGRect)#>
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)btnAction:(UIButton *)btn
{
    switch (btn.tag) {
        case REGIST_TAG:
        {
            RegistViewController *regVC = [[RegistViewController alloc] initWithNibName:nil
                                                                                       bundle:nil];
            [self.navigationController pushViewController:regVC animated:YES];
        }
            break;
        case LOGIN_TAG:
        {
            
            LoginViewController *regVC = [[LoginViewController alloc] initWithNibName:nil
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
