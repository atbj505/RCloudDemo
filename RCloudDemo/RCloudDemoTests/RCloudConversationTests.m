//
//  RCloudConversationTests.m
//  RCloudDemoTests
//
//  Created by Robert on 2018/2/22.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "IMService+Conversation.h"
#import "IMService+Connect.h"


@interface RCloudConversationTests : XCTestCase

@end


@implementation RCloudConversationTests

- (void)setUp {
    [super setUp];
    [[IMService sharedIMService] connectWithToken:@"nE6Mrb9Rbdb8sDfXEO05Hlp+MCW6KAJIche2lJ5eytpqtN64OW1hfqZwxJwRRv3rPQ0zo+BjJykrmtr2lgR+aA==" success:^(NSString *userId) {

    } error:^(RCConnectErrorCode status) {
        XCTFail(@"连接失败");
    }];
}

- (void)tearDown {
    [[IMService sharedIMService] disconnect];
    [super tearDown];
}

- (void)testGetConversationList {
    NSArray *conversations = [[IMService sharedIMService] getConversationLists];
    XCTAssertNotEqual(conversations.count, 0, @"获取失败");
}

- (void)testGetConversationByTargetId {
    RCConversation *conversation = [[IMService sharedIMService] getConversation:@"080904"];
    XCTAssertNotNil(conversation, @"获取失败");

    conversation = [[IMService sharedIMService] getConversation:@"123456"];
    XCTAssertNil(conversation, @"获取失败");
}

@end
