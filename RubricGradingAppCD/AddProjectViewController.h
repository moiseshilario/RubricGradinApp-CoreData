//
//  AddProjectViewController.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Project.h"

@protocol AddProjectViewControllerDelegate;


@interface AddProjectViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *projectNameField;
@property (weak, nonatomic) IBOutlet UITextView *briefDescriptionField;
@property (weak, nonatomic) IBOutlet UILabel *chairField;


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

