//
//  LXGRegistViewController.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "RegistViewController.h"
#import "MatchViewController.h"

@interface RegistViewController ()

@property (nonatomic, retain) IBOutlet UIView *BgView;
@property (nonatomic, retain) IBOutlet UITextField *nameTF;
@property (nonatomic, retain) IBOutlet UITextField *emailTF;
@property (nonatomic, retain) IBOutlet UITextField *passwordTF;

- (IBAction)clearKeyboard:(id)sender;
- (IBAction)chooseHeadAction:(id)sender;

@end

@implementation RegistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"注册";
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
    
    self.view.backgroundColor = VC_BG_COLOR;
    
    self.BgView.layer.cornerRadius = 5;
    
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone
                                                                               target:self
                                                                               action:@selector(doneClick)];
    
    self.navigationItem.rightBarButtonItem = rightItem;
    
    [self.nameTF becomeFirstResponder];
    
    // Do any additional setup after loading the view from its nib.
}

- (void)doneClick
{
    if ([self checkContexts]) {
        MatchViewController *regVC = [[MatchViewController alloc] initWithNibName:nil
                                                                                 bundle:nil];
        [self.navigationController pushViewController:regVC animated:YES];
    }
}

- (BOOL)checkContexts
{
    return true;
}

- (IBAction)clearKeyboard:(id)sender
{
    [self.nameTF resignFirstResponder];
    [self.emailTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

- (IBAction)chooseHeadAction:(id)sender
{
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
