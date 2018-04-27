//
//  WagHWStackOverflowUserProxy.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWStackOverflowUserProxy.h"
#import "WagHWStackOverflowAPIUser.h"
#import "WagHWStackOverflowUser+CoreDataClass.h"

@implementation WagHWStackOverflowUserProxy

- (instancetype)initWithUser:(WagHWStackOverflowUser *)user
{
    self = [super init];
    if ( self ) {
        _userId = user.userId;
        _displayName = user.displayName;
        _badgeCounts = nil;
        _profileImageUrl = user.profileImageUrl;
        _goldCount = user.goldCount;
        _silverCount = user.silverCount;
        _bronzeCount = user.bronzeCount;
    }
    return self;
}

- (instancetype)initWithAPIUser:(WagHWStackOverflowAPIUser *)apiUser
{
    self = [super init];
    if ( self ) {
        _userId = apiUser.userId;
        _displayName = apiUser.displayName;
        _badgeCounts = apiUser.badgeCounts;
        _profileImageUrl = apiUser.profileImageUrl;
        _goldCount = apiUser.goldCount;
        _silverCount = apiUser.silverCount;
        _bronzeCount = apiUser.bronzeCount;
    }
    return self;
}

@end
