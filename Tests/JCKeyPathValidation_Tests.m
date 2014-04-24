//
//  JCKeyPathValidation_Tests.m
//  JCKeyPathValidation Tests
//
//  Created by Jonathan Crooke on 26/11/2013.
//  Copyright (c) 2013 Jon Crooke. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "JCKeyPathValidator.h"

@interface TestClass : NSObject
@property (copy) NSString *testProperty;
@end
@implementation TestClass
@end

@interface JCKeyPathValidation_Tests : XCTestCase
@property (strong) TestClass *testObject;
@end

@implementation JCKeyPathValidation_Tests

- (void)testValidObjectKeyPath {
  XCTAssertEqual(JCValidateKeyPath(self.testObject, testProperty),
                 @"testProperty",
                 @"Should return string value of property \"testProperty\"");
}

- (void)testValidClassKeyPath {
  XCTAssertEqual(JCValidateKeyPathWithClass(TestClass, testProperty),
                 @"testProperty",
                 @"Should return string value of property \"testProperty\"");
}

#pragma mark -

- (void)setUp {
  self.testObject = [[TestClass alloc] init];
}

- (void)tearDown {
  self.testObject = nil;
}

@end
