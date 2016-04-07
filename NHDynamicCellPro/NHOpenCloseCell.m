//
//  NHOpenCloseCell.m
//  NHDynamicCellPro
//
//  Created by hu jiaju on 16/4/7.
//  Copyright © 2016年 hu jiaju. All rights reserved.
//

#import "NHOpenCloseCell.h"

@interface NHOpenCloseCell ()

@property (nonatomic, strong) UIButton *openBtn;
@property (nonatomic, copy) NSString *originInfo;

@property (nonatomic, copy) NHOpenCloseEvent event;

@end

@implementation NHOpenCloseCell

- (void)awakeFromNib {
    [super awakeFromNib];
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
    
    weakify(self)
    [_label makeConstraints:^(MASConstraintMaker *make) {
        strongify(self)
        make.top.equalTo(self.contentView).offset(15);
        make.left.equalTo(self.contentView).offset(100);
        make.right.equalTo(self.contentView).offset(-50);
        make.bottom.mas_equalTo(self.subLabel.mas_top).offset(-20);
        //make.height.mas_greaterThanOrEqualTo(@20).priorityHigh(1000);
    }];
    
    [_openBtn mas_makeConstraints:^(MASConstraintMaker *make) {
       strongify(self)
        //make.top.mas_equalTo(self.label.mas_bottom).offset(20);
        make.left.equalTo(self.contentView).offset(20);
        make.width.equalTo(@70);
        make.height.equalTo(@50);
        make.bottom.mas_equalTo(self.label.bottom).offset(-10);
    }];
    
    [_subLabel makeConstraints:^(MASConstraintMaker *make) {
        strongify(self)
        make.top.mas_equalTo(self.label.mas_bottom).offset(20);
        make.left.equalTo(self.contentView).offset(50);
        make.right.equalTo(self.contentView).offset(-100);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-10).priorityLow(998);
    }];
    
}

- (void)_initSetup {
    [self.contentView addSubview:self.label];
    [self.contentView addSubview:self.subLabel];
    [self.contentView addSubview:self.openBtn];
    //    self.contentView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.label.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 150;
    self.subLabel.preferredMaxLayoutWidth = [UIScreen mainScreen].bounds.size.width - 150;
}

- (UIButton *)openBtn {
    if (!_openBtn) {
        _openBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        [_openBtn setTitle:@"open" forState:UIControlStateNormal];
        [_openBtn setTitle:@"close" forState:UIControlStateSelected];
        [_openBtn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
        [_openBtn addTarget:self action:@selector(openCloseEvent:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _openBtn;
}

- (UILabel *)label {
    if (_label == nil) {
        UIFont *font = [UIFont systemFontOfSize:15];
        _label = [[UILabel alloc] init];
        _label.font = font;
        _label.numberOfLines = 0;
    }
    return _label;
}

- (UILabel *)subLabel {
    if (_subLabel == nil) {
        UIFont *font = [UIFont systemFontOfSize:15];
        _subLabel = [[UILabel alloc] init];
        _subLabel.font = font;
        _subLabel.numberOfLines = 0;
    }
    return _subLabel;
}

- (void)configureInfo:(NSString *)info withFlag:(BOOL)flag{
    
    self.originInfo = [info copy];
    int max = 40;BOOL shouldClose = info.length > max;
    self.openBtn.hidden = !shouldClose;
    self.openBtn.selected = flag;
    self.label.text = info;
    NSString *subinfo = [info copy];
    if (!flag) {
        subinfo = [info substringToIndex:max-1];
    }
    self.subLabel.text = subinfo;
}

- (void)openCloseEvent:(UIButton *)btn {
    
    btn.selected = !btn.selected;
    //[self configureWithFlag:btn.selected];
    if (_event) {
        _event(btn.selected);
    }
}

- (void)handleOpenCloseEvent:(NHOpenCloseEvent)event {
    _event = [event copy];
}

@end
