//
//  LXGLoginCustionBtn.h
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import <UIKit/UIKit.h>

enum{
    m_UNKONW,
    m_REGIST,
    m_LOGIN
};

@interface LoginCustionBtn : UIButton

- (void)updateBackgroundColor:(int)type;

@end
