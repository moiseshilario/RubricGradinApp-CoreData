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

@interface RubricGradingAppCDTests : XCTestCase {
    
    NSManagedObjectContext *managedObjectContext;
    NSManagedObjectModel *managedObjectModel;
    NSPersistentStoreCoordinator *persistentStoreCoordinator;
    
    AppDelegate *appDelegate;
    AddProjectViewController *addProjectVC;
    AdminTableViewController *adminTVC;
    LoginViewController *loginVC;
    StudentsListTableViewController *studentListTVC;
    FacultyListTableViewController *facultyListTVC;
    
    FacultyTableViewController *facultyTableTVC;
    RubricViewController *rubricTVC;
    
   
 
    
    
    
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
    if (persistentStoreCoordinator != nil) {
        managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
        [managedObjectContext setPersistentStoreCoordinator:persistentStoreCoordinator];
        
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



- (void)testCreateStudent {
    // Test Created by Moises Hilario
    // Test if a student is created and saved successfully in the dataBase
    
    
    Student *s1 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:managedObjectContext];
    s1.name = @"Student Test1";
    
    NSError *error;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
    NSString *studentName = @"Student Test1";
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Student" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", studentName];
    [fetchRequest setPredicate:predicate];
    
    
    error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Failed to fetch");
    }
    
    NSLog(@"Object is: %@", [fetchedObjects objectAtIndex:0]);
    
    
    XCTAssertNotNil(fetchedObjects);
}


- (void)testCreateProfessor {
    // Test Created by Moises Hilario
    // Test if a professor is created and saved successfully in the dataBase

    
    Professor *p1 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:managedObjectContext];
    p1.name = @"Professor Test2";
    
    NSError *error;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
    NSString *professorName = @"Professor Test2";
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Professor" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", professorName];
    [fetchRequest setPredicate:predicate];
    
    
    error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Failed to fetch");
    }
    
    NSLog(@"Object is: %@", [fetchedObjects objectAtIndex:0]);
    
    
    XCTAssertNotNil(fetchedObjects);
}


- (void)testCreateProject {
    // Test Created by Moises Hilario
    // Test if a professor is created and saved successfully in the dataBase

    
    Project *p = [NSEntityDescription
                  insertNewObjectForEntityForName:@"Project"
                  inManagedObjectContext:managedObjectContext];
    p.name = @"Project test";
    
    NSError *error;
    if (![managedObjectContext save:&error]) {
        NSLog(@"Failed to save - error: %@", [error localizedDescription]);
    }
    
    NSString *projectName = @"Project test";
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Project" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"name == %@", projectName];
    [fetchRequest setPredicate:predicate];
    
    
    error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Failed to fetch");
    }
    
    NSLog(@"Object is: %@", [fetchedObjects objectAtIndex:0]);
    
    
    XCTAssertNotNil(fetchedObjects);
}


-(void) testVerifyCorrectPerson{
    // Test Created by Moises Hilario
    // Test if the app verify and accept the login of a registered person

    loginVC.managedObjectContext = managedObjectContext;
    
    XCTAssertTrue([loginVC verifyUsername:@"admin" withPassword:@"admin"]);
    
}

-(void) testVerifyIncorrectPerson{
    // Test Created by Moises Hilario
    // Test if the app verify and rejects the login of a unregistered person
    loginVC.managedObjectContext = managedObjectContext;
    
    XCTAssertFalse([loginVC verifyUsername:@"incorret" withPassword:@"admin"]);
    
}

-(void) testGetAllProfessor {
    // Test Created by Moises Hilario
    // Test if the app is returning the exact number of professors registered in the database
    adminTVC.managedObjectContext = managedObjectContext;
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Professor" inManagedObjectContext:managedObjectContext];
    [fetchRequest setEntity:entity];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"Error fetching objects");
    }
    
    XCTAssertEqual([fetchedObjects count], [[adminTVC allProfessors]count]);
}

- (void) testLoginView {
    // Test Created by Moises Hilario
    // Test if the the login View exists.
    UIView *loginView;
    loginView = loginVC.view;
    
    XCTAssertNotNil(loginView, @"Cannot find LoginView instance");
}

- (void) testAddProjectView {
    // Test Created by Moises Hilario
    // Test if the the addProject View exists.
    UIView *addProjectView;
    addProjectView = addProjectVC.view;
    
    XCTAssertNotNil(addProjectView, @"Cannot find AddProjectView instance");
    
}

- (void) testStudentListTableView {
    // Test Created by Moises Hilario
    // Test if the the StudentListTable View exists.
    UIView *studentsListView;
    studentsListView = studentListTVC.view;
    
    XCTAssertNotNil(studentsListView, @"Cannot find StudentListTableView instance");
    
}

- (void) testFacultyListTableView {
    // Test Created by Moises Hilario
    // Test if the the facultyTable view exists.
    UIView *facultyListView;
    facultyListView = facultyListTVC.view;
    
    XCTAssertNotNil(facultyListView, @"Cannot find FacultyListTableView instance");
    
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







@end
