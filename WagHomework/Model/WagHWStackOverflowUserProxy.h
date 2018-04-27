//
//  WagHWStackOverflowUserProxy.h
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WagHWStackOverflowAPIUser, WagHWStackOverflowUser;

@interface WagHWStackOverflowUserProxy : NSObject

- (instancetype _Nonnull)initWithAPIUser:(WagHWStackOverflowAPIUser * _Nonnull)apiUser;
- (instancetype _Nonnull)initWithUser:(WagHWStackOverflowUser * _Nonnull)user;

@property (nonatomic, copy, nullable) NSString * userId;

@property (nonatomic, copy, nullable) NSString * displayName;

@property (nonatomic, strong, nullable) NSDictionary * badgeCounts;

@property (nonatomic, copy, nullable) NSString * profileImageUrl;

@property (nonatomic, copy, nullable) NSString * goldCount;

@property (nonatomic, copy, nullable) NSString * silverCount;

@property (nonatomic, copy, nullable) NSString * bronzeCount;

@end
