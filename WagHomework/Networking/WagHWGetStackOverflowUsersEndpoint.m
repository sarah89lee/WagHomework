//
//  WagHWGetStackOverflowUsersEndpoint.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWGetStackOverflowUsersEndpoint.h"
#import <AFNetworking/AFNetworking.h>
#import "WagHWStackOverflowAPIUser.h"
#import "WagHWStackOverflowUserProxy.h"
#import "WagHWCoreDataManager.h"

@implementation WagHWGetStackOverflowUsersEndpoint

+ (void)getStackOverflowUsers:(WagHWGetStackOverflowUsersEndpointSuccess)success
{
    NSString * URLString = @"https://api.stackexchange.com/2.2/users?site=stackoverflow";

    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    [manager GET:URLString
      parameters:nil
        progress:nil
         success:^(NSURLSessionTask *task, id responseObject) {
             if ([responseObject isKindOfClass:[NSDictionary class]]) {
                 NSDictionary * responseDictionary = (NSDictionary *)responseObject;
                 NSArray * itemsDictionaryArray = [responseDictionary objectForKey:@"items"];
                 NSMutableArray * itemsArray = [NSMutableArray new];
                 for (NSDictionary * itemDictionary in itemsDictionaryArray) {
                     WagHWStackOverflowAPIUser * user = [[WagHWStackOverflowAPIUser alloc] initWithDictionary:itemDictionary];
                     [itemsArray addObject:[[WagHWStackOverflowUserProxy alloc] initWithAPIUser:user]];
                 }
                 
                 [WagHWCoreDataManager storeUsers:itemsArray];
                 success(itemsArray);
             }
         } failure:^(NSURLSessionTask *operation, NSError *error) {
             NSLog(@"Error: %@", error);
         }];
}

@end
