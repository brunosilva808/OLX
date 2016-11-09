//
//  ViewController.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

#pragma mark - Properties

@property (nonatomic, strong) NSMutableArray *adsArray;

#pragma mark - IBOutlet

@property (weak, nonatomic) IBOutlet UITableView *tableView;

#pragma mark - Methods

@end

