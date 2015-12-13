//
//  FacultyTableViewController.h
//  RubricGradingAppCD
//
//  Created by Hassan on 12/1/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Professor.h"

@interface FacultyTableViewController : UITableViewController

@property (strong, nonatomic) NSFetchedResultsController *fetchedResultsController;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic) NSString *facultyUserName;
@property (nonatomic) Professor *selectedProfessor;
@property  (nonatomic) NSArray *facultyProjects;
@end
