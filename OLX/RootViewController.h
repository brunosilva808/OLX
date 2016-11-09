//
//  DetailPageViewController.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController <UIPageViewControllerDelegate>

#pragma mark - Properties

@property (nonatomic, strong) NSMutableArray *adsArray;
@property (nonatomic, assign) NSInteger adIndex;
@property (strong, nonatomic) UIPageViewController *pageViewController;

@end
