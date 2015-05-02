//
//  TTUtils.h
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TTUtils : NSObject

#pragma mark - Hub

+ (void)showProgressHud;
+ (void)hideProgressHud;

#pragma mark - Alerts

+ (void)showError:(NSError *)error;

@end
