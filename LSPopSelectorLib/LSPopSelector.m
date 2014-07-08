//
//  LSPopSelector.m
//  LSPopSelectorLib
//
//  Created by 倪 李俊 on 14-7-8.
//  Copyright (c) 2014年 Sinri. All rights reserved.
//

#import "LSPopSelector.h"

@implementation LSPopSelector

- (id)initWithFrame:(CGRect)frame withTitle:(NSString*)title withArray:(NSArray*)array
{
    self = [super initWithFrame:frame]; //self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        _frame_height=200;
        _frame_width=300;
        
        _title=title;
        
        _selections=array;
        [self setBackgroundColor:[UIColor whiteColor]];
        _whole_button=[UIButton buttonWithType:(UIButtonTypeRoundedRect)];
        [_whole_button setFrame:CGRectMake(0, 0, frame.size.width, frame.size.height)];
        [_whole_button setTitle:title forState:(UIControlStateNormal)];
        [_whole_button addTarget:self action:@selector(popSelected:) forControlEvents:(UIControlEventTouchUpInside)];
        [self addSubview:_whole_button];
    }
    return self;
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */
#pragma 本体

-(CGRect)popViewFrame{
    return CGRectMake(10,10, _frame_width-20, _frame_height-20);
}
-(CGSize)popViewSize{
    return CGSizeMake(_frame_width, _frame_height);
}
-(CGRect)popViewPickerCellFrame{
    return CGRectMake(0, 0, _frame_width-20, (_frame_height-20)/3);
}
-(void)popSelected:(id)sender{
    NSLog(@"LSPopSelector popSelected called");
    [self killPopoversOnSight];
    _vc=[[LSPSSelectController alloc]init];
    [_vc.view setFrame:[self popViewFrame]];
    
    UIPickerView * pickerView = [[UIPickerView alloc]initWithFrame:[self popViewFrame]];
    [pickerView setAutoresizesSubviews:YES];
    //[pickerView setBackgroundColor:[UIColor yellowColor]];
    [pickerView setDataSource:self];
    [pickerView setDelegate:self];
    //[pickerView reloadAllComponents];
    [pickerView setTintColor:[UIColor blackColor]];
    [_vc setPickerView:pickerView withTitle:_title];
    
    _pc=[[UIPopoverController alloc]initWithContentViewController:_vc];
    [_pc setDelegate:self];
    [_pc setPopoverContentSize:[self popViewSize]];
    
    //_vc.contentSizeForViewInPopover=_vc.view.bounds.size;
    //_vc.preferredContentSize=_vc.view.bounds.size;
    //_vc.popoverController = _pc;
    
    [_pc presentPopoverFromRect:_whole_button.frame inView:self permittedArrowDirections:UIPopoverArrowDirectionLeft | UIPopoverArrowDirectionRight animated:YES];//UIPopoverArrowDirectionAny
}
#pragma popover
- (void)popoverControllerDidDismissPopover:(UIPopoverController*)popoverController{
    if (_pc) {
        [_pc dismissPopoverAnimated:YES];
        _pc=nil;
        if (_vc != nil) {
            _vc = nil;
        }
    }
}
//closing popover
-(void)killPopoversOnSight {
    if (_pc) {
        [_pc dismissPopoverAnimated:NO];
    }
    if(_vc){
        [_vc dismissViewControllerAnimated:YES completion:^{
            _vc=nil;
            NSLog(@"killPopoversOnSight killed VC");
        }];
    }
}
#pragma picker

-(NSInteger) numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger) pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    NSLog(@"pickerView numberOfRowsInComponent:[%d] as %d",component,[_selections count]);
    return [_selections count];
}
/*
-(NSString*) pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    NSLog(@"pickerView titleForRow:%d,forComponent:%d as [%@]",row,component,[_selections objectAtIndex:row]);
    return [_selections objectAtIndex:row];
}
*/
-(UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 30)]; // your frame, so picker gets "colored"
    //label.backgroundColor = [UIColor lightGrayColor];
    [label setTextAlignment:(NSTextAlignmentCenter)];
    label.textColor = [UIColor blackColor];
    label.font = [UIFont fontWithName:@"HelveticaNeue-Bold" size:18];
    label.text = [_selections objectAtIndex:row];
    
    return label;
}

- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component{
    return 0;
}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component{
    return 50;
}


-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"pickerView didSelectRow:%d inComponent:%d",row,component);
    [_whole_button setTitle:[_selections objectAtIndex:row] forState:(UIControlStateNormal)];
    //[self killPopoversOnSight];
}
@end
