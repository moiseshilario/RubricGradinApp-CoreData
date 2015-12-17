//
//  RubricGradingAppCDUITests.m
//  RubricGradingAppCDUITests
//
//  Created by Moises Hilario Rodrigues on 11/22/15.
//  Copyright © 2015 iosProject. All rights reserved.
//

#import <XCTest/XCTest.h>

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

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testIncorrectLogin {
    //Test create by Moises Hilario   
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
    //Test create by Moises Hilario
    
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

-(void)testAddingFaculty {
   //Test create by Moises Hilario
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"admin"];
    
    XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Login"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    [element tap];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"admin"];
    [element tap];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Correct"].collectionViews.buttons[@"OK"] tap];
    [app.navigationBars[@"Projects"].buttons[@"Add"] tap];
    
    XCUIElement *projectSNameTextField = app.textFields[@"Project's name"];
    [projectSNameTextField tap];
    [projectSNameTextField typeText:@"test add faculty"];
    [[[[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1].buttons[@"Edit"] tap];
    [app.tables.staticTexts[@"Dr. Frezza"] tap];
    [app.navigationBars[@"Select the faculty"].buttons[@"Done"] tap];
    
    XCTAssertTrue(app.tables.staticTexts[@"Dr. Frezza"].exists);
}

-(void)testAddStudent {
    //Test create by Moises Hilario
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"admin"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"admin"];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Correct"].collectionViews.buttons[@"OK"] tap];
    [app.navigationBars[@"Projects"].buttons[@"Add"] tap];
    [[[[[[[[[[[app childrenMatchingType:XCUIElementTypeWindow] elementBoundByIndex:0] childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:2].buttons[@"Edit"] tap];
    [app.tables.staticTexts[@"James"] tap];
    [app.navigationBars[@"Select the students"].buttons[@"Done"] tap];
    
    XCTAssertTrue(app.tables.staticTexts[@"James"].exists);
    
}

-(void)testDeleteAProject {
    //Test create by Moises Hilario
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"admin"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"admin"];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Correct"].collectionViews.buttons[@"OK"] tap];
    [app.navigationBars[@"Projects"].buttons[@"Add"] tap];
    
    XCUIElement *projectSNameTextField = app.textFields[@"Project's name"];
    [projectSNameTextField tap];
    [projectSNameTextField typeText:@"test to delete 2"];
    [app.navigationBars[@"Add a Project"].buttons[@"Save"] tap];
    
    XCUIElement *testToDelete2StaticText = app.tables.staticTexts[@"test to delete 2"];
    [testToDelete2StaticText swipeLeft];
    XCUIElementQuery *tablesQuery = app.tables;
    [tablesQuery.buttons[@"Delete"] tap];
    
    XCTAssertFalse(app.tables.tableRows.staticTexts[@"test to delete 2"].exists);
}

-(void)testPicker {
XCUIApplication *app = [[XCUIApplication alloc] init];
XCUIElement *usernameTextField = app.textFields[@"Username"];
[usernameTextField tap];
[usernameTextField typeText:@"sasi001"];

XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Login"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
[element doubleTap];

XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
[passwordSecureTextField tap];
[passwordSecureTextField typeText:@"passwordSasi"];
[element doubleTap];
[app.buttons[@"Login"] tap];
[app.alerts[@"Correct"].collectionViews.buttons[@"OK"] tap];
[app.tables.staticTexts[@"Project 2"] tap];
[app.buttons[@"Total"] tap];




XCTAssertTrue(app.staticTexts[@"0"].exists);
}

@end
