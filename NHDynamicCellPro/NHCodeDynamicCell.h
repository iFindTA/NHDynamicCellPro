//
//  NHCodeDynamicCell.h
//  NHDynamicCellPro
//
//  Created by hu jiaju on 15/11/18.
//  Copyright © 2015年 hu jiaju. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NHCodeDynamicCell : UITableViewCell

@property (strong, nonatomic) UILabel *label;
@property (strong, nonatomic) UILabel *subLabel;

// Cache height
@property (assign, nonatomic) CGFloat cellHeight;
@property (assign, nonatomic) bool didUpdateConstric;

@end
