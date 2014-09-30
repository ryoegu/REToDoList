//
//  InputViewController.h
//  ToDoList
//
//  Created by Ryo Eguchi on 2014/09/19.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InputViewController : UIViewController<UITextFieldDelegate>
{
    IBOutlet UITextField *titleTextField;
    
    IBOutlet UITextField *deadLineTextField;
    IBOutlet UIDatePicker *deadLineSelectedDatePicker;
    
    }
- (IBAction)deadLineDatePickerChanged:(UIDatePicker *)sender;
- (IBAction)saveButton:(id)sender;
@end
