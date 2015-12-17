//
//  RubricGradingAppCDUITests.m
//  RubricGradingAppCD
//
//  Created by Moises Hilario Rodrigues on 12/15/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <XCTest/XCTest.h>

#import "AppDelegate.h"
#import "LoginViewController.h"


@interface RubricGradingAppCDUITests : XCTestCase

@end

@implementation RubricGradingAppCDUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];

    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testIncorrectLogin {
    //1.The user will type an incorrect username and password in the login View
    //2.The login view should show an alert notifying that the entries are incorrect
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"wrongUsername"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField doubleTap];
    
    [passwordSecureTextField typeText:@"1234"];
    [app.buttons[@"Login"] tap];
    XCTAssertTrue(app.alerts[@"Incorrect"].exists);
    
}


-(void)testAddProjectName {
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"admin"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"admin"];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Correct"].collectionViews.buttons[@"OK"] tap];
    [app.navigationBars[@"Projects"].buttons[@"Add"] tap];
    
    XCUIElement *projectSNameTextField = app.textFields[@"Project's name"];
    [projectSNameTextField tap];
    [projectSNameTextField typeText:@"Test5"];
    [app.navigationBars[@"Add a Project"].buttons[@"Save"] tap];
    
    XCTAssert(app.staticTexts[@"Test5"].exists);
    
}






@end
