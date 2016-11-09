//
//  CustomAnnotation.h
//  OLX
//
//  Created by Bruno Silva on 09/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

@interface CustomAnnotation : NSObject <MKAnnotation>

#pragma mark - Properties

@property (readonly, nonatomic) CLLocationCoordinate2D coordinate;
@property (copy, nonatomic) NSString *title;

- (id)initWithTitle:(NSString *)newTitle andLocation:(CLLocationCoordinate2D)location;
- (MKAnnotationView *)annotationView;

@end
