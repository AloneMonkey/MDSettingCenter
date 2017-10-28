//
//  MDTableViewGroup.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/28.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDTableViewGroup.h"

@implementation MDTableViewGroup

-(MDTableViewGroup *)initWithTitle:(NSString *)title footer:(NSString *)footer cells:(NSArray *)cells{
    self = [super init];
    if(self){
        _title = title;
        _footer = footer;
        _cells = cells;
    }
    return self;
}

@end
