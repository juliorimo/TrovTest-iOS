//
//  TTListViewController.h
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TTListViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) NSArray *contentArray;
@property (nonatomic,strong) UITableView *tableView;

@end
