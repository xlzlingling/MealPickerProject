//
//  Restaurant.m
//  MealPickerProject
//
//  Created by Edwin Li on 12/15/15.
//  Copyright (c) 2015 Edwin Li. All rights reserved.
//

#import "Restaurant.h"

@implementation Restaurant
NSMutableDictionary *restaurantList;


//Setters
-(void) setName:(NSString *)value{
    self.name = value;
}
-(void) setAddress:(NSString *)value{
    self.address = value;
}
-(void) setLatitude:(NSString *)value{
    self.latitude = value;
}
-(void) setLongitude:(NSString *)value{self.longitude =value;}

//getters
-(NSString *)getName{return name;}
-(NSString *)getAddress{return address;}
-(NSString *)getLatitude{return latitude;}
-(NSString *)getLongtitude{return longitude;}
+(NSMutableDictionary *)alist{return restaurantList;}

- (Restaurant *)initWithName:(NSString *)nameValue
                  andAddress:(NSString *)addressValue
                 andLatitude:(NSString *)latitudeValue
                andLongitude:(NSString *)longitudeValue{
    self = [super init];
    if (self) {
        name = nameValue;
        address = addressValue;
        latitude = latitudeValue;
        longitude = longitudeValue;
    }
    return self;
}
+ (Restaurant *)initWithName:(NSString *)nameValue
                  andAddress:(NSString *)addressValue
                 andLatitude:(NSString *)latitudeValue
                andLongitude:(NSString *)longitudeValue{
    return [[Restaurant alloc]initWithName:nameValue andAddress:addressValue andLatitude:latitudeValue andLongitude:longitudeValue];
}
+ (BOOL)addRecordWithName:(NSString *)nameValue
                    andAddress:(NSString *)addressValue
                   andLatitude:(NSString *)latitudeValue
                  andLongitude:(NSString *)longitudeValue{
    if(!restaurantList){
        restaurantList = [[NSMutableDictionary alloc] init];
    }
    [restaurantList setObject:[Restaurant initWithName:nameValue
                                            andAddress:addressValue
                                            andLatitude:latitudeValue
                                            andLongitude:longitudeValue]
                    forKey:nameValue];
    return true;
}
@end
