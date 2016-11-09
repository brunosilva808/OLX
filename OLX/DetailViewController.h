//
//  DetailViewController.h
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Ad;

@interface DetailViewController : UIViewController

#pragma mark - Properties

@property (strong, nonatomic) Ad *ad;

#pragma mark - IBOutlet

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *descriptionLabel;

#pragma mark - IBAction

- (IBAction)mapButtonTapped:(id)sender;

@end
