//
//  infoWindowView.h
//  MealPickerProject
//
//  Created by Edwin Li on 12/15/15.
//  Copyright (c) 2015 Edwin Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface infoWindowView : UIView
@property (weak, nonatomic) IBOutlet UILabel *titleName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *cuisineType;
@property (weak, nonatomic) IBOutlet UIImageView *photo;
@end
