//
//  TTNews.h
//  TrovTest
//
//  Created by Julio Rivas on 3/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Mantle/Mantle.h>
#import "MTLModel.h"

@interface TTNews : MTLModel <MTLJSONSerializing>

@property (nonatomic,strong) NSString *title;
@property (nonatomic,strong) NSString *link;
@property (nonatomic,strong) NSString *author;
@property (nonatomic,strong) NSString *publishedDate;
@property (nonatomic,strong) NSString *content;

@end
