//
//  TTNews.m
//  TrovTest
//
//  Created by Julio Rivas on 3/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import "TTNews.h"

@implementation TTNews

+ (NSDictionary *)JSONKeyPathsByPropertyKey
{
    //Property : key in json
    return @{
             @"title" : @"title",
             @"link" : @"link",
             @"author" : @"author",
             @"publishedDate" : @"publishedDate",
             @"content" : @"content"
             };
}

@end
