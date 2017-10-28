//
//  MDTableViewData.m
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import "MDTableViewData.h"

@implementation MDTableViewData

- (instancetype)init
{
    self = [super init];
    if (self) {
        NSString* className = NSStringFromClass([self class]);
        NSString* cellClassName = [className stringByReplacingCharactersInRange:NSMakeRange(className.length-4, 4) withString:@"Cell"];
        self.cellClass = NSClassFromString(cellClassName);
    }
    return self;
}

@end
