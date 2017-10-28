//
//  MDTextFieldData.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewData.h"


typedef void (^TextFieldBlock)(UITextField* textField);

@interface MDTextFieldData : MDTableViewData

@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString* value;
@property (nonatomic, strong) NSString* placeholder;
@property (nonatomic, assign) BOOL secureTextEntry;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, copy) TextFieldBlock textFieldBlock;

@end
