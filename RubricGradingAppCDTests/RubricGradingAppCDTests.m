//
//  RubricGradingAppCDTests.m
//  RubricGradingAppCDTests
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "LoginViewController.h"

@interface RubricGradingAppCDTests : XCTestCase
@property (nonatomic) LoginViewController *loginVC;
@end

@implementation RubricGradingAppCDTests

- (void)setUp {
    [super setUp];
    self.loginVC = [[LoginViewController alloc] init];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    self.loginVC = nil;
    [super tearDown];
}

- (void)testExample {
    // This is an example of a functional test case.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testPerformanceExample {
    // This is an example of a performance test case.
    [self measureBlock:^{
        // Put the code you want to measure the time of here.
    }];
}

- (void)testLoginViewControllerIsNotNil {
   // XCTAssertNotNil(self.loginVC);
}

@end
