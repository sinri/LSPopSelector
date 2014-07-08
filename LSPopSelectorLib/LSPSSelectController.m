//
//  LSPSSelectController.m
//  LSPopSelectorLib
//
//  Created by 倪 李俊 on 14-7-8.
//  Copyright (c) 2014年 Sinri. All rights reserved.
//

#import "LSPSSelectController.h"

@interface LSPSSelectController ()

@end

@implementation LSPSSelectController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    //[self.view setBackgroundColor:[UIColor greenColor]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setPickerView:(UIPickerView *)pickerView withTitle:(NSString*)title{
    if(_titleLabel){
        [_titleLabel removeFromSuperview];
        _titleLabel=nil;
    }
    if(_pickerView){
        [_pickerView removeFromSuperview];
        _pickerView=nil;
    }
    if(title!=nil){
        _titleLabel=[[UILabel alloc]initWithFrame:(CGRectMake(10, 10, self.view.frame.size.width, 30))];
        [_titleLabel setTextAlignment:(NSTextAlignmentCenter)];
        [_titleLabel setText:title];
        [_titleLabel setBackgroundColor:[UIColor grayColor]];
        [self.view addSubview:_titleLabel];
    }
    _pickerView=pickerView;
    if(title!=nil){
        CGRect frame = _pickerView.frame;
        frame.origin.y+=30;
        _pickerView.frame=frame;
    }
    [self.view addSubview:_pickerView];
    
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
 {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
