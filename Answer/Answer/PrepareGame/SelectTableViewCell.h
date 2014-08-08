//
//  SelectTableViewCell.h
//  Answer
//
//  Created by YuJie on 8/6/14.
//  Copyright (c) 2014 Liuxiaoguang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectTableViewCell : UITableViewCell

@property (nonatomic, copy) void (^clickDelegate)();

@property (nonatomic, copy) void (^startGameDelegate)(NSInteger tag);

@property (nonatomic, retain) IBOutlet UIView *bgView;

- (void)showDetailView:(BOOL)value;

- (void)hideDetailView;

@end
