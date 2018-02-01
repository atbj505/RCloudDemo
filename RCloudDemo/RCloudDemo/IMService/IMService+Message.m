//
//  IMService+Message.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/31.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Message.h"


@implementation IMService (Message)

- (NSArray<RCMessage *> *)getAllLocalMessage:(RCConversationType)conversationType
                                    targetId:(NSString *)targetId {
    return [[RCIMClient sharedRCIMClient] getLatestMessages:conversationType targetId:targetId count:999];
}

- (void)getLatestMessages:(RCConversationType)conversationType
                 targetId:(NSString *)targetId
                    count:(int)count
                  success:(void (^)(NSArray *messages))successBlock
                    error:(void (^)(RCErrorCode status))errorBlock {
    NSArray *localMessages = [[RCIMClient sharedRCIMClient] getLatestMessages:conversationType targetId:targetId count:count];
    NSInteger restMessageCount = count - localMessages.count;
    if (restMessageCount) {
        RCMessage *lastMessage = localMessages.lastObject;
        [[RCIMClient sharedRCIMClient] getRemoteHistoryMessages:conversationType targetId:targetId recordTime:lastMessage.sentTime count:(int)restMessageCount success:^(NSArray *messages) {
            [messages.mutableCopy addObjectsFromArray:localMessages];
            successBlock(messages);
        } error:errorBlock];
    } else {
        successBlock(localMessages);
    }
}

- (void)getHistoryMessages:(RCConversationType)conversationType
                  targetId:(NSString *)targetId
           oldestMessageId:(long)oldestMessageId
                     count:(int)count
                   success:(void (^)(NSArray *messages))successBlock
                     error:(void (^)(RCErrorCode status))errorBlock {
    NSArray *localMessages = [[RCIMClient sharedRCIMClient] getHistoryMessages:conversationType targetId:targetId oldestMessageId:oldestMessageId count:count];
    NSInteger restMessageCount = count - localMessages.count;
    if (restMessageCount) {
        RCMessage *lastMessage = localMessages.lastObject;
        [[RCIMClient sharedRCIMClient] getRemoteHistoryMessages:conversationType targetId:targetId recordTime:lastMessage.sentTime count:(int)restMessageCount success:^(NSArray *messages) {
            [messages.mutableCopy addObjectsFromArray:localMessages];
            successBlock(messages);
        } error:errorBlock];
    } else {
        successBlock(localMessages);
    }
}

- (NSArray<RCMessage *> *)searchMessages:(RCConversationType)conversationType
                                targetId:(NSString *)targetId
                                 keyword:(NSString *)keyword {
    return [[RCIMClient sharedRCIMClient] searchMessages:conversationType targetId:targetId keyword:keyword count:10 startTime:0];
}

- (void)deleteMessages:(RCConversationType)conversationType
              targetId:(NSString *)targetId
            messageIds:(NSArray *)messageIds
               success:(void (^)(void))successBlock
                 error:(void (^)(RCErrorCode status))errorBlock {
    if (messageIds.count) {
        BOOL result = [[RCIMClient sharedRCIMClient] deleteMessages:messageIds];
        if (result) {
            successBlock();
        } else {
            errorBlock(ERRORCODE_UNKNOWN);
        }
    } else {
        [[RCIMClient sharedRCIMClient] deleteMessages:conversationType targetId:targetId success:successBlock error:errorBlock];
    }
}

- (BOOL)setMessageReceivedStatus:(long)messageId
                  receivedStatus:(RCReceivedStatus)receivedStatus {
    return [[RCIMClient sharedRCIMClient] setMessageReceivedStatus:messageId receivedStatus:receivedStatus];
}

- (BOOL)setMessageSentStatus:(long)messageId
                  sentStatus:(RCSentStatus)sentStatus {
    return [[RCIMClient sharedRCIMClient] setMessageSentStatus:messageId sentStatus:sentStatus];
}

- (void)downloadMediaMessage:(long)messageId
                    progress:(void (^)(int progress))progressBlock
                     success:(void (^)(NSString *mediaPath))successBlock
                       error:(void (^)(RCErrorCode errorCode))errorBlock
                      cancel:(void (^)(void))cancelBlock {
    [[RCIMClient sharedRCIMClient] downloadMediaMessage:messageId progress:progressBlock success:successBlock error:errorBlock cancel:cancelBlock];
}

- (BOOL)cancelDownloadMediaMessage:(long)messageId {
    return [[RCIMClient sharedRCIMClient] cancelDownloadMediaMessage:messageId];
}

@end
