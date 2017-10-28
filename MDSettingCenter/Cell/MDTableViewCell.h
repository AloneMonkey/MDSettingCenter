//
//  MDTableViewCell.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/26.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Masonry/Masonry.h>
#import "MDTableViewData.h"
#import "MDColor.h"
#import "MDConstants.h"

@interface MDTableViewCell : UITableViewCell

@property (nonatomic, strong) MDTableViewData* data;

-(void)setupSubviews;

@end
