//
//  Admin.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "Person.h"
@class Project;

@interface Admin : Person

@property (nonatomic, retain) NSSet<Project *> *project;

@end

@interface Admin (CoreDataGeneratedAccessors)

- (void)addProjectObject:(Project *)value;
- (void)removeProjectObject:(Project *)value;
- (void)addProject:(NSSet<Project *> *)values;
- (void)removeProject:(NSSet<Project *> *)values;

@end

