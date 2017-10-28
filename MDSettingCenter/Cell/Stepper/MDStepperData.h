//
//  MDStepperData.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewData.h"

typedef void (^StepperBlock)(double value);

@interface MDStepperData : MDTableViewData

@property (nonatomic, copy) NSString *title;

@property (nonatomic, strong) NSNumber *min;

@property (nonatomic, strong) NSNumber *max;

@property (nonatomic, strong) NSNumber *step;

@property (nonatomic, assign) BOOL interger;

@property (nonatomic, copy) StepperBlock stepperBlock;

@end
