//
//  WagHWCoreDataManager.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWCoreDataManager.h"
#import <MagicalRecord/MagicalRecord.h>
#import "WagHWStackOverflowAPIUser.h"
#import "WagHWStackOverflowUser+CoreDataClass.h"

@implementation WagHWCoreDataManager

+ (void)storeUsers:(NSArray<WagHWStackOverflowUser *> *)users
{
    [MagicalRecord saveWithBlock:^(NSManagedObjectContext * _Nonnull localContext) {
        for (WagHWStackOverflowAPIUser * apiUser in users) {
            WagHWStackOverflowUser * user = [WagHWStackOverflowUser MR_createEntityInContext:localContext];
            user.userId = apiUser.userId;
            user.profileImageUrl = apiUser.profileImageUrl;
            user.bronzeCount = apiUser.bronzeCount;
            user.goldCount = apiUser.goldCount;
            user.silverCount = apiUser.silverCount;
            user.displayName = apiUser.displayName;
        }
    }];
}

@end
