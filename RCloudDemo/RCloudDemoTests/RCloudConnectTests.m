//
//  RCloudConnectTests.m
//  RCloudDemoTests
//
//  Created by Robert on 2018/2/22.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IMService+Connect.h"


@interface RCloudConnectTests : XCTestCase

@end


@implementation RCloudConnectTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testConnect {
    XCTestExpectation *expectation = [self expectationWithDescription:@"connect"];

    [[IMService sharedIMService] connectWithToken:@"nE6Mrb9Rbdb8sDfXEO05Hlp+MCW6KAJIche2lJ5eytpqtN64OW1hfqZwxJwRRv3rPQ0zo+BjJykrmtr2lgR+aA==" success:^(NSString *userId) {
        RCConnectionStatus status = [[IMService sharedIMService] getConnectionStatus];
        XCTAssertEqual(status, ConnectionStatus_Connected, @"链接失败");
        [expectation fulfill];
    } error:^(RCConnectErrorCode status) {
        XCTFail(@"连接失败");
    }];


    [self waitForExpectationsWithTimeout:10 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testDisconnect {
    [[IMService sharedIMService] disconnect];
    RCConnectionStatus status = [[IMService sharedIMService] getConnectionStatus];
    XCTAssertEqual(status, ConnectionStatus_SignUp, @"断开链接失败");
}

- (void)testNetworkStatus {
    RCNetworkStatus status = [[IMService sharedIMService] getCurrentNetworkStatus];
    XCTAssertNotEqual(status, RC_NotReachable, @"网络正常");
}

@end
