//
//  Restaurant.h
//  MealPickerProject
//
//  Created by Edwin Li on 12/15/15.
//  Copyright (c) 2015 Edwin Li. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Restaurant : NSObject
{
    NSString *name;
    NSString *address;
    NSString *latitude; //latitude
    NSString *longitude; // longitude
}
//method declarations
//Setters
-(void) setName:(NSString *)value;
-(void) setAddress:(NSString *)value;
-(void) setLatitude:(NSString *)value;
-(void) setLongitude:(NSString *)value;

//getters
-(NSString *)getName;
-(NSString *)getAddress;
-(NSString *)getLatitude;
-(NSString *)getLongtitude;
+(NSMutableDictionary *)alist;

- (Restaurant *)initWithName:(NSString *)nameValue
                    andAddress:(NSString *)addressValue
                    andLatitude:(NSString *)latitudeValue
                    andLongitude:(NSString *)longitudeValue;
+ (Restaurant *)initWithName:(NSString *)nameValue
                    andAddress:(NSString *)addressValue
                    andLatitude:(NSString *)latitudeValue
                    andLongitude:(NSString *)longitudeValue;
+ (BOOL)addRecordWithName:(NSString *)nameValue
                    andAddress:(NSString *)addressValue
                   andLatitude:(NSString *)latitudeValue
                  andLongitude:(NSString *)longitudeValue;
@end
