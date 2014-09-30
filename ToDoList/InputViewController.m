//
//  InputViewController.m
//  ToDoList
//
//  Created by Ryo Eguchi on 2014/09/19.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "InputViewController.h"

@interface InputViewController ()

@end

@implementation InputViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    titleTextField.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return NO;
}
- (IBAction)deadLineDatePickerChanged:(UIDatePicker *)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy年MM月dd日"];

    deadLineTextField.text = [dateFormatter stringFromDate:sender.date];}

- (IBAction)saveButton:(id)sender {
    //呼び出し
    NSUserDefaults *savedata= [NSUserDefaults standardUserDefaults];
    NSMutableArray *contentArray=[[savedata objectForKey:@"contentUD"]mutableCopy];
    NSMutableArray *deadLineArray=[[savedata objectForKey:@"deadLineUD"]mutableCopy];
    if(!contentArray){
        contentArray = [[NSMutableArray alloc]init];
    }
    if(!deadLineArray){
        deadLineArray = [[NSMutableArray alloc]init];
    }
    
    [contentArray addObject:titleTextField.text];
    [deadLineArray addObject:deadLineTextField.text];
    [savedata setObject:contentArray forKey:@"contentUD"];
    [savedata setObject:deadLineArray forKey:@"deadLineUD"];
    [savedata synchronize];
    //アラートを表示
    NSLog(@"%@",contentArray);
    [self.navigationController popViewControllerAnimated:YES];
}


@end
