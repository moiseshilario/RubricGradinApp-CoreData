//
//  RubricGradingAppCDTests.m
//  RubricGradingAppCDTests
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//


#import <XCTest/XCTest.h>
#import <CoreData/CoreData.h>
#import "Student.h"
#import "Professor.h"
#import "Project.h"
#import "AppDelegate.h"
#import "AddProjectViewController.h"
#import "AdminTableViewController.h"
#import "LoginViewController.h"
#import "StudentsListTableViewController.h"
#import "FacultyListTableViewController.h"
#import "RubricViewController.h"
#import "FacultyTableViewController.h"

@interface RubricGradingAppCDTests : XCTestCase{
    
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    
    AppDelegate *appDelegate;
    AddProjectViewController *addProjectVC;
    AdminTableViewController *adminTVC;
    LoginViewController *loginVC;
    StudentsListTableViewController *studentListTVC;
    FacultyListTableViewController *facultyListTVC;
    RubricViewController *rubricTVC;
    FacultyTableViewController *facultyTVC;

}

@end

@implementation RubricGradingAppCDTests

- (void)setUp {
    [super setUp];
    
    appDelegate = [[UIApplication sharedApplication] delegate];
    UIStoryboard *storyBoard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    
    
    loginVC = [storyBoard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    
    adminTVC = [storyBoard instantiateViewControllerWithIdentifier:@"AdminTableViewController"];
    
    studentListTVC = [storyBoard instantiateViewControllerWithIdentifier:@"StudentsListTableViewController"];
    
    facultyListTVC = [storyBoard instantiateViewControllerWithIdentifier:@"FacultyListTableViewController"];
    
    addProjectVC = [storyBoard instantiateViewControllerWithIdentifier:@"AddProjectViewController"];
    
    rubricTVC = [storyBoard instantiateViewControllerWithIdentifier:@"RubricViewController"];
    facultyTVC = [storyBoard instantiateViewControllerWithIdentifier:@"FacultyTableViewController"];
    
    
    if(!managedObjectModel)
    {
        NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RubricGradingAppCD" withExtension:@"momd"];
        
        managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    }
    if(!persistentStoreCoordinator)
    {
        
        NSURL *storeURL = [[[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject] URLByAppendingPathComponent:@"RubricGradingAppCD.sqlite"];
        NSError *error = nil;
        persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:managedObjectModel];
        if (![persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
            
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }

    
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}
- (void)testCalc {
    
    rubricTVC.p1 = 5 * 0.25;
    rubricTVC.p2 = 5 * 0.15;
    rubricTVC.p3 = 5 * 0.05;
    rubricTVC.p4 = 5 * 0.20;
    rubricTVC.p5 = 5 * 0.20;
    rubricTVC.p6 = 5 * 0.15;
    
    
    
    XCTAssertTrue([[rubricTVC calc ] isEqualToString:@"100"], @"");
    
}
- (void) testFacultyListTableView {
        UIView *Facult;
    Facult = facultyTVC.view;
    
    XCTAssertNotNil(Facult, @"Cannot find FacultyListTableView instance");
    
}




@end
