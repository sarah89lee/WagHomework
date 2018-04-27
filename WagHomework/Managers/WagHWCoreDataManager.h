//
//  WagHWCoreDataManager.h
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import <Foundation/Foundation.h>

@class WagHWStackOverflowUser;

@interface WagHWCoreDataManager : NSObject

+ (void)storeUsers:(NSArray<WagHWStackOverflowUser *> *)users;

@end
