//
//  MapViewController.h
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView, Ad;

@interface MapViewController : UIViewController

#pragma mark - Properties

@property (strong, nonatomic) Ad *ad;

#pragma mark - IBOutlet

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end
