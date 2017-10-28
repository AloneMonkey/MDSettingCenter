//
//  MDTableViewCell.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDTableViewCell.h"

@implementation MDTableViewCell

#pragma mark - Lift cycle

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        [self setupSubviews];
    }
    return self;
}

-(void)setupSubviews{
    self.backgroundColor = MDColorWhite;
}

@end
