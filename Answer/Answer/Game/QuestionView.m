//
//  LXGQuestionView.m
//  Answer
//
//  Created by YuJie on 7/22/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "QuestionView.h"

@interface QuestionView ()

@property (nonatomic, retain) IBOutlet UILabel *questionLabel;

@property (nonatomic, retain) IBOutlet UIButton *oneBtn;
@property (nonatomic, retain) IBOutlet UIButton *twoBtn;
@property (nonatomic, retain) IBOutlet UIButton *threeBtn;
@property (nonatomic, retain) IBOutlet UIButton *fourBtn;

- (IBAction)selectAnswer:(UIButton *)sender;

@end

@implementation QuestionView

- (void)layoutView
{
    [self ModifyView:self.oneBtn];
    [self ModifyView:self.twoBtn];
    [self ModifyView:self.threeBtn];
    [self ModifyView:self.fourBtn];
}

- (void)initData:(NSDictionary *)dic
{
    [self.questionLabel setText:[dic objectForKey:@"answer"]];
    
    [self.oneBtn setTitle:[[dic objectForKey:@"response"] objectAtIndex:0] forState:UIControlStateNormal];
    [self.twoBtn setTitle:[[dic objectForKey:@"response"] objectAtIndex:1] forState:UIControlStateNormal];
    [self.threeBtn setTitle:[[dic objectForKey:@"response"] objectAtIndex:2] forState:UIControlStateNormal];
    [self.fourBtn setTitle:[[dic objectForKey:@"response"] objectAtIndex:3] forState:UIControlStateNormal];
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
    view.layer.cornerRadius = 5;
    
    [[view layer] setShadowOffset:CGSizeMake(1, 1)];
    [[view layer] setShadowRadius:5];
    [[view layer] setShadowOpacity:1];
    [[view layer] setShadowColor:[UIColor blackColor].CGColor];
}

- (IBAction)selectAnswer:(UIButton *)sender
{
    self.userInteractionEnabled = false;
    if (self.clickDelegate) {
        self.clickDelegate(sender.tag);
    }
}

- (void)changeBtnColor:(BOOL)value andTag:(NSInteger)tag
{
    UIButton *btn = (UIButton *)[self viewWithTag:tag];
    if (value)
        [btn setTitleColor:[UIColor greenColor] forState:UIControlStateNormal];
    else
        [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}

- (void)recoverView
{
    [self.oneBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.twoBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.threeBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.fourBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
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
