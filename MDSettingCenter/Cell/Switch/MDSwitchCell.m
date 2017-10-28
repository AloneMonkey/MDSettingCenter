//
//  MDSwitchCell.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDSwitchCell.h"

@interface MDSwitchCell()

@property (nonatomic, strong) MDSwitchData *switchData;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UISwitch *settingSwitch;

@end

@implementation MDSwitchCell

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

#pragma mark - Setter & Getter.

- (void)setSettingSwitch:(UISwitch *)settingSwitch {
    if (_settingSwitch == settingSwitch) {
        return;
    }
    
    _settingSwitch = settingSwitch;
    [self.contentView addSubview:_settingSwitch];
    
    @MDWeakSelf(self);
    [settingSwitch mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView).with.offset(-kRightMargin);
        make.height.mas_equalTo(31);
        make.width.mas_equalTo(51);
    }];
}

-(void)setData:(MDSwitchData *)data{
    if (_switchData == data) {
        return;
    }
    
    _switchData = data;
    
    _titleLabel.text = _switchData.title;
    
    UISwitch* settingSwitch = [[UISwitch alloc] init];
    [settingSwitch setOn:_switchData.switchState animated:NO];
    [settingSwitch addTarget:self action:@selector(setSwitch:) forControlEvents:UIControlEventTouchUpInside];
    self.settingSwitch = settingSwitch;
}

#pragma mark - Actions.

- (void)setSwitch:(id)sender {
    if(_switchData.switchBlock){
        _switchData.switchBlock([_settingSwitch isOn]);
    }
}

@end
