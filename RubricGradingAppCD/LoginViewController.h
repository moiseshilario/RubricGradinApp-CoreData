//
//  LoginViewController.h
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@interface LoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;

@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (strong, nonatomic) NSManagedObjectContext *managedObjectContext;

@property (nonatomic) Person *person;


- (IBAction)loginPressed:(id)sender;

@end
