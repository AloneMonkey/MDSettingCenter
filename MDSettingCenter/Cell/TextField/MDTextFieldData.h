//
//  MDTextFieldData.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewData.h"

typedef NS_ENUM(NSUInteger, MDTextFieldType) {
    MDTextFieldDefaultKeyboard                  = 1 << 0,
    MDTextFieldNumberKeyboard                   = 1 << 1,
    MDTextFieldNumberAndPunctuationKeyboard     = 1 << 2,
    MDTextFieldURLKeyboard                      = 1 << 3,
    MDTextFieldEmailKeyboard                    = 1 << 4,
    
    MDTextFieldUseKeyboard                      = 1 << 5,
    MDTextFieldUsePicker                        = 1 << 6,
};

typedef void (^TextFieldBlock)(UITextField* textField);

@interface MDTextFieldData : MDTableViewData

@property (nonatomic, assign) MDTextFieldType thisType;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSString* value;
@property (nonatomic, strong) NSString* placeholder;
@property (nonatomic, assign) BOOL secureTextEntry;
@property (nonatomic, assign) BOOL enable;
@property (nonatomic, assign) NSInteger maxLength;
@property (nonatomic, copy) TextFieldBlock textFieldBlock;

@end

