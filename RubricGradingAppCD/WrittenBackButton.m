//
//  WrittenBackButton.m
//  RubricGradingAppCD
//
//  Created by Gharat, Prajakta B on 12/17/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import "WrittenBackButton.h"

@interface WrittenBackButton ()

@end

@implementation WrittenBackButton

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
- (IBAction)back:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
