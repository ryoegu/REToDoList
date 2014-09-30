//
//  ViewController.h
//  ToDoList
//
//  Created by Ryo Eguchi on 2014/08/24.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>
{
    //UITableViewCell *tableViewCell;
    IBOutlet UITableView *table;
    NSMutableArray *contentArray;
    NSMutableArray *deadLineArray;
    NSUserDefaults *savedata;
}
@end
