//
//  AddProjectViewController.m
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "AddProjectViewController.h"
#import "Student.h"
#import "Professor.h"

@interface AddProjectViewController ()

@end

@implementation AddProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.studentTableView.delegate = self;
    self.studentTableView.dataSource = self;
    
    self.facultyTableView.delegate = self;
    self.facultyTableView.dataSource = self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancel:(id)sender {
}

- (IBAction)save:(id)sender {
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
        studentsList.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"addFaculty"]){
        
        UINavigationController *navigation = (UINavigationController*) [segue destinationViewController];
        
        FacultyListTableViewController *facultyList = (FacultyListTableViewController*) [navigation topViewController];
        facultyList.allProfessorsArray = self.allProfessorsArray;
        facultyList.delegate = self;
    }
}

#pragma mark - Faculty Table View
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    
    if(tableView == self.facultyTableView){
        Professor *p = [self.facultyArray objectAtIndex:indexPath.row];
        cell.textLabel.text = p.name;
    }
    else {
        Student *s = [self.studentsArray objectAtIndex:indexPath.row];
        cell.textLabel.text = s.name;
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

#pragma mark - Delegate functions

-(void)studentsListDidCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)studentsListDidDone:selectedStudents{
    self.studentsArray = selectedStudents;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.studentTableView reloadData];
}

-(void)facultyListDidCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)facultyListDidDone:(NSMutableArray *)selectedProfessors {
    self.facultyArray = selectedProfessors;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.facultyTableView reloadData];
}

@end
