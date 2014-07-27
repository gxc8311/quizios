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

@property (nonatomic, retain) IBOutlet UILabel *tipLabel;

@property (nonatomic, retain) IBOutlet UILabel *oneFlag;
@property (nonatomic, retain) IBOutlet UILabel *twoFlag;
@property (nonatomic, retain) IBOutlet UILabel *threeFlag;

@property (nonatomic, retain) IBOutlet UITextField *nameTF;
@property (nonatomic, retain) IBOutlet UITextField *emailTF;
@property (nonatomic, retain) IBOutlet UITextField *passwordTF;

- (IBAction)clearKeyboard:(id)sender;

@end

@implementation RegistViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Regist";
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
        MatchViewController *regVC = [[MatchViewController alloc] initWithNibName:nil
                                                                                 bundle:nil];
        [self.navigationController pushViewController:regVC animated:YES];
    }
}

- (BOOL)checkContexts
{
    BOOL flag = false;
    
    if ([self.nameTF.text length] == 0){
        flag = true;
        self.oneFlag.textColor = [UIColor redColor];
    }else
        self.oneFlag.textColor = [UIColor greenColor];
    
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

- (IBAction)clearKeyboard:(id)sender
{
    [self.nameTF resignFirstResponder];
    [self.emailTF resignFirstResponder];
    [self.passwordTF resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
