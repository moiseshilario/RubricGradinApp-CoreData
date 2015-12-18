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
        //faculty login
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"sasi001"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"password"];
    [app.buttons[@"shift"] tap];
    [passwordSecureTextField typeText:@"Sasi"];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Correct"].collectionViews.buttons[@"OK"] tap];
   
        
    }

- (void)testExample1{
    
    // incorrect login credentials
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *usernameTextField = app.textFields[@"Username"];
    [usernameTextField tap];
    [usernameTextField typeText:@"frezza001"];
    
    XCUIElement *passwordSecureTextField = app.secureTextFields[@"Password"];
    [passwordSecureTextField tap];
    [passwordSecureTextField typeText:@"password1"];
    
    XCUIElement *moreLettersKey = app.keys[@"more, letters"];
    [moreLettersKey tap];
    [moreLettersKey tap];
    [app.buttons[@"shift"] tap];
    [passwordSecureTextField typeText:@"Frezza"];
    [app.buttons[@"Login"] tap];
    [app.alerts[@"Incorrect"].collectionViews.buttons[@"Try again"] tap];
    
}

- (void)testExample2{
    
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    [app.textFields[@"Username"] tap];
    
    XCUIElement *element = [[[[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"Login"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther] elementBoundByIndex:1];
    [element tap];
    [app.secureTextFields[@"Password"] tap];
    [element tap];
    
}

@end
