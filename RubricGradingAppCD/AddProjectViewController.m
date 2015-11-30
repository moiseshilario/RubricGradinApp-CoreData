//
//  AddProjectViewController.m
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "AddProjectViewController.h"
#import "StudentsListTableViewController.h"
#import "Professor.h"

@interface AddProjectViewController ()

@end

@implementation AddProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.projectNameField.text = self.currentProject.name;
    self.briefDescriptionField.text = self.currentProject.briefDescription;
    Professor *pc = self.currentProject.professorChair;
    self.chairField.text = pc.name;
    NSMutableArray *facultyArray = [NSMutableArray arrayWithArray:[self.currentProject.professorFaculty allObjects]];
    self.facultyArray = facultyArray;
    NSMutableArray *studentsArray = [NSMutableArray arrayWithArray:[self.currentProject.student allObjects]];
    self.facultyArray = facultyArray;
    self.studentsArray = studentsArray;
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if([segue.identifier isEqualToString:@"addStudents"]){
        
        UINavigationController *navigation = (UINavigationController*) [segue destinationViewController];
        
        StudentsListTableViewController *studentsList = (StudentsListTableViewController*) [navigation topViewController];
        studentsList.allStudentsArray = self.allStudentsArray;
    }
}

#pragma mark - Faculty Table View
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(tableView == self.facultyTableView){
        cell.textLabel.text = [self.facultyArray objectAtIndex:indexPath.row];
    }
    else {
        cell.textLabel.text = [self.studentsArray objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.facultyTableView) {
        return [self.facultyArray count];
        
    } else {
        return [self.studentsArray count];
        
    }
}



- (IBAction)cancel:(id)sender {
}

- (IBAction)save:(id)sender {
    
   
}
@end
