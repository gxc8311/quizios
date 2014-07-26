//
//  NSObject+LXGLabel.m
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import "UIView+Label.h"

@implementation UIView (Label)

- (UILabel *)showLabelWithFrame:(CGRect)_frame
                       fontsize:(float)_size
                           text:(NSString *)_text
{
    
    UILabel *label = [[UILabel alloc] initWithFrame:_frame];
    label.backgroundColor = [UIColor clearColor];
    label.font = [UIFont boldSystemFontOfSize:_size];
    label.text = _text;
    label.textAlignment = NSTextAlignmentCenter;
    [self addSubview:label];
    
    return label;
}

@end
