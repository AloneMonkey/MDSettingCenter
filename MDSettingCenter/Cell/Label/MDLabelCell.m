//
//  MDLabelCell.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/11/2.
//  Copyright © 2017年 Coder. All rights reserved.
//

#import "MDLabelCell.h"

@interface MDLabelCell()

@property (nonatomic, strong) MDLabelData *labelData;

@property (nonatomic, strong) UILabel *titleLabel;

@end

@implementation MDLabelCell

#pragma mark - setup views.

- (void)setupSubviews {
    [super setupSubviews];
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.textColor = MDColorCellTitle;
    _titleLabel.font = MDFont15;
    [self.contentView addSubview:_titleLabel];
    
    @MDWeakSelf(self);
    [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(weakSelf.contentView).with.offset(kLeftMargin);
        make.centerY.equalTo(weakSelf.contentView);
    }];
}

- (CGSize)sizeThatFits:(CGSize)size {
    if ([_titleLabel.text isEqualToString:@""]) {
        return CGSizeMake(MDScreenWidth, 60);
    }else {
        return CGSizeMake(MDScreenWidth, 52);
    }
}

-(void)setData:(MDLabelData *)data{
    if (_labelData == data) {
        return;
    }
    
    _labelData = data;
    
    _titleLabel.text = data.title;
}

@end
