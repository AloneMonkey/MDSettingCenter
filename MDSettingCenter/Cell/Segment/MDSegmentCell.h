//
//  MDSegmentCell.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewCell.h"
#import "MDSegmentData.h"

@protocol MDSettingSegmentDelagate <NSObject>

- (void)segmentValueChanged:(UISegmentedControl *)segment;

@end

@interface MDSegmentCell : MDTableViewCell

@property (nonatomic, weak) id<MDSettingSegmentDelagate> delegate;

@end
