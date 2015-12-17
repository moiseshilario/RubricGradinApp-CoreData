//
//  AppData.m
//  RubricGradingAppCD
//
//  Created by Gharat, Prajakta B on 12/13/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "AppData.h"
#import "Professor.h"
#import "Student.h"
#import "Admin.h"
#import "Project.h"

@implementation AppData

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
