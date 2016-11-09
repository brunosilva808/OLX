//
//  ViewController.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "ViewController.h"
#import "RootViewController.h"

#import "AdsServerManager.h"
#import "AFHTTPSessionManager.h"

#import "AdsTableViewCell.h"

#import "Ad.h"

#define WeakDeclaration(_object_, _weak_object_)				__weak typeof(_object_) _weak_object_ = _object_

@interface ViewController ()

@end

@implementation ViewController

#pragma mark - Lyfe Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupTable];
    [self requestAds];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setupTable {
    [self.tableView registerNib:[UINib nibWithNibName:@"AdsTableViewCell" bundle:nil]
         forCellReuseIdentifier:NSStringFromClass([AdsTableViewCell class])];
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 90;
}


#pragma mark - Requests

- (void)requestAds {
    WeakDeclaration(self, weakSelf);
    
    [[AdsServerManager sharedManager] adsWithBlock:^(NSArray *posts, NSError *error) {
//        if (error) {
//            weakSelf.adsArray = [posts mutableCopy];
//        }
        
        weakSelf.adsArray = [posts mutableCopy];
        [weakSelf.tableView reloadData];
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.adsArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    AdsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([AdsTableViewCell class]) forIndexPath:indexPath];
    
    cell.ad = self.adsArray[indexPath.row];
    cell.shareButton.tag = indexPath.row;
    [cell.shareButton addTarget:self action:@selector(shareAd:) forControlEvents:UIControlEventTouchUpInside];
    
    return cell;
}


#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    RootViewController *rootViewController = [[RootViewController alloc] init];
    rootViewController.adsArray = self.adsArray;
    rootViewController.adIndex = indexPath.row;
    [self.navigationController pushViewController:rootViewController animated:YES];
}


#pragma mark - IBOutlet

- (IBAction)shareAd:(id)sender {
    
    Ad *ad = self.adsArray[[sender tag]];
    
    NSString *textToShare = ad.adDescription;
    NSURL *myWebsite = ad.url;
    
    NSArray *objectsToShare = @[textToShare, myWebsite];
    
    UIActivityViewController *activityVC = [[UIActivityViewController alloc] initWithActivityItems:objectsToShare applicationActivities:nil];
    
    NSArray *excludeActivities = @[UIActivityTypeAirDrop,
                                   UIActivityTypePrint,
                                   UIActivityTypeAssignToContact,
                                   UIActivityTypeSaveToCameraRoll,
                                   UIActivityTypeAddToReadingList,
                                   UIActivityTypePostToFlickr,
                                   UIActivityTypePostToVimeo];
    
    activityVC.excludedActivityTypes = excludeActivities;
    
    [self presentViewController:activityVC animated:YES completion:nil];

}

@end















