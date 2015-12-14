//
//  LoginViewController.m
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "LoginViewController.h"
#import "Person.h"
#import "AppDelegate.h"
#import "AdminTableViewController.h"


@interface LoginViewController ()

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

-(BOOL)verifyUsername: (NSString *)userName withPassword: (NSString*)password {
    
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Admin" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username == %@", userName];
    [fetchRequest setPredicate:predicate];
    
    NSError *error = nil;
    NSArray *fetchedObjects = [[self managedObjectContext] executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        return NO;
    }
    else {
        for (Person *p in fetchedObjects) {
            if([p.username isEqualToString:userName] && [p.password isEqualToString:password]){
                return YES;
            }
            else {
                return NO;
            }
        }
    }
    return NO;
}


- (IBAction)loginPressed:(id)sender {
    if([self verifyUsername:self.usernameField.text withPassword:self.passwordField.text]){
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Correct"                                                                       message:@"Welcome" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            [self performSegueWithIdentifier:@"adminProjects" sender:self];
        }];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
        
    }
    else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Incorrect"                                                                       message:@"The password or username you entered is incorrect. Please try again." preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
        
        [alert addAction:defaultAction];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if([segue.identifier isEqualToString:@"adminProjects"]){
        UINavigationController *navigation = (UINavigationController *)[segue destinationViewController];
        AdminTableViewController *atvc = (AdminTableViewController*)[navigation topViewController];
        atvc.managedObjectContext = self.managedObjectContext;
    }
}

@end


/*
 UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"Incorrect"                                                                       message:@"The username you entered is incorrect. Please try again." preferredStyle:UIAlertControllerStyleAlert];
 
 UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"Try again" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {}];
 
 [alert addAction:defaultAction];
 [self presentViewController:alert animated:YES completion:nil];
 */
