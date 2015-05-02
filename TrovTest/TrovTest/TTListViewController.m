//
//  TTListViewController.m
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import "TTListViewController.h"
#import "TTUtils.h"
#import "TTDataProvider.h"

@interface TTListViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation TTListViewController{

    //Content
    NSArray *_contentArray;
    
    //Table
    UITableView *_tableView;
}

#pragma mark - SetUp

- (void)setUp {

    //Table
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    _tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    [_tableView setSeparatorColor:[UIColor lightGrayColor]];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
}

#pragma mark - Load data

- (void)loadNews {

    //Loading
    [TTUtils showProgressHud];
    
    //Data
    TTDataProvider *dataProvider = [[TTDataProvider alloc] init];
    [dataProvider loadNewsWithCompletionBlock:^(BOOL success, NSArray *responseArray, NSError *error) {
       
        //Hide
        [TTUtils hideProgressHud];
        
        if(success){
            
            //Content
            _contentArray = [NSArray arrayWithArray:responseArray];
        
            //Reload
            [_tableView reloadData];
            
        }else{
        
            //Error
            [TTUtils showError:error];
        }
    }];
}

#pragma mark - View life cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //SetUp
    [self setUp];
    
    //Load
    [self loadNews];
}

- (void)viewDidAppear:(BOOL)animated{

    [super viewDidAppear:animated];
    
    //Reload
    [_tableView reloadData];
}

#pragma mark - Memory warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return _contentArray.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(!cell){
    
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        cell.selectionStyle = UITableViewCellSelectionStyleDefault;
        cell.backgroundColor = [UIColor clearColor];
    }
    
    cell.textLabel.text = _contentArray[indexPath.row];
    
    return cell;
}

@end
