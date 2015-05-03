//
//  TTDataProvider.m
//  TrovTest
//
//  Created by Julio Rivas on 2/5/15.
//  Copyright (c) 2015 Julio Rivas. All rights reserved.
//

#import "TTDataProvider.h"
#import <AFNetworking/AFHTTPRequestOperationManager.h>
#import "TTNews.h"

static NSString * const TTResponseData = @"responseData";
static NSString * const TTResponseFeed = @"feed";
static NSString * const TTResponseEntries = @"entries";

@implementation TTDataProvider

#pragma mark - Load news

- (void)loadNews:(NSString *)url withCompletionBlock:(TTArrayBlock)completionBlock{
    
    if(url && url.length){
    
        AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
        manager.requestSerializer = [AFJSONRequestSerializer serializer];
        
        [manager GET:url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            
            DLog(@"%@",responseObject);
            
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                
                //Dictionary
                NSDictionary *dictionary = responseObject[TTResponseData];

                //Feed
                if(dictionary && dictionary[TTResponseFeed]){
                    
                    NSDictionary *feed = dictionary[TTResponseFeed];
                    
                    //Entries
                    if(feed[TTResponseEntries]){
                    
                        //News
                        NSError *error;
                        NSArray *array = [MTLJSONAdapter modelsOfClass:[TTNews class] fromJSONArray:feed[TTResponseEntries] error:&error];
                        
                        if(!error){
                            
                            //Ok
                            completionBlock(YES,array,nil);
                            
                        }else{
                            
                            //Error: parser
                            completionBlock(NO,nil,error);
                        }
                        
                    }else{
                        
                        //Error: no entries
                        completionBlock(NO,nil,[self errorWithDescription:@"Entries are missing"]);
                    }
                    
                }else{
                
                    //Error: no feed
                    completionBlock(NO,nil,[self errorWithDescription:@"Feed is missing"]);
                }
                
            }else{
                
                //Error: invalid response
                completionBlock(NO,nil,[self errorWithDescription:@"Invalid response"]);
            }
            
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            
            //Error: invalid request
            completionBlock(NO,nil,error);
            
        }];
        
    }else{
    
        //Error: url is madatory
        completionBlock(NO,nil,[self errorWithDescription:@"Url is mandatory"]);
    }    
}

#pragma mark - Error

- (NSError *)errorWithDescription:(NSString *)description{
    
    NSDictionary *userInfo = @{
                               NSLocalizedDescriptionKey: description,
                               NSLocalizedFailureReasonErrorKey: @"",
                               NSLocalizedRecoverySuggestionErrorKey: @""};
    
    
    NSError *error = [NSError errorWithDomain:@"TrovTest - Error"
                                         code:0
                                     userInfo:userInfo];
    
    return error;
}


@end
