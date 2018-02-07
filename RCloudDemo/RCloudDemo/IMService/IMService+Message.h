//
//  IMService+Message.h
//  RCloudDemo
//
//  Created by Robert on 2018/1/31.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Message)

#pragma mark - 获取信息
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


/**
 搜索消息（一次10条）

 @param conversationType 会话类型
 @param targetId 会话ID
 @param keyword 关键字
 @return 搜索结果
 */
- (NSArray<RCMessage *> *)searchMessages:(RCConversationType)conversationType
                                targetId:(NSString *)targetId
                                 keyword:(NSString *)keyword;
#pragma mark - 删除信息

/**
 删除信息

 @param conversationType 会话类型
 @param targetId 会话ID（传入targetId则删除此会话所有信息）
 @param messages 消息数组（传入messages则只删除messages对应的消息）
 @param sync 是否与服务器同步删除
 @param successBlock 成功回调
 @param errorBlock 失败回调
 
 * 如果传入messages则优先删除messsages中的消息，如果想删除会话的所有消息则传入targetId，messages传空
 
 */
- (void)deleteMessages:(RCConversationType)conversationType
              targetId:(NSString *)targetId
              messages:(NSArray *)messages
                  sync:(BOOL)isSync
               success:(void (^)(void))successBlock
                 error:(void (^)(RCErrorCode status))errorBlock;

#pragma mark - 设置消息状态

/**
 设置接收状态

 @param messageId 消息ID
 @param receivedStatus 接收状态
 @return 设置成功/失败
 */
- (BOOL)setMessageReceivedStatus:(long)messageId
                  receivedStatus:(RCReceivedStatus)receivedStatus;

/**
 设置发送状态

 @param messageId 消息ID
 @param sentStatus 发送状态
 @return 设置成功/失败
 */
- (BOOL)setMessageSentStatus:(long)messageId
                  sentStatus:(RCSentStatus)sentStatus;

#pragma mark - 下载&取消

/**
 下载文件

 @param messageId 消息ID
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock 失败回调
 @param cancelBlock 取消回调
 */
- (void)downloadMediaMessage:(long)messageId
                    progress:(void (^)(int progress))progressBlock
                     success:(void (^)(NSString *mediaPath))successBlock
                       error:(void (^)(RCErrorCode errorCode))errorBlock
                      cancel:(void (^)(void))cancelBlock;

/**
 取消下载文件

 @param messageId 消息ID
 @return 取消成功/失败
 */
- (BOOL)cancelDownloadMediaMessage:(long)messageId;

#pragma mark - 消息撤回

/**
 消息撤回

 @param message 消息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)recallMessage:(RCMessage *)message
              success:(void (^)(long messageId))successBlock
                error:(void (^)(RCErrorCode errorcode))errorBlock;

@end
