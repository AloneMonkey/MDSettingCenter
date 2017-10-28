//
//  MDTableViewGroup.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/28.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MDTableViewGroup : NSObject

@property (nonatomic, copy) NSString* title;
@property (nonatomic, copy) NSString* footer;
@property (nonatomic, strong) NSArray* cells;

-(MDTableViewGroup*)initWithTitle:(NSString*) title footer:(NSString*) footer cells:(NSArray*) cells;

@end
