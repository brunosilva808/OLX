//
//  ModelController.m
//  PageXpto
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "ModelController.h"
#import "DetailViewController.h"
#import "LibraryAPI.h"

/*
 A controller object that manages a simple model -- a collection of month names.
 
 The controller serves as the data source for the page view controller; it therefore implements pageViewController:viewControllerBeforeViewController: and pageViewController:viewControllerAfterViewController:.
 It also implements a custom method, viewControllerAtIndex: which is useful in the implementation of the data source methods, and in the initial configuration of the application.
 
 There is no need to actually create view controllers for each page in advance -- indeed doing so incurs unnecessary overhead. Given the data model, these methods create, configure, and return a new view controller on demand.
 */


@interface ModelController ()

//@property (readonly, strong, nonatomic) NSArray *pageData;
@end

@implementation ModelController

- (instancetype)initWithAds:(NSMutableArray *)adsArray {
    self = [super init];
    if (self) {
        self.adsArray = adsArray;
    }
    return self;
}

- (DetailViewController *)viewControllerAtIndex:(NSUInteger)index storyboard:(UIStoryboard *)storyboard {
    // Return the data view controller for the given index.
    if (([self.adsArray count] == 0) || (index >= [self.adsArray count])) {
        return nil;
    }

    // Create a new view controller and pass suitable data.
    DetailViewController *DetailViewController = [storyboard instantiateViewControllerWithIdentifier:@"DetailViewController"];
    DetailViewController.ad = self.adsArray[index];
    return DetailViewController;
}


- (NSUInteger)indexOfViewController:(DetailViewController *)viewController {
    // Return the index of the given data view controller.
    // For simplicity, this implementation uses a static array of model objects and the view controller stores the model object; you can therefore use the model object to identify the index.
    return [self.adsArray indexOfObject:viewController.ad];
}


#pragma mark - Page View Controller Data Source

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerBeforeViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DetailViewController *)viewController];
    if ((index == 0) || (index == NSNotFound)) {
        return nil;
    }
    
    [[LibraryAPI sharedManager] setFlag:YES];
    
    index--;
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

- (UIViewController *)pageViewController:(UIPageViewController *)pageViewController viewControllerAfterViewController:(UIViewController *)viewController
{
    NSUInteger index = [self indexOfViewController:(DetailViewController *)viewController];
    if (index == NSNotFound) {
        return nil;
    }
    
    index++;
    if (index == [self.adsArray count]) {
        return nil;
    }
    
    [[LibraryAPI sharedManager] setFlag:YES];
    
    return [self viewControllerAtIndex:index storyboard:viewController.storyboard];
}

@end
