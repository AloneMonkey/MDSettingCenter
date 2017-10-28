//
//  MDStepperCell.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDStepperCell.h"
#import "UIView+Frame.h"

@interface MDStepperCell()

@property (nonatomic, strong) MDStepperData *stepperData;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UIStepper *stepper;

@property (nonatomic, strong) UILabel *stepNumber;

@end

@implementation MDStepperCell

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
    
    _stepper = [[UIStepper alloc] init];
    _stepper.continuous = YES;
    _stepper.wraps = YES;
    [_stepper addTarget:self action:@selector(stepperValueChanged:) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:_stepper];
    
    [_stepper mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView.mas_right).with.offset(-kRightMargin);
    }];
    
    _stepNumber = [[UILabel alloc] init];
    _stepNumber.textColor = MDColorCellTitle;
    _stepNumber.font = MDFont15;
    [self.contentView addSubview:_stepNumber];
    
    [_stepNumber mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(weakSelf.stepper.mas_left).with.offset(-20);
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

-(void)setData:(MDStepperData *)data{
    if (_stepperData == data) {
        return;
    }
    
    _stepperData = data;
    
    _titleLabel.text = _stepperData.title;
    
    _stepper.minimumValue = data.min.doubleValue;
    _stepper.maximumValue = data.max.doubleValue;
    _stepper.value = data.min.doubleValue;
    _stepper.stepValue = data.step.doubleValue;
    _stepNumber.text = @(_stepper.value).stringValue;
}

#pragma mark - Actions.

- (void)stepperValueChanged:(UIStepper *)sender {
    if(_stepperData.interger){
        _stepNumber.text =  [NSString stringWithFormat:@"%d", (int)_stepper.value];
    }else{
        _stepNumber.text =  [NSString stringWithFormat:@"%.2f", _stepper.value];
    }
    
    if(_stepperData.stepperBlock){
        _stepperData.stepperBlock(sender.value);
    }
}


@end
