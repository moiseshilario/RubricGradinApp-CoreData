//
//  AdminTableViewController.h
//  RubricGradingAppCD

//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AddProjectViewController.h"


@interface AdminTableViewController : UITableViewController <AddProjectViewControllerDelegate>

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

-(void) instantiateWithLoginID: (NSString *)loginID;
@end
