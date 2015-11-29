//
//  StudentsListTableViewController.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/23/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface StudentsListTableViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@end
