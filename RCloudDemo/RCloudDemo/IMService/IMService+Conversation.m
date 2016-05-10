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
                                 getConversationList:@[@(ConversationType_PRIVATE),
                                                       @(ConversationType_DISCUSSION),
                                                       @(ConversationType_GROUP),
                                                       @(ConversationType_SYSTEM),
                                                       @(ConversationType_APPSERVICE),
                                                       @(ConversationType_PUBLICSERVICE)]];
    return conversationList;
}

- (RCConversation *)getConversation:(RCConversationType)conversationType
                           targetId:(NSString *)targetId {
    RCConversation *conversation = [[RCIMClient sharedRCIMClient] getConversation:conversationType targetId:targetId];
    return conversation;
}

@end
