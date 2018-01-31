//
//  IMService+Message.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/31.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Message.h"

@implementation IMService (Message)

- (NSArray <RCMessage *>*)getAllLocalMessage:(RCConversationType)conversationType
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
    }else {
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
    }else {
        successBlock(localMessages);
    }
}

@end
