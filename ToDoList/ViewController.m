//
//  ViewController.m
//  ToDoList
//
//  Sample for edu
//  Created by Ryo Eguchi on 2014/08/24.
//  Copyright (c) 2014年 Ryo Eguchi. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:YES];
    
    savedata = [NSUserDefaults standardUserDefaults];
    contentArray = [[savedata arrayForKey:@"contentUD"] mutableCopy];
    deadLineArray = [[savedata arrayForKey:@"deadLineUD"] mutableCopy];
    
    if(!contentArray){
        contentArray = [NSMutableArray new];
    }
    if(!deadLineArray){
        deadLineArray = [NSMutableArray new];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

# pragma mark - Table View Basic 3 Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [contentArray count];
}

//UITableViewを使うときの公式（わかりやすいノートなどにコピペしておこう！）
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    //カスタムセル上の部品をTagで関連付けする
    UILabel *contentLabel = (UILabel *)[cell viewWithTag:1];
    UILabel *deadLineLabel = (UILabel *)[cell viewWithTag:2];
    //セルの内容を配列から取り出す
    contentLabel.text = contentArray[indexPath.row];
    deadLineLabel.text = deadLineArray[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 70.0;
}

//削除処理
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        NSInteger row = [indexPath row];
        [contentArray removeObjectAtIndex:row];
        [deadLineArray removeObjectAtIndex:row];
        [table reloadData];
    }
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
    }
    
    [savedata setObject:contentArray forKey:@"contentUD"];
    [savedata setObject:deadLineArray forKey:@"deadLineUD"];
    
}


@end
