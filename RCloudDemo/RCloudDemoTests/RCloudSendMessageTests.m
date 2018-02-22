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

- (void)testSendTextMessage {
    XCTestExpectation *expectation = [self expectationWithDescription:@"sendTextMessage"];

    [[IMService sharedIMService] sendTextUserId:@"robert" content:@"texttest" extra:nil success:^(long messageId) {
        XCTAssertGreaterThanOrEqual(messageId, 0, @"发送失败");
        [expectation fulfill];
    } error:^(RCErrorCode errorcode, long messageId) {
        XCTFail(@"发送失败");
    }];

    [self waitForExpectationsWithTimeout:10 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
