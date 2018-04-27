//
//  WagHWStackOverflowUser+CoreDataProperties.m
//  
//
//  Created by Sarah Lee on 4/26/18.
//
//

#import "WagHWStackOverflowUser+CoreDataProperties.h"

@implementation WagHWStackOverflowUser (CoreDataProperties)

+ (NSFetchRequest<WagHWStackOverflowUser *> *)fetchRequest {
	return [NSFetchRequest fetchRequestWithEntityName:@"WagHWStackOverflowUser"];
}

@dynamic userId;
@dynamic displayName;
@dynamic bronzeCount;
@dynamic goldCount;
@dynamic profileImageUrl;
@dynamic silverCount;

@end
