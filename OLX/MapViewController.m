//
//  MapViewController.m
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "MapViewController.h"
#import "Ad.h"
#import "CustomAnnotation.h"
#import "Map.h"
#import <MapKit/MapKit.h>

#define METERS_PER_MILE 1609.344

@interface MapViewController ()
{
    CLLocationDistance regionRadius;
}

@end

@implementation MapViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

- (void)viewWillAppear:(BOOL)animated {

    [self setupMap];
    [self setupAnnotation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setup {
    self.title = self.ad.map.cityLabel;
}

- (void)setupMap {
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake([self.ad.map.latitude floatValue], [self.ad.map.longitude floatValue]);
    
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, regionRadius * 2.0, regionRadius * 2.0);
//    viewRegion.span.longitudeDelta = [self.ad.map.zoom floatValue];
//    viewRegion.span.longitudeDelta = [self.ad.map.zoom floatValue];
    
    [self.mapView setZoomEnabled:YES];
    [self.mapView setRegion:viewRegion animated:YES];

}

- (void)setupAnnotation {
    CLLocationCoordinate2D zoomLocation = CLLocationCoordinate2DMake([self.ad.map.latitude floatValue], [self.ad.map.longitude floatValue]);

    // Add an annotation
    MKPointAnnotation *point = [[MKPointAnnotation alloc] init];
    point.coordinate = zoomLocation;
    point.title = self.ad.title;
    point.subtitle = self.ad.map.cityLabel;
    
    [self.mapView addAnnotation:point];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
