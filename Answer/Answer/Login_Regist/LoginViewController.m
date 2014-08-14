//
//  LXGLoginViewController.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "LoginViewController.h"
#import "MatchViewController.h"
#import "UIWindow+Set.h"

@interface LoginViewController ()

@property (nonatomic, retain) IBOutlet UIView *bgView;
@property (nonatomic, retain) IBOutlet UITextField *emailTF;
@property (nonatomic, retain) IBOutlet UITextField *passwordTF;

- (IBAction)forgotPassword:(id)sender;
- (IBAction)clearKeyboard:(id)sender;

@end

@implementation LoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"登录";
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
    
    [self.emailTF becomeFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.bgView.layer setCornerRadius:5.0f];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self
                                                                               action:@selector(doneClick)];
    rightItem.tintColor = [UIColor whiteColor];
    self.navigationItem.rightBarButtonItem = rightItem;
    
    
    self.navigationItem.leftBarButtonItem.tintColor = [UIColor whiteColor];
    // Do any additional setup after loading the view from its nib.
}

- (void)doneClick
{
    [UIWindow setRootViewController];
}

- (IBAction)forgotPassword:(id)sender
{

}

- (IBAction)clearKeyboard:(id)sender
{
    [self.emailTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
