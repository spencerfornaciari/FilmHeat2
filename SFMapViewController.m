//
//  SFMapViewController.m
//  FilmHeat
//
//  Created by Spencer Fornaciari on 1/31/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFMapViewController.h"
#import <MapKit/MapKit.h>

@interface SFMapViewController () <MKMapViewDelegate, CLLocationManagerDelegate, UISearchBarDelegate>
@property (weak, nonatomic) IBOutlet MKMapView *theaterMapView;
@property (weak, nonatomic) IBOutlet UIToolbar *settingsBarButton;
@property (weak, nonatomic) IBOutlet UISearchBar *theaterMapSearch;

@property (nonatomic, strong) CLLocationManager *locationManager;
@property (strong, nonatomic) CLLocation *location;

@property (nonatomic) CLLocationCoordinate2D pointCenter;
@property (nonatomic) int currentDistance;

@property (nonatomic) CLAuthorizationStatus authorizationStatus;


@end

@implementation SFMapViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Declare CLLocation Manager
    self.locationManager = [[CLLocationManager alloc] init];
    self.locationManager.delegate = self;
    [self.locationManager setDistanceFilter:kCLDistanceFilterNone];
    [self.locationManager setDesiredAccuracy:kCLLocationAccuracyHundredMeters];
    [self.locationManager startUpdatingLocation];
    
    self.location = [[CLLocation alloc] init];
    
    //Declare MapView
    self.theaterMapView.delegate = self;
    self.theaterMapView.mapType = MKMapTypeStandard;
    self.theaterMapView.showsUserLocation = YES;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)updateCurrentLocation:(id)sender
{
    if (self.authorizationStatus == kCLAuthorizationStatusAuthorized)
    {
        [self updateUserLocation];
        //[self.mapView setCenterCoordinate:self.location.coordinate animated:YES];
    } else {
        [self checkLocationStatus];
    }
}

-(void)updateUserLocation
{
    //NSLog(@"%f,%f", self.location.coordinate.latitude, self.location.coordinate.longitude);
    [self.theaterMapView setCenterCoordinate:self.location.coordinate animated:YES];
}

-(void)checkLocationStatus
{
    UIAlertView *status =[[UIAlertView alloc] initWithTitle:@"Location services are disabled"
                                                    message:@"This app won't work without them!"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles: nil];
    [status show];
}


@end
