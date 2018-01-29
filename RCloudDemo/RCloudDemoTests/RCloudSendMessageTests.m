//
//  RCloudSendMessageTests.m
//  RCloudSendMessageTests
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IMService+SendMessage.h"

@interface RCloudSendMessageTests : XCTestCase

@end

@implementation RCloudSendMessageTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testSendMessage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"sendTextMessage"];
    
    [[IMService sharedIMService] sendTextUserId:@"080904" content:@"test"success:^(long messageId) {
        XCTAssertGreaterThanOrEqual(messageId, 0, @"send fail");
        [expectation fulfill];
    } fail:^(RCErrorCode errorcode, long messageId) {
        
    }];
    
    [self waitForExpectationsWithTimeout:10 handler:^(NSError * _Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
