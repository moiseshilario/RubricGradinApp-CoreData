//
//  Project.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//


@class Student, Professor, Admin;

@interface Project : NSManagedObject

@property (nonatomic, retain) NSString *name;
@property (nonatomic, retain) NSNumber *grade;
@property (nonatomic, retain) NSString *briefDescription;
@property (nonatomic, retain) NSSet<Student *> *student;
@property (nonatomic, retain) Professor *professorChair;
@property (nonatomic, retain) NSSet<Professor *> *professorFaculty;
@property (nonatomic, retain) Admin *admin;

@end


@interface Project (CoreDataGeneratedAccessors)

- (void)addStudentObject:(Student *)value;
- (void)removeStudentObject:(Student *)value;
- (void)addStudent:(NSSet<Student *> *)values;
- (void)removeStudent:(NSSet<Student *> *)values;

- (void)addProfessorFacultyObject:(Professor *)value;
- (void)removeProfessorFacultyObject:(Professor *)value;
- (void)addProfessorFaculty:(NSSet<Professor *> *)values;
- (void)removeProfessorFaculty:(NSSet<Professor *> *)values;

@end

