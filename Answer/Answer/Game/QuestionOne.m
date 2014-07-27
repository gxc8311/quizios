//
//  LXGQuestionOne.m
//  Answer
//
//  Created by YuJie on 7/22/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "QuestionOne.h"

@interface QuestionOne ()

@property (nonatomic, retain) IBOutlet UILabel *questionLabel;

@property (nonatomic, retain) IBOutlet UIButton *oneBtn;
@property (nonatomic, retain) IBOutlet UIButton *twoBtn;
@property (nonatomic, retain) IBOutlet UIButton *threeBtn;
@property (nonatomic, retain) IBOutlet UIButton *fourBtn;

- (IBAction)selectAnswer:(UIButton *)sender;

@end

@implementation QuestionOne

- (void)layoutView
{
    [self ModifyView:self.oneBtn];
    [self ModifyView:self.twoBtn];
    [self ModifyView:self.threeBtn];
    [self ModifyView:self.fourBtn];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (void)ModifyView:(UIView *)view
{
    view.layer.cornerRadius = 4;
    
    [[view layer] setShadowOffset:CGSizeMake(1, 1)];
    [[view layer] setShadowRadius:5];
    [[view layer] setShadowOpacity:1];
    [[view layer] setShadowColor:[UIColor blackColor].CGColor];
}

- (IBAction)selectAnswer:(UIButton *)sender
{
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
