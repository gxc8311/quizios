//
//  NSObject+LXGLabel.h
//  Answer
//
//  Created by YuJie on 7/21/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIView (Label)

- (UILabel *)showLabelWithFrame:(CGRect)_frame
                       fontsize:(float)_size
                           text:(NSString *)_text;

@end
