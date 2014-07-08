//
//  LSPopSelector.h
//  LSPopSelectorLib
//
//  Created by 倪 李俊 on 14-7-8.
//  Copyright (c) 2014年 Sinri. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSPSSelectController.h"

@interface LSPopSelector : UIView<UIPopoverControllerDelegate,UIPickerViewDelegate,UIPickerViewDataSource>{

}
@property CGFloat frame_width;
@property CGFloat frame_height;

@property UIButton * whole_button;
@property NSArray * selections;

@property LSPSSelectController * vc;
@property UIPopoverController * pc;

@property NSString * title;

- (id)initWithFrame:(CGRect)frame withTitle:(NSString*)title withArray:(NSArray*)array;
@end
