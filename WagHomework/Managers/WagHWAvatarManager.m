//
//  WagHWAvatarManager.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWAvatarManager.h"
#import "WagHWStackOverflowAPIUser.h"

@implementation WagHWAvatarManager

#pragma mark - Properties

+ (UIImage *)storedImageWithUserId:(NSString *)userId
{
    NSFileManager * fileManager = [NSFileManager defaultManager];
    NSString * avatarUrl = [self avatarImageUrl:userId];
    
    if ([fileManager fileExistsAtPath:avatarUrl]) {
        return [UIImage imageWithContentsOfFile:avatarUrl];
    } else {
        return nil;
    }
}

+ (void)storeDownloadedImage:(UIImage *)image userId:(NSString *)userId
{
    NSData * imageData = UIImageJPEGRepresentation(image, 0.5);
    [[NSFileManager defaultManager] createFileAtPath:[self avatarImageUrl: userId]
                                            contents:imageData
                                          attributes:nil];
}

#pragma mark - Private Methods

+ (NSString *)avatarImageUrl:(NSString *)userId
{
    NSString * imageName = [userId stringByAppendingString:@".png"];
    return [[self avatarImagesDirectory] stringByAppendingPathComponent:imageName];
}

+ (NSString *)avatarImagesDirectory
{
    NSString * documentsDirectory = [self applicationDocumentsDirectory].path;
    NSString * directory = [documentsDirectory stringByAppendingPathComponent:@"avatarImages"];
    NSFileManager * fileManager = [NSFileManager defaultManager];
    
    // ensure the directory exists and if it does not create it
    if (![fileManager fileExistsAtPath:directory isDirectory:NULL]) {
        NSError * error = nil;
        if (![fileManager createDirectoryAtPath:directory withIntermediateDirectories:YES attributes:nil error:&error]) {
            NSLog(@"error: %@", error);
        }
    }
    
    return directory;
}

+ (NSURL *)applicationDocumentsDirectory
{
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

@end
