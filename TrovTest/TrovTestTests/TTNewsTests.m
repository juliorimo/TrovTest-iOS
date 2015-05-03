//
//  TTNewsTests.m
//  TrovTest
//
//  Created by Julio Rivas on 3/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "TTNews.h"

@interface TTNewsTests : XCTestCase

@end

@implementation TTNewsTests{

    TTNews *_news;
}

- (void)setUp {
    [super setUp];

    _news = [[TTNews alloc] init];
    _news.title = @"title";
    _news.link = @"www.link.com";
    _news.author = @"author";
    _news.content = @"content";
    _news.publishedDate = @"Sun, 03 May 2015 08:39:55 -0700";
}

- (void)tearDown {

    _news = nil;
    
    [super tearDown];
}

- (void)testTitleValid{

    XCTAssertEqual(_news.title, @"title");
}

- (void)testTitleInvalid{

    XCTAssertNotEqual(_news.title, @"invalid title");
}

- (void)testLinkValid{

    XCTAssertEqual(_news.link, @"www.link.com");
}

- (void)testLinkInvalid{
    
    XCTAssertNotEqual(_news.link, @"invalid link");
}

- (void)testAuthorValid{
    
    XCTAssertEqual(_news.author, @"author");
}

- (void)testAuthorInvalid{
    
    XCTAssertNotEqual(_news.author, @"invalid author");
}

- (void)testContentValid{
    
    XCTAssertEqual(_news.content, @"content");
}

- (void)testContentInvalid{
    
    XCTAssertNotEqual(_news.content, @"invalid content");
}

- (void)testDateValid{
    
    XCTAssertEqual(_news.publishedDate, @"Sun, 03 May 2015 08:39:55 -0700");
}

- (void)testDateInvalid{
    
    XCTAssertNotEqual(_news.publishedDate, @"invalid date");
}

- (void)testParseNewsOk{
    
    NSDictionary *jsonNews = @{@"title" : @"Man, 101, pulled from Nepal quake rubble",
                               @"link" : @"http://edition.cnn.com/2015/05/03/asia/nepal-earthquake/index.html",
                               @"author" : @"",
                               @"publishedDate": @"Sun, 03 May 2015 08:39:55 -0700",
                               @"content": @"Police rescue a 101-year-old man from the wreckage of his home, one week after a deadly earthquake hit Nepal, killing more than 7,000 people."};
    
    
    NSError *error;
    TTNews *news = [MTLJSONAdapter modelOfClass:[TTNews class] fromJSONDictionary:jsonNews error:&error];

    XCTAssertNotNil(news,@"news parsed");
}

- (void)testParseNewsWithoutData{
    
    NSDictionary *jsonNews = @{};
                                   
    NSError *error;
    TTNews *news = [MTLJSONAdapter modelOfClass:[TTNews class] fromJSONDictionary:jsonNews error:&error];
    
    XCTAssertNotNil(news,@"news parsed");
}




@end
