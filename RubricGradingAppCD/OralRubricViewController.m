//
//  OralRubricViewController.m
//  RubricGradingAppCD
//
//  Created by Hassan on 12/8/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "OralRubricViewController.h"

@interface OralRubricViewController (){
    double pl1;
    double pl2;
    double pl3;
    double pl4;
    double pl5;
    double pl6;
    double pl7;
    double sum;
}

@property (weak, nonatomic) IBOutlet UIPickerView *pickerOrganization;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerStyle;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerCommunication;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerContent;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerGrammar;

@property (weak, nonatomic) IBOutlet UIPickerView *pickerAppearance;
@property (weak, nonatomic) IBOutlet UIPickerView *pickerVerbal;
@property NSArray *gradingOralScale;
@property (weak, nonatomic) IBOutlet UILabel *oralTotalGrading;

@end

@implementation OralRubricViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.gradingOralScale = @[@"Select(1 to 5)",@"(5)",@"(4)",@"(3)",@"(2)",@"(1)"];
    // Do any additional setup after loading the view.
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    if (pickerView == self.pickerOrganization) {
        return 1;
    }
    if (pickerView == self.pickerStyle) {
        return 1;
    }
    if (pickerView == self.pickerCommunication) {
        return 1;
    }
    if (pickerView == self.pickerContent) {
        return 1;
    }
    if (pickerView == self.pickerGrammar) {
        return 1;
    }
    if (pickerView == self.pickerAppearance) {
        return 1;
    }
    if (pickerView == self.pickerVerbal) {
        return 1;
    }

    return 0;
    
}
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    
    if (pickerView == self.pickerOrganization) {
        return 6;
    }
    if (pickerView == self.pickerStyle) {
        return 6;
    }
    if (pickerView == self.pickerCommunication) {
        return 6;
    }
    if (pickerView == self.pickerContent) {
        return 6;
    }
    if (pickerView == self.pickerGrammar) {
        return 6;
    }
    if (pickerView == self.pickerAppearance) {
        return 6;
    }
    if (pickerView == self.pickerVerbal) {
        return 6;
    }
    
    return 0;
}


-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    
    if (pickerView == self.pickerOrganization) {
        return self.gradingOralScale[row];
    }
    if (pickerView == self.pickerStyle) {
        return self.gradingOralScale[row];
    }
    if (pickerView == self.pickerCommunication) {
        return self.gradingOralScale[row];
    }
    if (pickerView == self.pickerContent) {
        return self.gradingOralScale[row];
    }
    if (pickerView == self.pickerGrammar) {
        return self.gradingOralScale[row];
    }
    if (pickerView == self.pickerAppearance) {
        return self.gradingOralScale[row];
    }
    if (pickerView == self.pickerVerbal) {
        return self.gradingOralScale[row];
    }
    
    return 0;
    
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    
    if (pickerView) {
        
    
//    pl1 = 5 * 0.10;
//    pl2 = 5 * 0.05;
//    pl3 = 5 * 0.05;
//    pl4 = 5 * 0.60;
//    pl5 = 5 * 0.05;
//    pl6 = 5 * 0.05;
//    pl7 = 5 * 0.10;
    if (pickerView == self.pickerOrganization) {
        
        switch (row) {
            case 1:
                pl1 = 0;
                pl1 = 5 * 0.10;
                break;
            case 2:
                pl1 = 0;
                pl1 = 4 * 0.10;
                break;
            case 3:
                pl1 = 0;
                pl1 = 3 * 0.10;
                break;
            case 4:
                pl1 = 0;
                pl1 = 2 * 0.10;
                break;
            case 5:
                pl1 = 0;
                pl1 = 1 * 0.10;
                break;
            
            default:
                break;
        }
        
    }
    if (pickerView == self.pickerStyle) {
        
        switch (row) {
            case 1:
                pl2 = 0;
                pl2 = 5 * 0.05;
                break;
            case 2:
                pl2 = 0;
                pl2 = 4 * 0.05;
                break;
            case 3:
                pl2 = 0;
                pl2 = 3 * 0.05;
                break;
            case 4:
                pl2 = 0;
                pl2 = 2 * 0.05;
                break;
            case 5:
                pl2 = 0;
                pl2 = 1 * 0.05;
                break;
                
            default:
                break;
        }
        
        
    }
    if (pickerView == self.pickerCommunication) {
        
        switch (row) {
            case 1:
                pl3 = 0;
                pl3 = 5 * 0.05;
                break;
            case 2:
                pl3 = 0;
                pl3 = 4 * 0.05;
                break;
            case 3:
                pl3 = 0;
                pl3 = 3 * 0.05;
                break;
            case 4:
                pl3 = 0;
                pl3 = 2 * 0.05;
                break;
            case 5:
                pl3 = 0;
                pl3 = 1 * 0.05;
                break;
                
            default:
                break;
        }
        
    }
    if (pickerView == self.pickerContent) {
        
        
        switch (row) {
            case 1:
                pl4 = 0;
                pl4 = 5 * 0.60;
                break;
            case 2:
                pl4 = 0;
                pl4 = 4 * 0.60;
                break;
            case 3:
                pl4 = 0;
                pl4 = 3 * 0.60;
                break;
            case 4:
                pl4 = 0;
                pl4 = 2 * 0.60;
                break;
            case 5:
                pl4 = 0;
                pl4 = 1 * 0.60;
                break;
                
            default:
                break;
        }

        
    }
    if (pickerView == self.pickerGrammar) {
        
        switch (row) {
            case 1:
                pl5 = 0;
                pl5 = 5 * 0.05;
                break;
            case 2:
                pl5 = 0;
                pl5 = 4 * 0.05;
                break;
            case 3:
                pl5 = 0;
                pl5 = 3 * 0.05;
                break;
            case 4:
                pl5 = 0;
                pl5 = 2 * 0.05;
                break;
            case 5:
                pl5 = 0;
                pl5 = 1 * 0.05;
                break;
                
            default:
                break;
        }

        
    }
    if (pickerView == self.pickerAppearance) {
        
        switch (row) {
            case 1:
                pl6 = 0;
                pl6 = 5 * 0.05;
                break;
            case 2:
                pl6 = 0;
                pl6 = 4 * 0.05;
                break;
            case 3:
                pl6 = 0;
                pl6 = 3 * 0.05;
                break;
            case 4:
                pl6 = 0;
                pl6 = 2 * 0.05;
                break;
            case 5:
                pl6 = 0;
                pl6 = 1 * 0.05;
                break;
                
            default:
                break;
        }

        
    }
    if (pickerView == self.pickerVerbal) {
        
        switch (row) {
            case 1:
                pl7 = 0;
                pl7 = 5 * 0.10;
                break;
            case 2:
                pl7 = 0;
                pl7 = 4 * 0.10;
                break;
            case 3:
                pl7 = 0;
                pl7 = 3 * 0.10;
                break;
            case 4:
                pl7 = 0;
                pl7 = 2 * 0.10;
                break;
            case 5:
                pl7 = 0;
                pl7 = 1 * 0.10;
                break;
                
            default:
                break;
        }

        
    }
        
        [self oralCalc];
 
    }
}

-(NSString *)oralCalc {
    
    NSString *calc = [[NSString alloc]init];
    sum = pl1+pl2+pl3+pl4+pl5+pl6+pl7;
    sum = (sum / 5) * 100;
    calc = [NSString stringWithFormat:@"%.f",sum];
    return calc;
    
    
}


- (IBAction)oralSumation:(id)sender {
    
    
    self.oralTotalGrading.text = [self oralCalc];
    
}
- (IBAction)submitOralRubric:(id)sender {
    
    self.oralGrade = [self oralCalc];
    
    
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
