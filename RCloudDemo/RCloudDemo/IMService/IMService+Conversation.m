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
                                  success:(void (^)(RCConversationNotificationStatus nStatus))successBlock
                                    error:(void (^)(RCErrorCode status))errorBlock {
    //获取会话当前提醒状态
    [self getConversationNotificationStatus:conversationType targetId:targetId success:^(RCConversationNotificationStatus nStatus) {
        //设置会话提醒状态
        [[RCIMClient sharedRCIMClient] setConversationNotificationStatus:conversationType targetId:targetId isBlocked:!nStatus success:successBlock error:errorBlock];
    } error:^(RCErrorCode status) {
        errorBlock(status);
    }];
}

- (void)getConversationNotificationStatus:(RCConversationType)conversationType
                                 targetId:(NSString *)targetId
                                  success:(void (^)(RCConversationNotificationStatus nStatus))successBlock
                                    error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] getConversationNotificationStatus:conversationType targetId:targetId success:successBlock error:errorBlock];
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
                targetId:(NSString *)targetId
             contentType:(NSString *)objectName {
    [[RCIMClient sharedRCIMClient] sendTypingStatus:conversationType targetId:targetId contentType:objectName];
}

- (void)syncConversationReadStatus:(RCConversationType)conversationType
                          targetId:(NSString *)targetId
                              time:(long long)timestamp
                           success:(void (^)())successBlock
                             error:(void (^)(RCErrorCode nErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] syncConversationReadStatus:conversationType targetId:targetId time:timestamp success:successBlock error:errorBlock];
}

@end
