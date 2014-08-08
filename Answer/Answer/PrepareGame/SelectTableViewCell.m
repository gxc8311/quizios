//
//  SelectTableViewCell.m
//  Answer
//
//  Created by YuJie on 8/6/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "SelectTableViewCell.h"

#define ANIMATION_DUR 0.3

typedef NS_ENUM (NSInteger, ASBtnType){
    ASSTART = 0,
    ASCHALLENGE,
    ASRANK,
    ASDISCUSSION,
};

@interface DetailView : UIView

@property (nonatomic, retain) UIView *bgView;
@property (nonatomic, copy) void (^btnClickAction)(NSInteger tag);

@end

@implementation DetailView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.clipsToBounds = YES;
        self.bgView = [[UIView alloc] initWithFrame:CGRectMake(0, -CGRectGetHeight(frame), CGRectGetWidth(frame), CGRectGetHeight(frame))];
        self.bgView.backgroundColor = ASColorA(0, 0, 0, 100);
        [self.bgView.layer setCornerRadius:10];
        [self addSubview:self.bgView];
        
        for (int i = ASSTART; i <= ASDISCUSSION; i++) {
            [self createBtnWithType:i];
        }
        
        return self;
    }
    return NULL;
}

- (void)createBtnWithType:(ASBtnType)_type
{
    NSString *title = @"";
    NSString *iconName = @"";
    
    CGRect frame = CGRectZero;
    
    float btnWidth = (self.bgView.width - 3 * 10) / 2;
    float btnHeight = 35;
    
    switch (_type) {
        case ASSTART:
            frame = CGRectMake(10, 17, btnWidth, btnHeight);
            title = @"     开始";
            iconName = START_IMAGE;
            break;
        case ASCHALLENGE:
            frame = CGRectMake(10 * 2 + btnWidth, 17, btnWidth, btnHeight);
            title = @"     挑战";
            iconName = CHALLENGE_IMAGE;
            break;
        case ASRANK:
            frame = CGRectMake(10, 17 + 10 + btnHeight, btnWidth, btnHeight);
            title = @"     排行";
            iconName = RANK_IMAGE;
            break;
        case ASDISCUSSION:
            frame = CGRectMake(10 * 2 + btnWidth, 17 + 10 + btnHeight, btnWidth, btnHeight);
            title = @"     讨论";
            iconName = DISSCUSION_IMAGE;
            break;
        default:
            break;
    }

    UIButton *btn = [UIButton buttonWithType:UIButtonTypeSystem];
    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction:) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = frame;
    btn.tag = _type;
    [btn.layer setCornerRadius:10];
    [self.bgView addSubview:btn];
    
    UIImage *iconImage = IMGAE_NAME(iconName);
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, (btn.height - iconImage.size.height / 2 ) / 2, iconImage.size.width / 2, iconImage.size.height / 2)];
    imageView.image = iconImage;
    [btn addSubview:imageView];
}

- (void)btnAction:(UIButton *)btn
{
    if (self.btnClickAction) {
        self.btnClickAction(btn.tag);
    }
}

@end

@interface SelectTableViewCell ()

@property (nonatomic, assign) BOOL status;
@property (nonatomic, retain) DetailView *detailView;
@property (nonatomic, retain) IBOutlet UILabel *titleLabel;
@property (nonatomic, retain) IBOutlet UIImageView *iconImageView;
@property (nonatomic, retain) IBOutlet UIButton *arrowButton;

- (IBAction)arrowClick:(id)sender;

@end

@implementation SelectTableViewCell

- (void)dealloc
{
    
}

- (void)showDetailView:(BOOL)value
{
    __weak typeof(self) mySelf = self;
    __weak DetailView *dView = NULL;
    if (!self.detailView) {
        dView = self.detailView = [[DetailView alloc] initWithFrame:CGRectMake(self.bgView.left + 10, 55, self.bgView.width - 10 * 2, 105)];
        self.detailView.btnClickAction = ^(NSInteger tag){
            if (mySelf.startGameDelegate) {
                mySelf.startGameDelegate(tag);
            }
        };
        [self.contentView insertSubview:dView belowSubview:self.bgView];
    }
    else
        dView = self.detailView;

    if (value) {
        self.status = true;
        __weak typeof(self) myself = self;
        
        [UIView animateWithDuration:ANIMATION_DUR
                         animations:^{
                             dView.bgView.top = 0;
                         }completion:^(BOOL value){
                             myself.status = false;
                         }];
    }
    else
    {
        [self.arrowButton setImage:IMGAE_NAME(ARROW_TOP) forState:UIControlStateNormal];
        dView.bgView.top = 0;
    }
}

- (void)hideDetailView
{
    if (self.detailView) {
        self.status = true;
        __weak typeof(self) myself = self;
        __weak DetailView *dView = self.detailView;
        [UIView animateWithDuration:ANIMATION_DUR
                         animations:^{
                             dView.bgView.top = 0 - dView.bgView.height;
                         }completion:^(BOOL value){
                             [myself.detailView removeFromSuperview];
                             myself.detailView = NULL;
                             myself.status = false;
                         }];
    }
}

- (void)processDelegate
{
    if (self.clickDelegate) {
        self.clickDelegate();
    }
}

- (void)processDetailView
{
    if (self.detailView && !self.status) {
        [self.arrowButton setImage:IMGAE_NAME(ARROW_BOTTOM) forState:UIControlStateNormal];
        [self hideDetailView];
        [self processDelegate];
    }
    else if (!self.detailView && !self.status) {
        [self showDetailView:true];
        [self.arrowButton setImage:IMGAE_NAME(ARROW_TOP) forState:UIControlStateNormal];
        [self processDelegate];
    }
}

- (IBAction)arrowClick:(id)sender
{
    [self processDetailView];
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
