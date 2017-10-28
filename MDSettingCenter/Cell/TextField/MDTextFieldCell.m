//
//  MDTextFieldCell.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDTextFieldCell.h"
#import "UIView+Frame.h"

@interface MDTextFieldCell()<UITextFieldDelegate>

@property (nonatomic, strong) MDTextFieldData *textFieldData;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UITextField *textField;

@end

@implementation MDTextFieldCell

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

-(void)setTextField:(UITextField *)textField{
    if (_textField == textField) {
        return;
    }
    
    _textField = textField;
    [self.contentView addSubview:textField];
    
    @MDWeakSelf(self);
    [textField mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView).with.offset(-kRightMargin);
        make.width.mas_equalTo(weakSelf.width / 2);
    }];
}

-(void)setData:(MDTextFieldData *)data{
    if (_textFieldData == data) {
        return;
    }
    
    _textFieldData = data;
    
    _titleLabel.text = _textFieldData.title;
    
    UITextField * textField = [[UITextField alloc] init];
    textField.text = data.value;
    textField.secureTextEntry = data.secureTextEntry;
    textField.enabled = data.enable;
    textField.placeholder = data.placeholder;
    textField.textAlignment = NSTextAlignmentRight;
    textField.delegate = self;
    self.textField = textField;
}

#pragma mark - Actions.

- (void)textFieldDidEndEditing:(UITextField *)textField {
    if(_textFieldData.textFieldBlock){
        _textFieldData.textFieldBlock(textField);
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
    return textField.text.length + (string.length - range.length) <= _textFieldData.maxLength;
}

@end
