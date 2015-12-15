//
//  FindFoodViewController.h
//  MealPickerProject
//
//  Created by Edwin Li on 12/14/15.
//  Copyright (c) 2015 Edwin Li. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FindFoodViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>{
    IBOutlet UITableView *tableView;
    NSArray * myArray;
}


@end

