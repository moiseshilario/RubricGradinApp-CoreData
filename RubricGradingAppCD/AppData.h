//
//  AppData.h
//  RubricGradingAppCD
//
//  Created by Gharat, Prajakta B on 12/13/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppData : NSObject
@property (nonatomic)NSManagedObjectContext* managedObjectContext;
-(void)initObjects;


@end
