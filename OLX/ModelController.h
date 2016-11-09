//
//  ModelController.h
//  PageXpto
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class DetailViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>

#pragma mark - Properties

@property (nonatomic, strong) NSMutableArray *adsArray;

#pragma mark - Methods

- (instancetype)initWithAds:(NSMutableArray *)adsArray;
- (DetailViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard;
- (NSUInteger)indexOfViewController:(DetailViewController *)viewController;

@end

