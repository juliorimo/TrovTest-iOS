//
//  TTUtils.m
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import "TTUtils.h"
#import "SVProgressHUD.h"

@implementation TTUtils

#pragma mark - Hud

+ (void)showProgressHud{
    
    //Loading
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeGradient];
    
}

+ (void)hideProgressHud{
    
    [SVProgressHUD dismiss];
}

#pragma mark - Alerts

+ (void)showError:(NSError *)error{
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:NSLocalizedString(@"_ALERT_TITLE", nil) message:error.localizedDescription delegate:nil cancelButtonTitle:NSLocalizedString(@"_BUTTON_OK", nil) otherButtonTitles: nil];
    [alert show];
}

@end
