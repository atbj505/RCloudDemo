//
//  IMService.m
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"

@implementation IMService

+ (instancetype)sharedIMService {
    static dispatch_once_t onceToken;
    static IMService *service;
    
    dispatch_once(&onceToken, ^{
        service = [[[self class] alloc] init];
    });
    
    return service;
}

- (instancetype)init {
    if (self = [super init]) {
        [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:self object:nil];
    }
    return self;
}

- (void)sendMessageUserId:(NSString *)userId
                   content:(NSString *)content
                   success:(sendSuccessBlock)successBlock
                      fail:(sendFailBlock)failBlock {
    RCTextMessage *testMessage = [RCTextMessage messageWithContent:content];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE
                                      targetId:userId
                                       content:testMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

#pragma mark RCIMClientReceiveMessageDelegate
- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        RCTextMessage *testMessage = (RCTextMessage *)message.content;
        NSLog(@"消息内容：%@", testMessage.content);
    }
    
    NSLog(@"还剩余的未接收的消息数：%d", nLeft);
}

@end
