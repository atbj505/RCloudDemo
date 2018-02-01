//
//  IMService+Conversation.m
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService+Conversation.h"


@implementation IMService (Conversation)

- (NSArray *)getConversationLists {
    NSArray *conversationList = [[RCIMClient sharedRCIMClient]
        getConversationList:@[ @(ConversationType_PRIVATE),
                               @(ConversationType_DISCUSSION),
                               @(ConversationType_GROUP),
                               @(ConversationType_SYSTEM),
                               @(ConversationType_APPSERVICE),
                               @(ConversationType_PUBLICSERVICE) ]];
    return conversationList;
}

- (RCConversation *)getConversation:(RCConversationType)conversationType
                           targetId:(NSString *)targetId {
    RCConversation *conversation = [[RCIMClient sharedRCIMClient] getConversation:conversationType targetId:targetId];
    return conversation;
}

- (NSArray<RCSearchConversationResult *> *)searchConversationskeyword:(NSString *)keyword {
    NSArray *conversationType = @[ @(ConversationType_PRIVATE),
                                   @(ConversationType_DISCUSSION),
                                   @(ConversationType_GROUP),
                                   @(ConversationType_SYSTEM),
                                   @(ConversationType_APPSERVICE),
                                   @(ConversationType_PUBLICSERVICE) ];

    NSArray *messageType = @[ [RCTextMessage getObjectName],
                              [RCImageMessage getObjectName],
                              [RCVoiceMessage getObjectName],
                              [RCFileMessage getObjectName] ];

    return [[RCIMClient sharedRCIMClient] searchConversations:conversationType messageType:messageType keyword:keyword];
}

@end
