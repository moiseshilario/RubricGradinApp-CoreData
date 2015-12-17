//
//  RubricViewController.h
//  RubricGradingAppCD
//
//  Created by Hassan on 12/1/15.
//  Copyright © 2015 iosProject. All rights reserved.
//


#import <UIKit/UIKit.h>
#import "Project.h"

@protocol RubricViewControllerDelegate;


@interface RubricViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>

@property (nonatomic) double p1;
@property (nonatomic) double p2;
@property (nonatomic) double p3;
@property (nonatomic) double p4;
@property (nonatomic) double p5;
@property (nonatomic) double p6;
@property (nonatomic) double sum;

@property NSString *stringSum;
@property (nonatomic) NSString *writingGrade;
@property (nonatomic) id <RubricViewControllerDelegate> delegate;
@property (nonatomic) Project *currentProject;
-(NSString *)calc;
@end

@protocol RubricViewControllerDelegate <NSObject>

- (void)rubricViewControllerDidSubmit;


@end

