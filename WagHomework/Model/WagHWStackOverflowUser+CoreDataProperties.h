//
//  WagHWStackOverflowUser+CoreDataProperties.h
//  
//
//  Created by Sarah Lee on 4/26/18.
//
//

#import "WagHWStackOverflowUser+CoreDataClass.h"


NS_ASSUME_NONNULL_BEGIN

@interface WagHWStackOverflowUser (CoreDataProperties)

+ (NSFetchRequest<WagHWStackOverflowUser *> *)fetchRequest;

@property (nullable, nonatomic, copy) NSString *userId;
@property (nullable, nonatomic, copy) NSString *displayName;
@property (nullable, nonatomic, copy) NSString *bronzeCount;
@property (nullable, nonatomic, copy) NSString *goldCount;
@property (nullable, nonatomic, copy) NSString *profileImageUrl;
@property (nullable, nonatomic, copy) NSString *silverCount;

@end

NS_ASSUME_NONNULL_END
