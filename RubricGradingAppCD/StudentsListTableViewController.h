//
//  StudentsListTableViewController.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/23/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol StudentsListTableViewControllerDelegate;


@interface StudentsListTableViewController : UITableViewController


@property (nonatomic) NSMutableArray *allStudentsArray;
@property (nonatomic) NSMutableArray *selectedStudents;
@property (nonatomic, weak) id <StudentsListTableViewControllerDelegate> delegate;
- (IBAction)cancel:(id)sender;
- (IBAction)done:(id)sender;

@end


@protocol StudentsListTableViewControllerDelegate <NSObject>

-(void)studentsListDidCancel;
-(void)studentsListDidDone: (NSMutableArray*) selectedStudents;

@end