//
//  ViewController.m
//  MealPickerProject
//
//  Created by Edwin Li on 12/14/15.
//  Copyright (c) 2015 Edwin Li. All rights reserved.
//

#import "ViewController.h"
#import <corelocation/corelocation.h>

@interface ViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) NSString *latitude;
@property (weak, nonatomic) NSString *longitude;
@property (weak, nonatomic) NSString *address;

@end

@implementation ViewController{
    CLLocationManager *manager;
    CLGeocoder * geocoder;
    CLPlacemark *placemark;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    manager = [[CLLocationManager alloc] init];
    geocoder = [[CLGeocoder alloc] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)buttonPressed:(id)sender{
    manager.delegate = self;
    manager.desiredAccuracy = kCLLocationAccuracyBest;
    
    [manager startUpdatingLocation];
}

- (void) locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"Error: %@", error);
    NSLog(@"Failed to get location");
}

-(void) locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{
    NSLog(@"Location: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    if(currentLocation !=nil){
        self.latitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        self.longitude = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
    }
    [geocoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        if( error == nil && [placemarks count] >0){
            placemark = [placemarks lastObject];
            self.address = [NSString stringWithFormat:@"%@ %@\n%@ %@\n%@\n%@",
                            placemark.subThoroughfare, placemark.thoroughfare,
                            placemark.postalCode, placemark.locality,
                            placemark.country];
        }else{
            NSLog(@"%@", error.debugDescription);
        }
    }
        
    ];
}
@end
