//
//  RubricViewController.h
//  RubricGradingAppCD
//
//  Created by Hassan on 12/1/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>

//@protocol RubricViewControllerDelegate;





@interface RubricViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDelegate>
@property NSString *stringSum;
@property (nonatomic) NSString *writingGrade;
//@property (nonatomic) id <RubricViewControllerDelegate> delegate;
@end

