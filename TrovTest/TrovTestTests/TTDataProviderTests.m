//
//  TTDataProviderTests.m
//  TrovTest
//
//  Created by Julio Rivas on 3/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TTDataProvider.h"
#import "TTConstants.h"

@interface TTDataProviderTests : XCTestCase

@end

@implementation TTDataProviderTests{

    TTDataProvider *_dataProvider;
    
}

- (void)setUp {
    [super setUp];
    
    _dataProvider = [[TTDataProvider alloc] init];
}

- (void)tearDown {

    _dataProvider = nil;
    
    [super tearDown];
}

- (void)testNilUrl{

    [_dataProvider loadNews:nil withCompletionBlock:^(BOOL success, NSArray *responseArray, NSError *error) {
       
        XCTAssertFalse(success,@"nil url");
        
    }];
}

- (void)testEmptyUrl{

    [_dataProvider loadNews:@"" withCompletionBlock:^(BOOL success, NSArray *responseArray, NSError *error) {
        
        XCTAssertFalse(success,@"empty url");
        
    }];
}

- (void)testNewsRequest{

    [_dataProvider loadNews:TTBaseUrl withCompletionBlock:^(BOOL success, NSArray *responseArray, NSError *error) {
        
        XCTAssertTrue(success,@"load news from server");
        
    }];
}

@end
