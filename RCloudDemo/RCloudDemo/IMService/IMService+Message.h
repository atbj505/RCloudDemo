//
//  IMService+Message.h
//  RCloudDemo
//
//  Created by Robert on 2018/1/31.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Message)

/**
 获取所有本地消息
 
 @param conversationType 会话类型
 @param targetId 会话ID
 @return 消息列表
 */
- (NSArray<RCMessage *> *)getAllLocalMessage:(RCConversationType)conversationType
                                    targetId:(NSString *)targetId;


/**
 获取指定数量的消息（当数量大于本地存储数量时会向服务器请求历史数据）
 
 @param conversationType 会话类型
 @param targetId 会话ID
 @param count 消息数量
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)getLatestMessages:(RCConversationType)conversationType
                 targetId:(NSString *)targetId
                    count:(int)count
                  success:(void (^)(NSArray *messages))successBlock
                    error:(void (^)(RCErrorCode status))errorBlock;


/**
 获取指定消息之前指定数量的消息（当数量大于本地存储数量时会向服务器请求历史数据）
 
 @param conversationType 会话类型
 @param targetId 会话ID
 @param oldestMessageId 指定消息ID
 @param count 消息数量
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)getHistoryMessages:(RCConversationType)conversationType
                  targetId:(NSString *)targetId
           oldestMessageId:(long)oldestMessageId
                     count:(int)count
                   success:(void (^)(NSArray *messages))successBlock
                     error:(void (^)(RCErrorCode status))errorBlock;

@end
