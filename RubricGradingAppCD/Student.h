//
//  Student.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "Person.h"
@class Project;

@interface Student : Person

@property (nonatomic, retain) NSNumber *grade;
@property (nonatomic, retain) Project *project;

@end
