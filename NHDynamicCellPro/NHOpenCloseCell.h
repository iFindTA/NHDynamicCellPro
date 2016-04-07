//
//  NHOpenCloseCell.h
//  NHDynamicCellPro
//
//  Created by hu jiaju on 16/4/7.
//  Copyright © 2016年 hu jiaju. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^NHOpenCloseEvent)(BOOL open);

@interface NHOpenCloseCell : UITableViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *subLabel;

- (void)configureInfo:(NSString * _Nonnull)info withFlag:(BOOL)flag;

- (void)handleOpenCloseEvent:(NHOpenCloseEvent _Nonnull)event;

@end
