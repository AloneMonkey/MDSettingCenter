//
//  MDTextFieldData.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDTextFieldData.h"

@implementation MDTextFieldData

- (instancetype)init
{
    self = [super init];
    if (self) {
        _enable = YES;
        _maxLength = 10;
    }
    return self;
}

@end
