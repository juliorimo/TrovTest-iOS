//
//  TTDataProvider.h
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^TTArrayBlock)(BOOL success, NSArray *responseArray, NSError *error);

@interface TTDataProvider : NSObject

- (void)loadNewsWithCompletionBlock:(TTArrayBlock)completionBlock;

@end
