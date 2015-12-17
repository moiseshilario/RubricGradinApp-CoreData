





#import "RubricViewController.h"

@interface RubricViewController ()

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOverallProduct;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerContentAnalysis;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDepthAnalysis;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerDepthContent;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerQuality;
@property (weak, nonatomic) IBOutlet UIPickerView *peckerWrintingPro;
@property NSArray *gradingScale;

@property (weak, nonatomic) IBOutlet UILabel *totalGrading;

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
    // As we have just select diraction and one to five grading scale
    if (pickerView == self.pickerOverallProduct) {
        return 6;
    }
    if (pickerView == self.pickerContentAnalysis) {
        return 6;
    }
    if (pickerView == self.pickerDepthAnalysis) {
        return 6;
    }
    if (pickerView == self.pickerDepthContent) {
        return 6;
    }
    if (pickerView == self.pickerQuality) {
        return 6;
    }
    if (pickerView == self.peckerWrintingPro) {
        return 6;
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
    
    
    
    if (pickerView) {
        
        
        //    p1 = 5 * 0.25;
        //    p2 = 5 * 0.05;
        //    p3 = 5 * 0.20;
        //    p4 = 5 * 0.20;
        //    p5 = 5 * 0.15;
        //    p6 = 5 * 0.15;
        
        if (pickerView == self.pickerOverallProduct) {
            
            // As in the Rubric the firt criteria has wight 0.05 therefore we multiply the point gaving in 0.25
            
            switch (row) {
                case 1:
                    self.p1 = 0;
                    self.p1 = 5 * 0.25;
                    break;
                case 2:
                    self.p1 = 0;
                    self.p1 = 4 * 0.25;
                    break;
                case 3:
                    self.p1 = 0;
                    self.p1 = 3 * 0.25;
                    break;
                case 4:
                    self.p1 = 0;
                    self.p1 = 2 * 0.25;
                    break;
                case 5:
                    self.p1 = 0;
                    self.p1 = 1 * 0.25;
                    break;
                    
                default:
                    break;
            }
        }
        if (pickerView == self.pickerContentAnalysis) {
            // this has weigh 0.05
            
            switch (row) {
                case 1:
                    self.p2 = 0;
                    self.p2 = 5 * 0.05;
                    break;
                case 2:
                    self.p2 = 0;
                    self.p2 = 4 * 0.05;
                    break;
                case 3:
                    self.p2 = 0;
                    self.p2 = 3 * 0.05;
                    break;
                case 4:
                    self.p2 = 0;
                    self.p2 = 2 * 0.05;
                    break;
                case 5:
                    self.p2 = 0;
                    self.p2 = 1 * 0.05;
                    break;
                    
                default:
                    break;
            }
        }
        if (pickerView == self.pickerDepthAnalysis) {
            // this has weigh 0.20
            
            switch (row) {
                case 1:
                    self.p3 = 0;
                    self.p3 = 5 * 0.20;
                    break;
                case 2:
                    self.p3 = 0;
                    self.p3 = 4 * 0.20;
                    break;
                case 3:
                    self.p3 = 0;
                    self.p3 = 3 * 0.20;
                    break;
                case 4:
                    self.p3 = 0;
                    self.p3 = 2 * 0.20;
                    break;
                case 5:
                    self.p3 = 0;
                    self.p3 = 1 * 0.20;
                    break;
                    
                default:
                    break;
            }
        }
        if (pickerView == self.pickerDepthContent) {
            // this has weigh 0.20
            
            switch (row) {
                case 1:
                    self.p4 = 0;
                    self.p4 = 5 * 0.20;
                    break;
                case 2:
                    self.p4 = 0;
                    self.p4 = 4 * 0.20;
                    break;
                case 3:
                    self.p4 = 0;
                    self.p4 = 3 * 0.20;
                    break;
                case 4:
                    self.p4 = 0;
                    self.p4 = 2 * 0.20;
                    break;
                case 5:
                    self.p4 = 0;
                    self.p4 = 1 * 0.20;
                    break;
                    
                default:
                    break;
            }
        }
        if (pickerView == self.pickerQuality) {
            // this has weigh 0.15
            
            switch (row) {
                case 1:
                    self.p5 = 0;
                    self.p5 = 5 * 0.15;
                    break;
                case 2:
                    self.p5 = 0;
                    self.p5 = 4 * 0.15;
                    break;
                case 3:
                    self.p5 = 0;
                    self.p5 = 3 * 0.15;
                    break;
                case 4:
                    self.p5 = 0;
                    self.p5 = 2 * 0.15;
                    break;
                case 5:
                    self.p5 = 0;
                    self.p5 = 1 * 0.15;
                    break;
                    
                default:
                    break;
            }
        }
        if (pickerView == self.peckerWrintingPro) {
            // this has weigh 0.15
            
            switch (row) {
                case 1:
                    self.p6 = 0;
                    self.p6 = 5 * 0.15;
                    break;
                case 2:
                    self.p6 = 0;
                    self.p6 = 4 * 0.15;
                    break;
                case 3:
                    self.p6 = 0;
                    self.p6 = 3 * 0.15;
                    break;
                case 4:
                    self.p6 = 0;
                    self.p6 = 2 * 0.15;
                    break;
                case 5:
                    self.p6 = 0;
                    self.p6 = 1 * 0.15;
                    break;
                    
                default:
                    break;
            }
        }
        // Here the sum of the grading
        
        // to convert the sumation to percentage
        [self calc];
        
    }
}

-(NSString *)calc {
    
    NSString *calc = [[NSString alloc]init];
    self.sum = self.p1+self.p2+self.p3+self.p4+self.p5+self.p6;
    self.sum = (self.sum / 5) * 100;
    calc = [NSString stringWithFormat:@"%.f",self.sum];
    return calc;
    
    
}



- (IBAction)Total:(id)sender {
    
    self.totalGrading.text=[self calc];
    
    
}
- (IBAction)submit:(id)sender {
    
    self.writingGrade = [self calc];
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterDecimalStyle;
    [self.currentProject setGrade:[f numberFromString:self.writingGrade]];
    [self.delegate rubricViewControllerDidSubmit];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.totalGrading.text = [self.currentProject.grade stringValue];
    
    /* I have faced the bug when the user does not select grad it makes problem
     in order to forc user to select grade. adding "Select(1 to 5)" .
     
     */
    
    self.gradingScale = @[@"Select(1 to 5)",@"(5)",@"(4)",@"(3)",@"(2)",@"(1)"];
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


//- (void)testCalc {
//    
//    rubricView.p1 = 5 * 0.25;
//    rubricView.p2 = 5 * 0.15;
//    rubricView.p3 = 5 * 0.05;
//    rubricView.p4 = 5 * 0.20;
//    rubricView.p5 = 5 * 0.20;
//    rubricView.p6 = 5 * 0.15;
//    
//    
//    
//    XCTAssertTrue([[rubricView calc ] isEqualToString:@"100"], @"");
//    
//}

@end

