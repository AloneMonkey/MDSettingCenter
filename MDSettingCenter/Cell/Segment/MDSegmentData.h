//
//  MDSegmentData.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewData.h"

typedef void (^SegmentBlock)(UISegmentedControl* segment);

@interface MDSegmentData : MDTableViewData

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) SegmentBlock segmentBlock;

@end
