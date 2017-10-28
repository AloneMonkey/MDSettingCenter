//
//  MDTextFieldCell.h
//  MDSettingCenter
//
//  Created by AloneMonkey on 2017/10/27.
//  Copyright © 2017年 MonkeyDev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "MDTableViewCell.h"
#import "MDTextFieldData.h"

@protocol MDSettingTextFieldDelagate <NSObject>

- (void)textFieldDidEndEditing:(UITextField *)textField;

@end


@interface MDTextFieldCell : MDTableViewCell

@property (nonatomic, weak) id<MDSettingTextFieldDelagate> delegate;

@end
