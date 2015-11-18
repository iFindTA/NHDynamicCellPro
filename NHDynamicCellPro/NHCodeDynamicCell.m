//
//  NHCodeDynamicCell.m
//  NHDynamicCellPro
//
//  Created by hu jiaju on 15/11/18.
//  Copyright © 2015年 hu jiaju. All rights reserved.
//

#import "NHCodeDynamicCell.h"

@implementation NHCodeDynamicCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self _initSetup];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _initSetup];
    }
    return self;
}

//- (void)prepareForReuse {
//    [self.contentView.subviews makeObjectsPerformSelector:@selector(removeFromSuperview)];
//    [super prepareForReuse];
//}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    __weak typeof(&* self) weakSelf = self;
    
    [self.contentView makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.top).with.offset(5);
        make.left.equalTo(self.left).with.offset(5);
        make.right.equalTo(self.right).with.offset(-5);
        make.bottom.equalTo(self.bottom).with.offset(5);
    }];
    
    [_label makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.contentView.top).with.offset(15);
        make.left.equalTo(weakSelf.contentView.left).with.offset(100);
        make.right.equalTo(weakSelf.contentView.right).with.offset(-50);
    }];
    
    [_subLabel makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(weakSelf.label.mas_bottom).with.offset(20);
        make.left.equalTo(weakSelf.contentView.left).with.offset(50);
        make.right.equalTo(weakSelf.contentView.right).with.offset(-100);
        make.bottom.equalTo(weakSelf.contentView.bottom).with.offset(-10);
    }];
}

//- (void)updateConstraints {
//    
//    if (!_didUpdateConstric) {
//        _didUpdateConstric = true;
//        __weak typeof(&* self) weakSelf = self;
//        
//        [self.contentView makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(self.top).with.offset(5);
//            make.left.equalTo(self.left).with.offset(5);
//            make.right.equalTo(self.right).with.offset(-5);
//            make.bottom.equalTo(self.bottom).with.offset(5);
//        }];
//        
//        [_label makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(weakSelf.contentView.top).with.offset(15);
//            make.left.equalTo(weakSelf.contentView.left).with.offset(100);
//            make.right.equalTo(weakSelf.contentView.right).with.offset(-50);
//        }];
//        
//        [_subLabel makeConstraints:^(MASConstraintMaker *make) {
//            make.top.equalTo(weakSelf.label.mas_bottom).with.offset(20);
//            make.left.equalTo(weakSelf.contentView.left).with.offset(50);
//            make.right.equalTo(weakSelf.contentView.right).with.offset(-100);
//            make.bottom.equalTo(weakSelf.contentView.bottom).with.offset(-10);
//        }];
//    }
//    
//    [super updateConstraints];
//}

- (void)_initSetup {
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.subLabel];
//    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
}

- (UILabel *)label {
    if (_label == nil) {
        UIFont *font = [UIFont systemFontOfSize:15];
        _label = [[UILabel alloc] init];
        _label.font = font;
        _label.numberOfLines = 0;
//        _label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 150 ;
    }
    return _label;
}

- (UILabel *)subLabel {
    if (_subLabel == nil) {
        UIFont *font = [UIFont systemFontOfSize:15];
        _subLabel = [[UILabel alloc] init];
        _subLabel.font = font;
        _subLabel.numberOfLines = 0;
//        _subLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 150 ;
    }
    return _subLabel;
}

@end
