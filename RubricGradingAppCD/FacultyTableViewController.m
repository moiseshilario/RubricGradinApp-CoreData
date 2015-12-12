//
//  FacultyTableViewController.m
//  RubricGradingAppCD
//
//  Created by Hassan on 12/1/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "FacultyTableViewController.h"
#import "Student.h"
#import "Project.h"
#import "LoginViewController.h"

@interface FacultyTableViewController ()

@property (nonatomic) NSString *facultyName;

@end

@implementation FacultyTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"the faculty name is:  %@",self.facultyUserName);
    
    if ([self.facultyUserName isEqualToString:@"sasi001"]) {
        self.facultyName = @"Dr. Sasi";
    }
    
    
  NSError *error = nil;
    if (![self.fetchedResultsController performFetch:&error]) {
        NSLog(@"Unresolved error %@, %@", error, [error userInfo]);
        abort();
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return [[self.fetchedResultsController fetchedObjects]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FacultyCell" forIndexPath:indexPath];
    
    // Configure the cell...
    Project *proj = [self.fetchedResultsController objectAtIndexPath:indexPath];
    cell.textLabel.text = proj.name;
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSFetchedResultsController *)fetchedResultsController{
    if (_fetchedResultsController != nil) {
        return _fetchedResultsController;
    }
    
      NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    NSEntityDescription *entity = [NSEntityDescription
                                   entityForName:@"Project"
                                   inManagedObjectContext:self.managedObjectContext];

     [fetchRequest setEntity:entity];
    
// Specify criteria for filtering which objects to fetch
    
    
//NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username == %@",self.facultyName];
//[fetchRequest setPredicate:predicate];
    
    
    
// Specify how the fetched objects should be sorted

    

    NSSortDescriptor *sortDescriptor = [[NSSortDescriptor alloc] initWithKey:@"name" ascending:YES];
    NSArray *sortDescriptors = @[sortDescriptor];
    [fetchRequest setSortDescriptors:sortDescriptors];
    
    _fetchedResultsController = [[NSFetchedResultsController alloc]
                                 initWithFetchRequest:fetchRequest
                                 managedObjectContext:self.managedObjectContext sectionNameKeyPath:nil cacheName:nil];
    return _fetchedResultsController;
}

@end
