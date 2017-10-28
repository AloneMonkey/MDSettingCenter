//
//  MDSwitchCell.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewCell.h"
#import "MDSwitchData.h"

@protocol MDSettingSwitchDelagate <NSObject>

- (void)setSwitch:(BOOL)on setSender:(id)sender;

@end

@interface MDSwitchCell : MDTableViewCell

@property (nonatomic, weak) id<MDSettingSwitchDelagate> delegate;

@end
