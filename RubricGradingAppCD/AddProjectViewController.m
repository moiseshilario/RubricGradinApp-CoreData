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
@property (nonatomic) NSMutableArray *professorNames;
@end

@implementation AddProjectViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self fillProfessorNamesArray];
    
    self.projectNameField.text = self.currentProject.name;
    self.briefDescriptionField.text = self.currentProject.briefDescription;
    
    NSMutableArray *array = [NSMutableArray arrayWithArray:[self.currentProject.professorFaculty allObjects]];
    self.facultyArray = array;
    array = [NSMutableArray arrayWithArray:[self.currentProject.student allObjects]];
    self.studentsArray = array;
    self.selectedChair = self.currentProject.professorChair;
    

    
    
    self.studentTableView.delegate = self;
    self.studentTableView.dataSource = self;
    
    self.facultyTableView.delegate = self;
    self.facultyTableView.dataSource = self;
    
    
    self.chairPicker.delegate = self;
    self.chairPicker.dataSource = self;
    self.chairPicker.showsSelectionIndicator = YES;
    
    if([self.typeOfSegue isEqualToString:@"edit"]){
        NSLog(@"NAMES IN THE ARRAY: %@", self.professorNames);
        NSLog(@"NAME of the professor: %@", self.currentProject.professorChair.name);
    
    NSInteger index = [self.professorNames indexOfObject:self.currentProject.professorChair.name];
    [self.chairPicker reloadAllComponents];
        if (self.currentProject.professorChair == NULL) {
            index = 0;
        }
    [self.chairPicker selectRow:index inComponent:0 animated:YES];
    }

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)cancel:(id)sender {
    [self.delegate addProjectControllerDidCancel:self.currentProject type:self.typeOfSegue];
}

- (IBAction)save:(id)sender {
    [self.currentProject setName:self.projectNameField.text];
    [self.currentProject setBriefDescription:self.briefDescriptionField.text];
    NSSet *set = [[NSSet alloc] initWithArray:self.facultyArray];
    [self.currentProject setProfessorFaculty:set];
    set = [[NSSet alloc] initWithArray:self.studentsArray];
    [self.currentProject setStudent:set];
    [self.currentProject setProfessorChair:self.selectedChair];
    NSLog(@"SELECTED CHAIR: %@", self.selectedChair.name);
    
    [self.delegate addProjectControllerDidSave];
    
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
        studentsList.selectedRows = self.studentsSelectedRows;
        studentsList.delegate = self;
    }
    else if([segue.identifier isEqualToString:@"addFaculty"]){
        
        UINavigationController *navigation = (UINavigationController*) [segue destinationViewController];
        
        FacultyListTableViewController *facultyList = (FacultyListTableViewController*) [navigation topViewController];
        facultyList.allProfessorsArray = self.allProfessorsArray;
        facultyList.selectedRows = self.facultySelectedRows;
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

#pragma mark - Student List Delegate functions

-(void)studentsListDidCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)studentsListDidDone:selectedStudents inSelectedRows:(NSMutableArray *)selectedRows{
    self.studentsArray = selectedStudents;
    self.studentsSelectedRows = selectedRows;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.studentTableView reloadData];
}

#pragma mark - Faculty List Delegate functions

-(void)facultyListDidCancel{
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)facultyListDidDone:(NSMutableArray *)selectedProfessors inSelectedRows: (NSMutableArray*)selectedRows {
    self.facultyArray = selectedProfessors;
    self.facultySelectedRows = selectedRows;
    [self dismissViewControllerAnimated:YES completion:nil];
    [self.facultyTableView reloadData];
}

#pragma mark -  PickerView Delegate functions
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.allProfessorsArray count];
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    Professor *prof = [self.allProfessorsArray objectAtIndex: row];
    return prof.name;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [self.allProfessorsArray objectAtIndex: row]);
    self.selectedChair = [self.allProfessorsArray objectAtIndex: row];
}

-(void)fillProfessorNamesArray {
    self.professorNames = [[NSMutableArray alloc]init];
    for (Professor *p in self.allProfessorsArray) {
        [self.professorNames addObject:p.name];
            }
    NSLog(@"PRINT ---- %@", self.professorNames);

}


@end
