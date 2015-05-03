//
//  TTListViewControllerTests.m
//  TrovTest
//
//  Created by Julio Rivas on 3/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TTListViewController.h"

@interface TTListViewControllerTests : XCTestCase

@end

@implementation TTListViewControllerTests{
    TTListViewController *_vc;
}

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    _vc = [[TTListViewController alloc] init];
    [_vc viewDidLoad];
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testTableViewDataSource{
    
    XCTAssertNotNil(_vc.tableView.dataSource, @"Datasource cannot be nil");
}

- (void)testTableViewDelegate{
    
    XCTAssertNotNil(_vc.tableView.delegate, @"Delegate cannot be nil");
}

- (void)testEmptyContent{

    XCTAssertTrue(_vc.contentArray.count == 0, @"content array empty");
    
}

- (void)testEmptyContentNumberOfRows{

    XCTAssertTrue([_vc tableView:_vc.tableView numberOfRowsInSection:0]==0, @"No content then rows equals 0");
}

- (void)testContentNumberOfRows{
    
    _vc.contentArray = @[@"A",@"B"];

    XCTAssertTrue([_vc tableView:_vc.tableView numberOfRowsInSection:0]==_vc
                  .contentArray.count, @"No content then rows equals 0");
}

@end
