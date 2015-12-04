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
    if (pickerView == self.pickerOverallProduct) {
        return 1;
    }
    if (pickerView == self.pickerContentAnalysis) {
        return 1;
    }
    if (pickerView == self.pickerDepthAnalysis) {
        return 1;
    }
    if (pickerView == self.pickerDepthContent) {
        return 1;
    }
    if (pickerView == self.pickerQuality) {
        return 1;
    }
    if (pickerView == self.peckerWrintingPro) {
        return 1;
    }
    
    return 0;

}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    // As we have just one to five grading scale
    if (pickerView == self.pickerOverallProduct) {
        return 5;
    }
    if (pickerView == self.pickerContentAnalysis) {
        return 5;
    }
    if (pickerView == self.pickerDepthAnalysis) {
        return 5;
    }
    if (pickerView == self.pickerDepthContent) {
        return 5;
    }
    if (pickerView == self.pickerQuality) {
        return 5;
    }
    if (pickerView == self.peckerWrintingPro) {
        return 5;
    }
    return 0;
}
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if (pickerView == self.pickerOverallProduct) {
        return self.gradingScale[row];
    }
    if (pickerView == self.pickerContentAnalysis) {
        return self.gradingScale[row];
    }
    if (pickerView == self.pickerDepthAnalysis) {
        return self.gradingScale[row];
    }
    if (pickerView == self.pickerDepthContent) {
        return self.gradingScale[row];
    }
    if (pickerView == self.pickerQuality) {
        return self.gradingScale[row];
    }
    if (pickerView == self.peckerWrintingPro) {
        return self.gradingScale[row];
    }
    return 0;
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    double p1;
    double p2;
    double p3;
    double p4;
    double p5;
    double p6;
    double sum;
    if (pickerView == self.pickerOverallProduct) {
        
        // As in the Rubric the firt criteria has wight 0.05 therefore we multiply the point gaving in 0.25
        
       switch (row) {
           case 0:
               p1 = 5 * 0.25;
             break;
           case 1:
               p1 = 4 * 0.25;
               break;
           case 2:
               p1 = 3 * 0.25;
               break;
           case 3:
               p1 = 2 * 0.25;
               break;
           case 4:
               p1 = 1 * 0.25;
               break;
            
          default:
              break;
    }
    }
        if (pickerView == self.pickerContentAnalysis) {
            // this has weigh 0.05
            
            switch (row) {
                case 0:
                    p2 = 5 * 0.05;
                    break;
                case 1:
                    p2 = 4 * 0.05;
                    break;
                case 2:
                    p2 = 3 * 0.05;
                    break;
                case 3:
                    p2 = 2 * 0.05;
                    break;
                case 4:
                    p2 = 1 * 0.05;
                    break;
                    
                default:
                    break;
            }
    }
    if (pickerView == self.pickerDepthAnalysis) {
        // this has weigh 0.20
        
        switch (row) {
            case 0:
                p3 = 5 * 0.20;
                break;
            case 1:
                p3 = 4 * 0.20;
                break;
            case 2:
                p3 = 3 * 0.20;
                break;
            case 3:
                p3 = 2 * 0.20;
                break;
            case 4:
                p3 = 1 * 0.20;
                break;
                
            default:
                break;
        }
    }
    if (pickerView == self.pickerDepthContent) {
        // this has weigh 0.20
        
        switch (row) {
            case 0:
                p4 = 5 * 0.20;
                break;
            case 1:
                p4 = 4 * 0.20;
                break;
            case 2:
                p4 = 3 * 0.20;
                break;
            case 3:
                p4 = 2 * 0.20;
                break;
            case 4:
                p4 = 1 * 0.20;
                break;
                
            default:
                break;
        }
    }
    if (pickerView == self.pickerQuality) {
        // this has weigh 0.15
        
        switch (row) {
            case 0:
                p5 = 5 * 0.15;
                break;
            case 1:
                p5 = 4 * 0.15;
                break;
            case 2:
                p5 = 3 * 0.15;
                break;
            case 3:
                p5 = 2 * 0.15;
                break;
            case 4:
                p5 = 1 * 0.15;
                break;
                
            default:
                break;
        }
    }
    if (pickerView == self.peckerWrintingPro) {
        // this has weigh 0.15
        
        switch (row) {
            case 0:
                p6 = 5 * 0.15;
                break;
            case 1:
                p6 = 4 * 0.15;
                break;
            case 2:
                p6 = 3 * 0.15;
                break;
            case 3:
                p6 = 2 * 0.15;
                break;
            case 4:
                p6 = 1 * 0.15;
                break;
                
            default:
                break;
        }
    }
           // Here the sum of the grading
    sum = p1+p2+p3+p4+p5+p6;
           // to convert the sumation to percentage
    sum = (sum / 5) * 100;
    
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
