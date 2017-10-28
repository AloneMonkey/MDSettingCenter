//
//  MDSegmentCell.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDSegmentCell.h"

@interface MDSegmentCell()

@property (nonatomic, strong) MDSegmentData *segmentData;

@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, strong) UISegmentedControl *segment;

@end

@implementation MDSegmentCell

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

-(void)setSegment:(UISegmentedControl *)segment{
    if (_segment == segment) {
        return;
    }
    
    _segment = segment;
    [self.contentView addSubview:segment];
    
    @MDWeakSelf(self);
    [segment mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(weakSelf.contentView);
        make.right.equalTo(weakSelf.contentView).with.offset(-kRightMargin);
        make.left.equalTo(weakSelf.titleLabel.mas_right).offset(20);
    }];
}

-(void)setData:(MDSegmentData *)data{
    if (_segmentData == data) {
        return;
    }
    
    _segmentData = data;
    
    _titleLabel.text = data.title;
    
    UISegmentedControl * segment = [[UISegmentedControl alloc] initWithItems:data.items];
    [segment addTarget:self action:@selector(segmentValueChanged:) forControlEvents:UIControlEventValueChanged];
    segment.selectedSegmentIndex = 0;
    
    self.segment = segment;
}

#pragma mark - Actions.

- (void)segmentValueChanged:(UISegmentedControl *)sender {
    if(_segmentData.segmentBlock){
        _segmentData.segmentBlock(sender);
    }
}

@end
