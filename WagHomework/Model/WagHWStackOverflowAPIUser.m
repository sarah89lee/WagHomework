//
//  WagHWStackOverflowAPIUser.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWStackOverflowAPIUser.h"

NSString * const WagHWStackOverflowUserBronze = @"bronze";
NSString * const WagHWStackOverflowUserSilver = @"silver";
NSString * const WagHWStackOverflowUserGold = @"gold";

@interface WagHWStackOverflowAPIUser()

@property (strong, nonatomic) NSDictionary * content;

@end

@implementation WagHWStackOverflowAPIUser

#pragma mark - Initialization Method

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    self = [super init];
    if (self) {
        _content = dictionary;
    }
    return self;
}

#pragma mark - Properties

- (NSString *)userId
{
    return [[self.content objectForKey:@"account_id"] stringValue];
}

- (NSString *)displayName
{
    return [self.content objectForKey:@"display_name"];
}

- (NSString *)profileImageUrl
{
    return [self.content objectForKey:@"profile_image"];
}

- (NSDictionary *)badgeCounts
{
    return [self.content objectForKey:@"badge_counts"];
}

- (NSString *)goldCount
{
    return [[[self badgeCounts] objectForKey:WagHWStackOverflowUserGold] stringValue];
}

- (NSString *)silverCount
{
    return [[[self badgeCounts] objectForKey:WagHWStackOverflowUserSilver] stringValue];
}

- (NSString *)bronzeCount
{
    return [[[self badgeCounts] objectForKey:WagHWStackOverflowUserBronze] stringValue];
}

@end
