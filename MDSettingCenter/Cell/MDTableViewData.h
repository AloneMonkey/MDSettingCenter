//
//  MDTableViewData.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MDTableViewData;

typedef void (^CustomCellBlock)(UITableViewCell *cell);
typedef void (^SelectCellBlock)(void);

@interface MDTableViewData : NSObject

@property (nonatomic, copy) Class cellClass;

@property (nonatomic, copy) CustomCellBlock customCellBlock;
@property (nonatomic, copy) SelectCellBlock selectCellBlock;

@end
