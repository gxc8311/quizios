//
//  SetViewController.m
//  Answer
//
//  Created by YuJie on 8/7/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "SetViewController.h"
#import "UIWindow+Set.h"

@interface SetViewController ()

- (IBAction)SignOut:(id)sender;

@end

@implementation SetViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (IBAction)SignOut:(id)sender
{
    [UIWindow SignOut];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
