//
//  WagHWViewController.m
//  WagHomework
//
//  Created by Sarah Lee on 4/26/18.
//  Copyright © 2018 Sarah Lee. All rights reserved.
//

#import "WagHWViewController.h"
#import <SDWebImage/UIImageView+WebCache.h>
#import <SDWebImage/UIView+WebCache.h>
#import <MagicalRecord/MagicalRecord.h>
#import "WagHWGetStackOverflowUsersEndpoint.h"
#import "WagHWTableViewCell.h"
#import "WagHWStackOverflowUserProxy.h"
#import "WagHWAvatarManager.h"
#import "Reachability.h"
#import "WagHWStackOverflowUser+CoreDataClass.h"

@interface WagHWViewController ()  <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * users;
@property (nonatomic, strong) NSFetchedResultsController * usersFetchResultsController;

@end

@implementation WagHWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerNib:[UINib nibWithNibName:@"WagHWTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"WagHWTableViewCell"];
    
    
    self.usersFetchResultsController = [WagHWStackOverflowUser MR_fetchAllSortedBy:nil
                                                                         ascending:YES
                                                                     withPredicate:nil
                                                                           groupBy:nil
                                                                          delegate:nil];
    
    [self fetchStackOverflowUsers];
}

#pragma mark - Private Methods

- (void)fetchStackOverflowUsers
{
    // if we have internet connection, we'll fetch users. otherwise let's check coreData to see if there saved users
    if ([[Reachability reachabilityForInternetConnection]currentReachabilityStatus] == NotReachable) {
        [self fetchCoreDataUsers];
    } else  {
        __weak WagHWViewController * weakSelf = self;
        [WagHWGetStackOverflowUsersEndpoint getStackOverflowUsers:^(NSArray * users) {
            WagHWViewController * strongSelf = weakSelf;
            strongSelf.users = users;
            
            dispatch_async(dispatch_get_main_queue(), ^{
                [strongSelf.tableView reloadData];
            });
        }];
    }
}

- (void)fetchCoreDataUsers
{
    [self.usersFetchResultsController performFetch:nil];
    
    if (self.usersFetchResultsController.fetchedObjects.count > 0) {
        NSMutableArray * fetchedUsers = [NSMutableArray new];
        for (WagHWStackOverflowUser * user in self.usersFetchResultsController.fetchedObjects) {
            [fetchedUsers addObject:[[WagHWStackOverflowUserProxy alloc] initWithUser:user]];
        }
        
        self.users = [NSArray arrayWithArray:fetchedUsers];
        [self.tableView reloadData];
    }
}

#pragma mark - UITableViewDataSource Methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.users.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    WagHWTableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"WagHWTableViewCell"];
    return cell;
}

#pragma mark - UITableViewDelegate Methods

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    WagHWTableViewCell * userCell = (WagHWTableViewCell *)cell;
    WagHWStackOverflowUserProxy * user = [self.users objectAtIndex:indexPath.row];
    userCell.nameLabel.text = user.displayName;
    [userCell setGoldCount:user.goldCount
               silverCount:user.silverCount
               bronzeCount:user.bronzeCount];
    
    UIImage * storedImage = [WagHWAvatarManager storedImageWithUserId:user.userId];
    if (storedImage) {
        userCell.avatarImageView.image = storedImage;
        [userCell setAvatarStyle];
    } else {
        [userCell setUserAvatar:user.profileImageUrl
                         userId:user.userId];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 150.0f;
}

@end
