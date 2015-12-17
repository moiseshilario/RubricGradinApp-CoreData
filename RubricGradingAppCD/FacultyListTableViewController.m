//
//  FacultyListTableViewController.m
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 12/2/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "FacultyTableViewController.h"
#import "Student.h"
#import "Project.h"
#import "LoginViewController.h"
#import "RubricViewController.h"

@interface FacultyTableViewController ()

@property (nonatomic) NSString *facultyName;
@property (nonatomic) Project *selectedProject;
-(void)getSelectedProfessor;
@end

@implementation FacultyTableViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    NSLog(@"the faculty name is:  %@",self.facultyUserName);
    
    [self getSelectedProfessor];
    
    
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
    
    return [[self.selectedProfessor.projectFaculty allObjects]count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"FacultyCell" forIndexPath:indexPath];
    self.facultyProjects = [self.selectedProfessor.projectFaculty allObjects];
    
    
    // Configure the cell...
    Project *proj = [self.facultyProjects objectAtIndex:indexPath.row];
    cell.textLabel.text = proj.name;
    cell.detailTextLabel.text = [proj.grade stringValue];
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexPath *selectedIndexPath = [tableView indexPathForSelectedRow];
    self.selectedProject = [self.facultyProjects objectAtIndex:selectedIndexPath.row];
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


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    
    RubricViewController *rvc = (RubricViewController *) [segue destinationViewController];
    
    Project *p = self.selectedProject;
    rvc.currentProject = p;
    
    
}


-(void)getSelectedProfessor{
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    NSEntityDescription *entity = [NSEntityDescription entityForName:@"Professor" inManagedObjectContext:self.managedObjectContext];
    [fetchRequest setEntity:entity];
    // Specify criteria for filtering which objects to fetch
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"username == %@", self.facultyUserName];
    [fetchRequest setPredicate:predicate];
    // Specify how the fetched objects should be sorted
    
    
    NSError *error = nil;
    NSArray *fetchedObjects = [self.managedObjectContext executeFetchRequest:fetchRequest error:&error];
    if (fetchedObjects == nil) {
        NSLog(@"error");
    }
    else {
        self.selectedProfessor = [fetchedObjects objectAtIndex:0];
    }
    
}

#pragma mark - Rubric Delegate

-(void)rubricViewControllerDidSubmit{
    NSError *error = nil;
    if (![self.managedObjectContext save:&error]) {
        NSLog(@"Error saving data");
    }
}

@end

