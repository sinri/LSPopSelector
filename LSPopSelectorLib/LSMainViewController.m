//
//  LSMainViewController.m
//  LSPopSelectorLib
//
//  Created by 倪 李俊 on 14-7-8.
//  Copyright (c) 2014年 Sinri. All rights reserved.
//

#import "LSMainViewController.h"

@interface LSMainViewController ()

@end

@implementation LSMainViewController

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
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    LSPopSelector * ps1=[[LSPopSelector alloc]initWithFrame:CGRectMake(50, 50, 200, 50) withTitle:@"TEST SELECTION" withArray:@[@"Ichi",@"Ni",@"San"]];
    [self.view addSubview:ps1];
    
    LSPopSelector * ps2=[[LSPopSelector alloc]initWithFrame:CGRectMake(750, 650, 200, 50) withTitle:@"TEST SELECTION" withArray:@[@"Ichi",@"Ni",@"San"]];
    [self.view addSubview:ps2];
    
    LSPopSelector * ps3=[[LSPopSelector alloc]initWithFrame:CGRectMake(50, 650, 200, 50) withTitle:@"TEST SELECTION" withArray:@[@"Ichi",@"Ni",@"San"]];
    [self.view addSubview:ps3];

    LSPopSelector * ps4=[[LSPopSelector alloc]initWithFrame:CGRectMake(750, 50, 200, 50) withTitle:@"TEST SELECTION" withArray:@[@"Ichi",@"Ni",@"San"]];
    [self.view addSubview:ps4];

    LSPopSelector * ps5=[[LSPopSelector alloc]initWithFrame:CGRectMake(350, 250, 200, 50) withTitle:@"TEST SELECTION" withArray:@[@"Ichi",@"Ni",@"San"]];
    [self.view addSubview:ps5];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
