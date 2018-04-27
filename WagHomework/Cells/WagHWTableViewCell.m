//
//  WagHWTableViewCell.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWTableViewCell.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
#import "WagHWAvatarManager.h"
#import "WagHWStackOverflowAPIUser.h"

@implementation WagHWTableViewCell

#pragma mark - UIView Methods

- (void)awakeFromNib
{
    [super awakeFromNib];
    self.avatarImageView.layer.cornerRadius = 50.0f;
    self.goldView.layer.cornerRadius = 10.0f;
    self.silverView.layer.cornerRadius = 10.0f;
    self.bronzeView.layer.cornerRadius = 10.0f;
}

- (void)prepareForReuse
{
    [super prepareForReuse];
    self.avatarImageView.layer.cornerRadius = 50.0f;
    self.avatarImageView.image = nil;
}

#pragma mark - Private Methods

- (void)showAndAnimateIndicator
{
    [self.activityIndicatorView startAnimating];
    self.activityIndicatorView.hidden = NO;
}

- (void)hideAndStopIndicator
{
    [self.activityIndicatorView stopAnimating];
    self.activityIndicatorView.hidden = YES;
}

#pragma mark - Public Methods

- (void)setUserAvatar:(NSString *)url
               userId:(NSString *)userId
{
    [self showAndAnimateIndicator];
    
    __weak WagHWTableViewCell * weakSelf = self;
    [self.avatarImageView sd_setImageWithURL:[NSURL URLWithString:url]
                                   completed:^(UIImage * _Nullable image, NSError * _Nullable error, SDImageCacheType cacheType, NSURL * _Nullable imageURL) {
                                       WagHWTableViewCell * strongSelf = weakSelf;
                                       [strongSelf setAvatarStyle];
                                       [WagHWAvatarManager storeDownloadedImage:image userId:userId];
                                   }];
}

- (void)setAvatarStyle
{
    [self hideAndStopIndicator];
    self.avatarImageView.layer.cornerRadius = 50.0f;
    self.avatarImageView.layer.masksToBounds = YES;
}

- (void)setGoldCount:(NSString *)goldCount
         silverCount:(NSString *)silverCount
         bronzeCount:(NSString *)bronzeCount
{
    self.goldLabel.text = goldCount;
    self.silverLabel.text = silverCount;
    self.bronzeLabel.text = bronzeCount;
}

@end
