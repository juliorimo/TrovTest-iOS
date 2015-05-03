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
#import "TTConstants.h"
#import "TTNews.h"

@interface TTListViewController ()

@end

@implementation TTListViewController{
    
    //Flag
    BOOL _isReloading;
    
    //Refresh
    UIRefreshControl *_refreshControl;
}

#pragma mark - SetUp

- (void)setUp {
    
    //Title
    self.title = NSLocalizedString(@"_LIST_TITLE", @"");

    //Table
    CGRect frame = CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height);
    _tableView = [[UITableView alloc]initWithFrame:frame style:UITableViewStylePlain];
    [_tableView setBackgroundColor:[UIColor whiteColor]];
    [_tableView setSeparatorColor:[UIColor lightGrayColor]];
    [_tableView setDelegate:self];
    [_tableView setDataSource:self];
    _tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    [self.view addSubview:_tableView];
    
    //Refresh
    _refreshControl = [[UIRefreshControl alloc]init];
    [_tableView addSubview:_refreshControl];
    [_refreshControl addTarget:self action:@selector(refreshTable) forControlEvents:UIControlEventValueChanged];

}

#pragma mark - Load data

- (void)loadNews {

    //Loading
    [TTUtils showProgressHud];
    
    //Data
    TTDataProvider *dataProvider = [[TTDataProvider alloc] init];
    [dataProvider loadNews:TTBaseUrl withCompletionBlock:^(BOOL success, NSArray *responseArray, NSError *error) {
       
        //Hide
        [TTUtils hideProgressHud];
        
        //Reloading
        if(_isReloading)
        {
            _isReloading=NO;
            [_refreshControl endRefreshing];
        }
        
        //Response
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

#pragma mark - Reload

- (void)refreshTable{

    //Flag
    _isReloading=YES;
    
    //Load
    [self loadNews];
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
    
    cell.textLabel.text = [(TTNews *)_contentArray[indexPath.row] title];
    
    return cell;
}

#pragma mark - UITableView delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
