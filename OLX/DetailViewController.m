//
//  DetailViewController.m
//  OLX
//
//  Created by Bruno Silva on 08/11/2016.
//  Copyright © 2016 Tradiio. All rights reserved.
//

#import "DetailViewController.h"
#import "Ad.h"
#import "MapViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

#pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setup];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Setup

- (void)setup {
    self.titleLabel.text = self.ad.title;
    self.descriptionLabel.text = self.ad.adDescription;
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    MapViewController *mapViewController = [segue destinationViewController];
    mapViewController.ad = self.ad;
}


@end
