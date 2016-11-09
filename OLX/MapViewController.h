//
//  MapViewController.h
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class MKMapView;

@interface MapViewController : UIViewController

@property (weak, nonatomic) IBOutlet MKMapView *map;

@end
