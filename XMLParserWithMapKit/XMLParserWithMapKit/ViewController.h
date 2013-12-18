//
//  ViewController.h
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
@class Business;
@interface ViewController : UIViewController<MKMapViewDelegate>

@property (weak, nonatomic) IBOutlet UIButton *zoomInButton;
@property (weak, nonatomic) IBOutlet MKMapView *mapView;
@property (strong, nonatomic) Business * business;
@property (weak, nonatomic) IBOutlet UILabel *otherBusinessInfoLabel;
@end
