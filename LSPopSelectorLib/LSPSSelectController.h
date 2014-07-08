//
//  LSPSSelectController.h
//  LSPopSelectorLib
//
//  Created by 倪 李俊 on 14-7-8.
//  Copyright (c) 2014年 Sinri. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LSPSSelectController : UIViewController
//<UIPickerViewDelegate,UIPickerViewDataSource>
@property UIPickerView * pickerView;

@property UILabel * titleLabel;
-(void)setPickerView:(UIPickerView *)pickerView withTitle:(NSString*)title;
@end
