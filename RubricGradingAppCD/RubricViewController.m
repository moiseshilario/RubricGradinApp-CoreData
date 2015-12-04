//
//  RubricViewController.m
//  RubricGradingAppCD
//
//  Created by Hassan on 12/1/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "RubricViewController.h"

@interface RubricViewController ()
@property (weak, nonatomic) IBOutlet UIPickerView *pickerOverallProduct;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerContentAnalysis;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDepthAnalysis;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDepthContent;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerQuality;
@property (weak, nonatomic) IBOutlet UIPickerView *peckerWrintingPro;
@property NSArray *gradingScale;

@end

@implementation RubricViewController

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    // As we have just one to five grading scale 13
    return 5;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    return self.gradingScale[row];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.gradingScale = @[@"Sophisticated(5)",@"Competent(4)",@"Competent(3)",@"Not Competent(2)",@"Not Competent(1)"];
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

@end
