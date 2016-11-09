//
//  CustomAnnotation.m
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "CustomAnnotation.h"

@implementation CustomAnnotation

#pragma mark - Life Cycle

- (id)initWithTitle:(NSString *)newTitle andLocation:(CLLocationCoordinate2D)location
{
    self = [super init];
    
    if (self) {
        _title = newTitle;
        _coordinate = location;
    }
    
    return self;
}

- (MKAnnotationView *)annotationView
{
    MKAnnotationView *annotationView = [[MKAnnotationView alloc] initWithAnnotation:self reuseIdentifier:@"CustomAnnotation"];
    
    annotationView.enabled = YES;
    annotationView.canShowCallout = YES;
    annotationView.image = [UIImage imageNamed:@"share-256"];
    
    return annotationView;
}

@end
