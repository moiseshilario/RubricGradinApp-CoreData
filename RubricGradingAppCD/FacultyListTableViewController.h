//
//  FacultyListTableViewController.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 12/2/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol FacultyListTableViewControllerDelegate;


@interface FacultyListTableViewController : UITableViewController

@property (nonatomic) NSMutableArray *allProfessorsArray;
@property (nonatomic) NSMutableArray *selectedProfessors;
@property (nonatomic, weak) id <FacultyListTableViewControllerDelegate> delegate;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end


@protocol FacultyListTableViewControllerDelegate <NSObject>

-(void)facultyListDidCancel;
-(void)facultyListDidDone: (NSMutableArray*) selectedProfessors;

@end