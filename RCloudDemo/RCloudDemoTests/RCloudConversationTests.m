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
#import "IMService+SendMessage.h"


@interface RCloudConversationTests : XCTestCase

@end


@implementation RCloudConversationTests

- (void)setUp {
    [super setUp];
    if ([[IMService sharedIMService] getConnectionStatus] != ConnectionStatus_Connected) {
        [[IMService sharedIMService] connectWithToken:@"nE6Mrb9Rbdb8sDfXEO05Hlp+MCW6KAJIche2lJ5eytpqtN64OW1hfqZwxJwRRv3rPQ0zo+BjJykrmtr2lgR+aA==" success:^(NSString *userId) {

            [[IMService sharedIMService] sendTextUserId:@"robert" content:@"test" extra:nil success:^(long messageId) {

            } error:^(RCErrorCode errorcode, long messageId){

            }];
        } error:^(RCConnectErrorCode status) {
            XCTFail(@"连接失败");
        }];
    }
    [NSThread sleepForTimeInterval:5];
}

- (void)tearDown {
    //    [[IMService sharedIMService] disconnect];
    [super tearDown];
}

- (void)testGetConversationList {
    NSArray *conversations = [[IMService sharedIMService] getConversationLists];
    XCTAssertNotEqual(conversations.count, 0, @"获取失败");
}

- (void)testGetConversationByTargetId {
    RCConversation *conversation = [[IMService sharedIMService] getConversation:@"robert"];
    XCTAssertNotNil(conversation, @"获取失败");

    conversation = [[IMService sharedIMService] getConversation:@"123456"];
    XCTAssertNil(conversation, @"获取失败");
}

- (void)testSearchConversationskeyword {
    NSArray *conversations = [[IMService sharedIMService] searchConversationskeyword:@"test"];
    XCTAssertNotEqual(conversations.count, 0, @"获取失败");

    conversations = [[IMService sharedIMService] searchConversationskeyword:@"123"];
    XCTAssertEqual(conversations.count, 0, @"获取失败");
}

- (void)testDeleteConversation {
    XCTestExpectation *expectation = [self expectationWithDescription:@"deleteConversation"];
    [[IMService sharedIMService] deleteConversation:ConversationType_PRIVATE targetId:@"robert" deletemessage:true sync:false success:^{
        [expectation fulfill];
    } error:^(RCErrorCode status) {
        XCTFail(@"删除失败");
    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testSetConversationToTop {
    BOOL isTopT = [[IMService sharedIMService] setConversationToTop:ConversationType_PRIVATE targetId:@"robert" isTop:true];

    BOOL isTopF = [[IMService sharedIMService] setConversationToTop:ConversationType_PRIVATE targetId:@"robert" isTop:false];
    XCTAssertTrue(isTopT && isTopF, @"设置失败");
}

- (void)testGetTopConversationList {
    [[IMService sharedIMService] setConversationToTop:ConversationType_PRIVATE targetId:@"robert" isTop:true];
    NSArray *topList = [[IMService sharedIMService] getTopConversationList];
    XCTAssertNotEqual(topList.count, 0, @"获取失败");

    [[IMService sharedIMService] setConversationToTop:ConversationType_PRIVATE targetId:@"robert" isTop:false];
    topList = [[IMService sharedIMService] getTopConversationList];
    XCTAssertEqual(topList.count, 0, @"获取失败");
}

- (void)testSaveTextMessageDraft {
    BOOL result = [[IMService sharedIMService] saveTextMessageDraft:ConversationType_PRIVATE targetId:@"robert" content:@"123456"];
    XCTAssertTrue(result, @"保存失败");
}

- (void)testGetTextMessageDraft {
    NSString *result = [[IMService sharedIMService] getTextMessageDraft:ConversationType_PRIVATE targetId:@"robert"];
    XCTAssertEqualObjects(result, @"123456", @"获取失败");
}

- (void)testClearTextMessageDraft {
    BOOL result = [[IMService sharedIMService] clearTextMessageDraft:ConversationType_PRIVATE targetId:@"robert"];
    XCTAssertTrue(result, @"清除失败");

    NSString *resultStr = [[IMService sharedIMService] getTextMessageDraft:ConversationType_PRIVATE targetId:@"robert"];
    XCTAssertNil(resultStr, @"获取失败");
}

- (void)testSetConversationNotificationStatusBlock {
    XCTestExpectation *expectation = [self expectationWithDescription:@"conversationNotificationStatusBlock"];
    [[IMService sharedIMService] setConversationNotificationStatus:ConversationType_PRIVATE targetId:@"robert" block:true success:^(RCConversationNotificationStatus nStatus) {
        XCTAssertEqual(nStatus, DO_NOT_DISTURB, @"设置成功");
        [expectation fulfill];
    } error:^(RCErrorCode status) {
        XCTFail(@"设置失败");
    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testSetConversationNotificationStatusUnBlock {
    XCTestExpectation *expectation = [self expectationWithDescription:@"conversationNotificationStatusUnBlock"];
    [[IMService sharedIMService] setConversationNotificationStatus:ConversationType_PRIVATE targetId:@"robert" block:false success:^(RCConversationNotificationStatus nStatus) {
        XCTAssertEqual(nStatus, NOTIFY, @"设置成功");
        [expectation fulfill];
    } error:^(RCErrorCode status) {
        XCTFail(@"设置失败");
    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetConversationNotificationStatus {
    XCTestExpectation *expectation = [self expectationWithDescription:@"conversationNotificationStatus"];
    [[IMService sharedIMService] setConversationNotificationStatus:ConversationType_PRIVATE targetId:@"robert" block:true success:^(RCConversationNotificationStatus nStatus) {
        [[IMService sharedIMService] getConversationNotificationStatus:ConversationType_PRIVATE targetId:@"robert" success:^(RCConversationNotificationStatus nStatus) {
            XCTAssertEqual(nStatus, DO_NOT_DISTURB, @"查询失败");
            [expectation fulfill];
        } error:^(RCErrorCode status) {
            XCTFail(@"设置失败");
        }];
    } error:^(RCErrorCode status){

    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetBlockedConversationList {
    NSArray *blockedLists = [[IMService sharedIMService] getBlockedConversationList];
    XCTAssertEqual(blockedLists.count, 1, @"获取失败");
}

- (void)testSetQuietHours {
    XCTestExpectation *expectation = [self expectationWithDescription:@"setQuietHours"];
    [[IMService sharedIMService] setNotificationQuietHours:@"11:20:00" spanMins:40 success:^{
        [expectation fulfill];
    } error:^(RCErrorCode status) {
        XCTFail(@"设置失败");
    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testGetQuietHours {
    XCTestExpectation *expectation = [self expectationWithDescription:@"getQuietHours"];
    [[IMService sharedIMService] getNotificationQuietHours:^(NSString *startTime, int spansMin) {
        XCTAssertEqualObjects(startTime, @"11:20:00", @"开始时间错误");
        XCTAssertEqual(spansMin, 40, @"持续时间错误");
        [expectation fulfill];
    } error:^(RCErrorCode status) {
        XCTFail(@"设置失败");
    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

- (void)testRemoveQuietHours {
    XCTestExpectation *expectation = [self expectationWithDescription:@"removeQuietHours"];
    [[IMService sharedIMService] removeNotificationQuietHours:^{
        [expectation fulfill];
    } error:^(RCErrorCode status) {
        XCTFail(@"移除失败");
    }];

    [self waitForExpectationsWithTimeout:15 handler:^(NSError *_Nullable error) {
        if (error) {
            NSLog(@"Timeout Error: %@", error);
        }
    }];
}

@end
