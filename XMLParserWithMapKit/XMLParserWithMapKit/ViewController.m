//
//  ViewController.m
//  XMLParserWithMapKit
//
//  Created by Wilfred Anorma on 12/18/13.
//  Copyright (c) 2013 Wilfred Anorma. All rights reserved.
//

#import "ViewController.h"
#import "AppDelegate.h"
#import "BusinessXMLParser.h"
#import "Business.h"
#import "Location.h"
#import "MapPinAnnotation.h"
#define METERS_PER_MILE 1609.344
@interface ViewController ()

@end

@implementation ViewController
@synthesize mapView = _mapView;
@synthesize zoomInButton, otherBusinessInfoLabel;
@synthesize business = _business;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    AppDelegate * appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSLog(@"%@",appDelegate.xmlFilePath);
    _business = [BusinessXMLParser loadBusinessFromFilePath:appDelegate.xmlFilePath];
    
    [self zoomInToBusinessLocation];
    
    //Setup UI
    [zoomInButton setTitle:_business.strName forState:UIControlStateNormal];
    [otherBusinessInfoLabel setText:[NSString stringWithFormat:@"Ratings : %d  Contact : %@",_business.nRatings,_business.strPhone]];
    CLLocationCoordinate2D coordinate = CLLocationCoordinate2DMake(_business.location.dLatitude,
                                                                   _business.location.dLongitude);
    MapPinAnnotation* pinAnnotation = [[MapPinAnnotation alloc] initWithCoordinates:coordinate
                                                                          placeName:_business.strName
                                                                        description:[NSString stringWithFormat:@"%@ %@, %@",_business.location.strAddress,_business.location.strCity,_business.location.strState]];
    
    [_mapView addAnnotation:pinAnnotation];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - IBOutlets
- (IBAction)zoomIn:(id)sender {
    [self zoomInToBusinessLocation];
}

- (void)zoomInToBusinessLocation{
    // 1
    CLLocationCoordinate2D zoomLocation;
    zoomLocation.latitude = _business.location.dLatitude;
    zoomLocation.longitude= _business.location.dLongitude;
    
    // 2
    MKCoordinateRegion viewRegion = MKCoordinateRegionMakeWithDistance(zoomLocation, 0.5*METERS_PER_MILE, 0.5*METERS_PER_MILE);
    
    // 3
    [_mapView setRegion:viewRegion animated:YES];
    
}

#pragma mark - MKMapView Delegate 
- (MKAnnotationView *)mapView:(MKMapView *)mapView
            viewForAnnotation:(id <MKAnnotation>)annotation
{
    if ([annotation isKindOfClass:[MKUserLocation class]])
    {
        return nil;
    }
    
    static NSString* myIdentifier = @"myIndentifier";
    MKPinAnnotationView* pinView = (MKPinAnnotationView *)[mapView dequeueReusableAnnotationViewWithIdentifier:myIdentifier];
    
    if (!pinView)
    {
        pinView = [[MKPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:myIdentifier];
        pinView.pinColor = MKPinAnnotationColorRed;
        pinView.canShowCallout = YES;
        pinView.animatesDrop = YES;
    }
    return pinView;
}
@end
