//
//  WagHWStackOverflowAPIUser.h
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

extern NSString * const WagHWStackOverflowUserBronze;
extern NSString * const WagHWStackOverflowUserSilver;
extern NSString * const WagHWStackOverflowUserGold;

@interface WagHWStackOverflowAPIUser : NSObject

- (instancetype _Nonnull)initWithDictionary:(NSDictionary * _Nonnull)dictionary;

@property (readonly, nonatomic, copy, nullable) NSString * userId;

@property (readonly, nonatomic, copy, nullable) NSString * displayName;

@property (readonly, nonatomic, strong, nullable) NSDictionary * badgeCounts;

@property (readonly, nonatomic, copy, nullable) NSString * profileImageUrl;

@property (readonly, nonatomic, copy, nullable) NSString * goldCount;

@property (readonly, nonatomic, copy, nullable) NSString * silverCount;

@property (readonly, nonatomic, copy, nullable) NSString * bronzeCount;

@end
