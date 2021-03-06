//
//  TCPeopleViewController.m
//  TCDoorBell
//
//  Created by Joshua Gosse on 2012-10-13.
//  Copyright (c) 2012 Shopify. All rights reserved.
//

#import "TCPeopleViewController.h"
#import "TCPeopleCollectionViewCell.h"
#import "TCPerson.h"
#import "TCService.h"

#import "UIImageView+AFNetworking.h"
#import "SVProgressHUD.h"

#pragma mark - Implementation

@implementation TCPeopleViewController {
	UICollectionView *_collectionView;
}

#pragma mark - Views

- (void)loadView
{
	[super loadView];
	
	// generate a flow layout to provide to the collection view
	UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
	[flowLayout setItemSize:CGSizeMake(kTCNumericCellWidth, kTCNumericCellHeight)];
	[flowLayout setScrollDirection:UICollectionViewScrollDirectionVertical];
	[flowLayout setSectionInset:UIEdgeInsetsMake(kTCNumericSectionInset, kTCNumericSectionInset, kTCNumericSectionInset, kTCNumericSectionInset)];
	
	// add a collection view, allow it to take up the entirety of the display
	_collectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:flowLayout];
	_collectionView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
	[_collectionView setShowsVerticalScrollIndicator:YES];
	[_collectionView registerClass:[TCPeopleCollectionViewCell class] forCellWithReuseIdentifier:kTCCellIdentifier];
	
	// assign the controller as the delegate and datasource of the collection view
	_collectionView.delegate = self;
	_collectionView.dataSource = self;
	
	[self.view addSubview:_collectionView];
}

#pragma mark - View Lifecycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	
	[[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(didReceiveUnlockNotification:) name:kTCApplicationDidReceiveUnlockNotification object:nil];
	
	[[TCService sharedInstance] listAllPeopleWithCallback:^(id content, NSError *error) {
		// data structure for storing the list of employees
		_people = content;
		
		// reload the collection view with the data
		[_collectionView reloadData];
	}];
}

- (void)dealloc
{
	[[NSNotificationCenter defaultCenter] removeObserver:self];
}

#pragma mark - UICollectionView Delegate

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
	UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
	TCPerson *person = [_people objectAtIndex:indexPath.row];
	
	cell.backgroundView.backgroundColor = [UIColor purpleColor];
	
	[[TCService sharedInstance] sendTextMessageToPerson:person withBody:kTCStringTextMessageBody callback:^(id content, NSError *error) {
		UIAlertView *alertView = nil;
		
		if (error) {
			alertView = [[UIAlertView alloc] initWithTitle:nil message:kTCStringMessageSendFailure delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		}
		else {
			alertView = [[UIAlertView alloc] initWithTitle:nil message:kTCStringMessageSendSuccess delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
		}
		
		[alertView show];
		
		cell.backgroundView.backgroundColor = [UIColor whiteColor];
	}];
}

#pragma mark - UICollectionView DataSource

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
	// get the person located at the current index and update the view
	TCPerson *person = [_people objectAtIndex:indexPath.row];
	TCPeopleCollectionViewCell *peopleViewCell = [_collectionView dequeueReusableCellWithReuseIdentifier:kTCCellIdentifier forIndexPath:indexPath];
	[peopleViewCell updateWithPerson:person];
	
	return peopleViewCell;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
	return [_people count];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
	return 1;
}

#pragma mark - Unlock Notification

- (void)didReceiveUnlockNotification:(NSNotification *)notification
{
	[[TCService sharedInstance] unlockDoor:@"reception" callback:nil];
}

@end
