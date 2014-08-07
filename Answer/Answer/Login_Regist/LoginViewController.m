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

@property (nonatomic, retain) IBOutlet UILabel *tipLabel;

@property (nonatomic, retain) IBOutlet UILabel *twoFlag;
@property (nonatomic, retain) IBOutlet UILabel *threeFlag;

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
        self.title = @"Login";
        // Custom initialization
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.navigationController setNavigationBarHidden:NO animated:YES];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self
                                                                               action:@selector(doneClick)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    // Do any additional setup after loading the view from its nib.
}

- (void)doneClick
{
    if ([self checkContexts]) {
        [UIWindow setRootViewController];
    }
}

- (BOOL)checkContexts
{
    BOOL flag = false;
    
    if ([self.emailTF.text length] == 0){
        flag = true;
        self.twoFlag.textColor = [UIColor redColor];
    }else
        self.twoFlag.textColor = [UIColor greenColor];
    
    if ([self.passwordTF.text length] == 0){
        flag = true;
        self.threeFlag.textColor = [UIColor redColor];
    }else
        self.threeFlag.textColor = [UIColor greenColor];
    
    if (flag) {
        [self.tipLabel setText:@"Input content cannot be empty"];
        return false;
    }
    
    return true;
}

- (IBAction)forgotPassword:(id)sender
{
    [self.tipLabel setText:@"Function is not implemented！"];
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
