//
//  WagHWTableViewCell.h
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WagHWTableViewCell : UITableViewCell

@property (weak, nonatomic, nullable) IBOutlet UIImageView * avatarImageView;
@property (weak, nonatomic, nullable) IBOutlet UILabel * nameLabel;
@property (weak, nonatomic, nullable) IBOutlet UIView * goldView;
@property (weak, nonatomic, nullable) IBOutlet UIView * silverView;
@property (weak, nonatomic, nullable) IBOutlet UIView * bronzeView;
@property (weak, nonatomic, nullable) IBOutlet UILabel * goldLabel;
@property (weak, nonatomic, nullable) IBOutlet UILabel * silverLabel;
@property (weak, nonatomic, nullable) IBOutlet UILabel * bronzeLabel;
@property (weak, nonatomic, nullable) IBOutlet UIActivityIndicatorView * activityIndicatorView;

- (void)setAvatarStyle;
- (void)setGoldCount:(NSString * _Nonnull)goldCount
         silverCount:(NSString * _Nonnull)silverCount
         bronzeCount:(NSString * _Nonnull)bronzeCount;
- (void)setUserAvatar:(NSString * _Nonnull)url
               userId:(NSString * _Nonnull)userId;

@end
