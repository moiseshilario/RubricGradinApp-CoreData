//
//  AddProjectViewController.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"
#import "StudentsListTableViewController.h"
#import "FacultyListTableViewController.h"

@protocol AddProjectViewControllerDelegate;


@interface AddProjectViewController : UIViewController <UITableViewDelegate, UITableViewDataSource,StudentsListTableViewControllerDelegate, FacultyListTableViewControllerDelegate>



@property (weak, nonatomic) IBOutlet UITextField *projectNameField;
@property (weak, nonatomic) IBOutlet UITextView *briefDescriptionField;
@property (weak, nonatomic) IBOutlet UILabel *chairField;
@property (weak, nonatomic) IBOutlet UITableView *facultyTableView;
@property (weak, nonatomic) IBOutlet UITableView *studentTableView;
@property (nonatomic) NSMutableArray *facultyArray;
@property (nonatomic) NSMutableArray *studentsArray;
@property (nonatomic) NSMutableArray *allProfessorsArray;
@property (nonatomic) NSMutableArray *allStudentsArray;

@property (nonatomic, weak) id <AddProjectViewControllerDelegate> delegate;
@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (nonatomic, strong) Project* currentProject;

- (IBAction)cancel:(id)sender;
- (IBAction)save:(id)sender;

@end

@protocol AddProjectViewControllerDelegate <NSObject>

- (void)addProjectControllerDidSave;
- (void)addProjectControllerDidCancel:(Project *) projectToDelete;

@end

