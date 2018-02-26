//
//  IMService+Conversation.m
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService+Conversation.h"
#import "IMService+Message.h"


@implementation IMService (Conversation)

- (NSArray<RCConversation *> *)getConversationLists {
    NSArray *conversationList = [[RCIMClient sharedRCIMClient]
        getConversationList:[self defaultConversationTypes]];
    return conversationList;
}

- (RCConversation *)getConversation:(NSString *)targetId {
    RCConversation *conversation = [[RCIMClient sharedRCIMClient] getConversation:ConversationType_GROUP targetId:targetId];
    if (!conversation) {
        conversation = [[RCIMClient sharedRCIMClient] getConversation:ConversationType_PRIVATE targetId:targetId];
    }
    if (conversation) {
        return conversation;
    }
    return nil;
}

- (NSArray<RCSearchConversationResult *> *)searchConversationskeyword:(NSString *)keyword {
    NSArray *conversationType = [self defaultConversationTypes];
    //每个消息类方法getObjectName
    NSArray *messageType = @[ [RCTextMessage getObjectName],
                              [RCFileMessage getObjectName],
                              [RCRichContentMessage getObjectName] ];

    return [[RCIMClient sharedRCIMClient] searchConversations:conversationType messageType:messageType keyword:keyword];
}

- (void)deleteConversation:(RCConversationType)conversationType
                  targetId:(NSString *)targetId
             deletemessage:(BOOL)isDeleteMessage
                      sync:(BOOL)isSync
                   success:(void (^)(void))successBlock
                     error:(void (^)(RCErrorCode status))errorBlock {
    BOOL result = [[RCIMClient sharedRCIMClient] removeConversation:conversationType targetId:targetId];
    if (result) {
        if (isDeleteMessage) {
            [self deleteMessages:conversationType targetId:targetId messages:nil sync:isSync success:successBlock error:errorBlock];
        } else {
            successBlock();
        }
    } else {
        errorBlock(ERRORCODE_UNKNOWN);
    }
}

- (BOOL)setConversationToTop:(RCConversationType)conversationType
                    targetId:(NSString *)targetId
                       isTop:(BOOL)isTop {
    return [[RCIMClient sharedRCIMClient] setConversationToTop:conversationType targetId:targetId isTop:isTop];
}

- (NSArray<RCConversation *> *)getTopConversationList {
    NSArray *conversationType = [self defaultConversationTypes];

    return [[RCIMClient sharedRCIMClient] getTopConversationList:conversationType];
}

- (NSString *)getTextMessageDraft:(RCConversationType)conversationType
                         targetId:(NSString *)targetId {
    return [[RCIMClient sharedRCIMClient] getTextMessageDraft:conversationType targetId:targetId];
}

- (BOOL)saveTextMessageDraft:(RCConversationType)conversationType
                    targetId:(NSString *)targetId
                     content:(NSString *)content {
    return [[RCIMClient sharedRCIMClient] saveTextMessageDraft:conversationType targetId:targetId content:content];
}

- (BOOL)clearTextMessageDraft:(RCConversationType)conversationType
                     targetId:(NSString *)targetId {
    return [[RCIMClient sharedRCIMClient] clearTextMessageDraft:conversationType targetId:targetId];
}

- (void)setConversationNotificationStatus:(RCConversationType)conversationType
                                 targetId:(NSString *)targetId
                                    block:(BOOL)isBlock
                                  success:(void (^)(RCConversationNotificationStatus nStatus))successBlock
                                    error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] setConversationNotificationStatus:conversationType targetId:targetId isBlocked:isBlock success:successBlock error:errorBlock];
}

- (void)getConversationNotificationStatus:(RCConversationType)conversationType
                                 targetId:(NSString *)targetId
                                  success:(void (^)(RCConversationNotificationStatus nStatus))successBlock
                                    error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] getConversationNotificationStatus:conversationType targetId:targetId success:successBlock error:errorBlock];
}

- (NSArray<RCConversation *> *)getBlockedConversationList {
    NSArray *conversationType = [self defaultConversationTypes];

    return [[RCIMClient sharedRCIMClient] getBlockedConversationList:conversationType];
}

- (void)setNotificationQuietHours:(NSString *)startTime
                         spanMins:(int)spanMins
                          success:(void (^)())successBlock
                            error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] setNotificationQuietHours:startTime spanMins:spanMins success:successBlock error:errorBlock];
}

- (void)getNotificationQuietHours:(void (^)(NSString *startTime, int spansMin))successBlock
                            error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] getNotificationQuietHours:successBlock error:errorBlock];
}

- (void)removeNotificationQuietHours:(void (^)())successBlock
                               error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] removeNotificationQuietHours:successBlock error:errorBlock];
}

- (void)sendTypingStatus:(RCConversationType)conversationType
                targetId:(NSString *)targetId {
    [[RCIMClient sharedRCIMClient] sendTypingStatus:conversationType targetId:targetId contentType:[RCTextMessage getObjectName]];
}

- (void)syncConversationReadStatus:(RCConversationType)conversationType
                          targetId:(NSString *)targetId
                              time:(long long)timestamp
                           success:(void (^)())successBlock
                             error:(void (^)(RCErrorCode nErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] syncConversationReadStatus:conversationType targetId:targetId time:timestamp success:successBlock error:errorBlock];
}

- (NSArray *)defaultConversationTypes {
    NSArray *conversationList = @[ @(ConversationType_PRIVATE),
                                   @(ConversationType_DISCUSSION),
                                   @(ConversationType_GROUP),
                                   @(ConversationType_SYSTEM),
                                   @(ConversationType_APPSERVICE),
                                   @(ConversationType_PUBLICSERVICE) ];
    return conversationList;
}

@end
