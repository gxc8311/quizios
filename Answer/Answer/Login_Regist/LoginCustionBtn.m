//
//  LXGLoginCustionBtn.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "LoginCustionBtn.h"

#define CORNER_RADIUS 10

#define REGIST_COLOR ASColor(36, 104, 249)
#define LOGIN_COLOR ASColor(44, 203, 95)

@interface LoginCustionBtn ()

@end

@implementation LoginCustionBtn

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = ASColor(44, 204, 96);
        self.layer.cornerRadius = CORNER_RADIUS;
        
        [self setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
        
        // Initialization code
    }
    return self;
}

- (void)updateBackgroundColor:(int)type
{
    switch (type) {
        case m_REGIST:
            self.backgroundColor = REGIST_COLOR;
            break;
        case m_LOGIN:
            self.backgroundColor = LOGIN_COLOR;
            break;
        default:
            break;
    }
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
