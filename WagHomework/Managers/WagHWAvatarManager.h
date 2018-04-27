//
//  WagHWAvatarManager.h
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface WagHWAvatarManager : NSObject

+ (void)storeDownloadedImage:(UIImage * _Nonnull)image userId:(NSString *)userId;
+ (UIImage * _Nullable)storedImageWithUserId:(NSString *)userId;

@end
