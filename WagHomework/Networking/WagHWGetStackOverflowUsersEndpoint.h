//
//  WagHWGetStackOverflowUsersEndpoint.h
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WagHWStackOverflowUserProxy;

typedef void (^WagHWGetStackOverflowUsersEndpointSuccess)(NSArray<WagHWStackOverflowUserProxy *> * users);

@interface WagHWGetStackOverflowUsersEndpoint : NSObject

+ (void)getStackOverflowUsers:(WagHWGetStackOverflowUsersEndpointSuccess)success;

@end
