//
//  TTDataProvider.m
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import "TTDataProvider.h"

@implementation TTDataProvider

#pragma mark - Load news

- (void)loadNewsWithCompletionBlock:(TTArrayBlock)completionBlock{

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        
        //Block
        completionBlock(YES,@[@"A",@"B",@"C",@"D",@"E"],nil);
        
    });    
}

@end
