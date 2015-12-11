//
//  AppDelegate.m
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "AppDelegate.h"
#import "Professor.h"
#import "Student.h"
#import "Admin.h"
#import "LoginViewController.h"
#import "StudentsListTableViewController.h"
#import "Project.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    UINavigationController *navigationController = (UINavigationController *)self.window.rootViewController;
    LoginViewController *controller = (LoginViewController *)navigationController.topViewController;
    controller.managedObjectContext = self.managedObjectContext;
    
    NSString* documentsPath = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSString* dataFile = [documentsPath stringByAppendingPathComponent:@"RubricGradingAppCD.sqlite"];
    if(![[NSFileManager defaultManager] fileExistsAtPath:dataFile]){
        [self initObjects];

    }
    
    
    // Override point for customization after application launch.
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}

#pragma mark - Core Data stack

@synthesize managedObjectContext = _managedObjectContext;
@synthesize managedObjectModel = _managedObjectModel;
@synthesize persistentStoreCoordinator = _persistentStoreCoordinator;

- (NSURL *)applicationDocumentsDirectory {
    // The directory the application uses to store the Core Data store file. This code uses a directory named "iosProject.RubricGradingAppCD" in the application's documents directory.
    NSLog(@"PATH: ========= %@", [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject]);

    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}

- (NSManagedObjectModel *)managedObjectModel {
    // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
    if (_managedObjectModel != nil) {
        return _managedObjectModel;
    }
    NSURL *modelURL = [[NSBundle mainBundle] URLForResource:@"RubricGradingAppCD" withExtension:@"momd"];
    _managedObjectModel = [[NSManagedObjectModel alloc] initWithContentsOfURL:modelURL];
    return _managedObjectModel;
}

- (NSPersistentStoreCoordinator *)persistentStoreCoordinator {
    // The persistent store coordinator for the application. This implementation creates and returns a coordinator, having added the store for the application to it.
    if (_persistentStoreCoordinator != nil) {
        return _persistentStoreCoordinator;
    }
    
    // Create the coordinator and store
    
    _persistentStoreCoordinator = [[NSPersistentStoreCoordinator alloc] initWithManagedObjectModel:[self managedObjectModel]];
    NSURL *storeURL = [[self applicationDocumentsDirectory] URLByAppendingPathComponent:@"RubricGradingAppCD.sqlite"];
    NSError *error = nil;
    NSString *failureReason = @"There was an error creating or loading the application's saved data.";
    if (![_persistentStoreCoordinator addPersistentStoreWithType:NSSQLiteStoreType configuration:nil URL:storeURL options:nil error:&error]) {
        // Report any error we got.
        NSMutableDictionary *dict = [NSMutableDictionary dictionary];
        dict[NSLocalizedDescriptionKey] = @"Failed to initialize the application's saved data";
        dict[NSLocalizedFailureReasonErrorKey] = failureReason;
        dict[NSUnderlyingErrorKey] = error;
        error = [NSError errorWithDomain:@"YOUR_ERROR_DOMAIN" code:9999 userInfo:dict];
        // Replace this with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
    
    return _persistentStoreCoordinator;
}


- (NSManagedObjectContext *)managedObjectContext {
    // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.)
    if (_managedObjectContext != nil) {
        return _managedObjectContext;
    }
    
    NSPersistentStoreCoordinator *coordinator = [self persistentStoreCoordinator];
    if (!coordinator) {
        return nil;
    }
    _managedObjectContext = [[NSManagedObjectContext alloc] initWithConcurrencyType:NSMainQueueConcurrencyType];
    [_managedObjectContext setPersistentStoreCoordinator:coordinator];
    return _managedObjectContext;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *managedObjectContext = self.managedObjectContext;
    if (managedObjectContext != nil) {
        NSError *error = nil;
        if ([managedObjectContext hasChanges] && ![managedObjectContext save:&error]) {
            // Replace this implementation with code to handle the error appropriately.
            // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
            abort();
        }
    }
}



-(void)initObjects {
    NSManagedObjectContext *context = [self managedObjectContext];
    
    //INITIALIZING STUDENTS
    Student *s1 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:context];
    s1.name = @"Moises";
    s1.username = @"moises001";
    s1.password = @"passwordMoises";
    s1.type = @"student";
    
    Student *s2 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s2.name = @"Joao";
    s2.username = @"joao001";
    s2.password = @"passwordJoao";
    s2.type = @"student";
    
    Student *s3 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s3.name = @"John";
    s3.username = @"abishek001";
    s3.password = @"passwordAbishek";
    s3.type = @"student";
    
    Student *s4 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s4.name = @"James";
    s4.username = @"james001";
    s4.password = @"passwordJames";
    s4.type = @"student";
    
    Student *s5 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s5.name = @"Elza";
    s5.username = @"elza001";
    s5.password = @"passwordElza";
    s5.type = @"student";
    
    Student *s6 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s6.name = @"Maria";
    s6.username = @"maria001";
    s6.password = @"passwordMaria";
    s6.type = @"student";
    
    Student *s7 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s7.name = @"Emily";
    s7.username = @"abishek001";
    s7.password = @"passwordEmily";
    s7.type = @"student";
    
    Student *s8 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s8.name = @"Paul";
    s8.username = @"paul001";
    s8.password = @"passwordPaul";
    s8.type = @"student";
    
    Student *s9 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s9.name = @"Swain";
    s9.username = @"swain001";
    s9.password = @"passwordSwain";
    s9.type = @"student";
    
    Student *s10 = [NSEntityDescription
                   insertNewObjectForEntityForName:@"Student"
                   inManagedObjectContext:[self managedObjectContext]];
    s10.name = @"Drake";
    s10.username = @"drake001";
    s10.password = @"passwordDrake";
    s10.type = @"student";
    
     //INITIALIZING ADMIN
    Admin *a1 = [NSEntityDescription
                 insertNewObjectForEntityForName:@"Admin"
                 inManagedObjectContext:context];
    a1.name = @"Admin";
    a1.username = @"admin";
    a1.password = @"admin";
    a1.type = @"admin";
    
    //INITIALIZING PROFESSORS
    
    Professor *p1 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:context];
    p1.name = @"Dr. Sasi";
    p1.username = @"sasi001";
    p1.password = @"passwordSasi";
    p1.type = @"professor";
    
    Professor *p2 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:[self managedObjectContext]];
    p2.name = @"Dr. Frezza";
    p2.username = @"frezza001";
    p2.password = @"passwordFreza";
    p2.type = @"professor";
    
    Professor *p3 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:[self managedObjectContext]];
    p3.name = @"Dr. Vitolo";
    p3.username = @"vitolo001";
    p3.password = @"passwordVitolo";
    p3.type = @"professor";
    
    Professor *p4 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:[self managedObjectContext]];
    p4.name = @"Dr. Brinkman";
    p4.username = @"brinkman001";
    p4.password = @"passwordBrinkman";
    p4.type = @"professor";
    
    Professor *p5 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:[self managedObjectContext]];
    p5.name = @"Mr. Cannell";
    p5.username = @"cannell001";
    p5.password = @"passwordCannell";
    p5.type = @"professor";
    
    Professor *p6 = [NSEntityDescription
                     insertNewObjectForEntityForName:@"Professor"
                     inManagedObjectContext:[self managedObjectContext]];
    p6.name = @"Dr. Tang";
    p6.username = @"tang001";
    p6.password = @"passwordTang";
    p6.type = @"professor";
    
   //INITIALIZING A PROJECT
    Project *p = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    p.name = @"Project 1";
    [p addStudentObject:s1];
    [p addStudentObject:s2];
    [p addProfessorFacultyObject:p1];
    [p addProfessorFacultyObject:p2];
    p.professorChair = p3;
    p.briefDescription = @"An app to grade the students";
    p.admin = a1;
    
    Project *project2 = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    project2.name = @"Project 2";
    [project2 addStudentObject:s1];
    [project2 addStudentObject:s2];
    [project2 addProfessorFacultyObject:p1];
    [project2 addProfessorFacultyObject:p2];
    project2.professorChair = p3;
    project2.briefDescription = @"An app to grade the students";
    project2.admin = a1;

    
    Project *project3 = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    project3.name = @"Project 3";
    [project3 addStudentObject:s1];
    [project3 addStudentObject:s2];
    [project3 addProfessorFacultyObject:p1];
    [project3 addProfessorFacultyObject:p2];
    project3.professorChair = p3;
    project3.briefDescription = @"An app to grade the students";
    project3.admin = a1;
    
    Project *project4 = [NSEntityDescription insertNewObjectForEntityForName:@"Project" inManagedObjectContext:context];
    project4.name = @"Rubric Grading App Project";
    [project4 addStudentObject:s1];
    [project4 addStudentObject:s2];
    [project4 addProfessorFacultyObject:p1];
    [project4 addProfessorFacultyObject:p2];
    project4.professorChair = p3;
    project4.briefDescription = @"An app to grade the students";
    project4.admin = a1;


    

    NSError *error;
    if (![context save:&error]) {
        NSLog(@"Error initing objects! Couldn't save: %@", [error localizedDescription]);
    }
    
    
}

@end
