//
//  MDSwitchData.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewData.h"

typedef void (^SwitchBlock)(BOOL on);

@interface MDSwitchData : MDTableViewData

@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) BOOL switchState;
@property (nonatomic, copy) SwitchBlock switchBlock;

@end
