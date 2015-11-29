//
//  Professor.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/23/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "Person.h"
@class Project;

@interface Professor : Person

@property (nonatomic, retain) Project *projectChair;
@property (nonatomic, retain) NSSet<Project *> *projectFaculty;

@end

@interface Professor (CoreDataGeneratedAccessors)

- (void)addProjectFacultyObject:(Project *)value;
- (void)removeProjectFacultyObject:(Project *)value;
- (void)addProjectFaculty:(NSSet<Project *> *)values;
- (void)removeProjectFaculty:(NSSet<Project *> *)values;


@end
