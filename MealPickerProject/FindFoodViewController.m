//
//  FindFoodViewController.m
//  MealPickerProject
//
//  Created by Edwin Li on 12/14/15.
//  Copyright (c) 2015 Edwin Li. All rights reserved.
//

#import "FindFoodViewController.h"
#import "Restaurant.h"
#import <MapKit/MapKit.h>
@import GoogleMaps;

@interface FindFoodViewController () <CLLocationManagerDelegate>
@property (weak, nonatomic) NSString *userCurrentLatitude;
@property (weak, nonatomic) NSString *userCurrentLongitude;
@property (weak, nonatomic) NSString *userCurrentAddress;
@property(copy, nonatomic) NSMutableDictionary * restaurants;


@end

@implementation FindFoodViewController{
    GMSMapView *mapView_;
    NSMutableDictionary *restaurantList;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    myArray = [[NSArray alloc] initWithObjects:@"store 1",@"store 2", @"store 3",@"store 4",@"store 5",@"store 6",@"store 7",@"store 8",@"store 9",@"store 10", nil];
    [self.view layoutIfNeeded];
    
    //set some data sample for markers
    [Restaurant addRecordWithName:@"BONDST"
                       andAddress:@"6 Bond St"
                       andLatitude:@"40.72685892228287"
                       andLongitude:@"-73.99459852870525"];
    [Restaurant addRecordWithName:@"Blue Ribbon Sushi"
                       andAddress:@"119 Sullivan St"
                      andLatitude:@"40.72616149031595"
                     andLongitude:@"-74.0026326791738"];
    [Restaurant addRecordWithName:@"Lure Fishbar"
                       andAddress:@"142 Mercer St"
                      andLatitude:@"40.72463457437033"
                     andLongitude:@"-73.99840235710144"];
    restaurantList = [Restaurant alist];
    
    //center of the user current location
    self.userCurrentLatitude = @"40.7300";
    self.userCurrentLongitude = @"-73.9950";
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[self.userCurrentLatitude doubleValue]
                                                            longitude:[self.userCurrentLongitude doubleValue]
                                                                 zoom:15];
    GMSMapView *mapView = [GMSMapView mapWithFrame:CGRectMake(0, 40, 350, 350) camera:camera];
    for (NSString *key in restaurantList ) {
        GMSMarker *mkr = [[GMSMarker alloc]init];
        NSString *address = [[restaurantList objectForKey:key]getAddress];
        
        mkr.position = CLLocationCoordinate2DMake([[[restaurantList objectForKey:key]getLatitude] doubleValue], [[[restaurantList objectForKey:key]getLongtitude] doubleValue]);
        mkr.appearAnimation = kGMSMarkerAnimationPop;
        mkr.icon = [GMSMarker markerImageWithColor:[UIColor redColor]];
        mkr.icon = [UIImage imageNamed:@"flag_icon"];
        NSString *info = [NSString stringWithFormat:@"Title: %@\nAddress: %@", key,[[restaurantList objectForKey:key]getAddress]];
        mkr.snippet = info;
        mkr.map = mapView;
    }
    //pin points on map
    //    for(GMSMarker*marker in dictionary)
    //    {
    //        GMSMarker *mkr= [[GMSMarker alloc]init];
    //        [mkr setPosition:CLLocationCoordinate2DMake(<coord>)];
    //
    //        [mkr setAnimated:YES];
    //        [mkr setTitle:<Title>];
    //        [mkr setSnippet:<Snippet>];
    //        [mkr setMap:mapView_];
    //    }
    GMSMarker *marker = [[GMSMarker alloc] init];
    
    marker.position = CLLocationCoordinate2DMake(40.7300, -73.9950);
    marker.icon = [GMSMarker markerImageWithColor:[UIColor blueColor]];
    marker.snippet = @"NYU";//can be use to display the name & info for the marker
    marker.appearAnimation = kGMSMarkerAnimationPop;
    marker.icon = [UIImage imageNamed:@"person"];
    marker.map = mapView;
    
    //add a cicle of area
    CLLocationCoordinate2D circleCenter = CLLocationCoordinate2DMake(40.7300, -73.9950);
    GMSCircle *circ = [GMSCircle circleWithPosition:circleCenter
                                             radius:500];
    circ.map = mapView;
    
    [self.view addSubview:mapView];
    
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [myArray count];
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"theCell"];
    cell.textLabel.text = [myArray objectAtIndex:indexPath.row];
    return cell;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end

