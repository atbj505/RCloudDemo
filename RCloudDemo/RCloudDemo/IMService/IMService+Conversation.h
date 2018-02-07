//
//  IMService+Conversation.h
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Conversation)

/**
 获取会话列表
 
 @return 会话列表
 */
- (NSArray *)getConversationLists;

/**
 获取指定会话
 
 @param conversationType 会话类型
 @param targetId         会话ID
 @return 会话对象
 */
- (RCConversation *)getConversation:(RCConversationType)conversationType
                           targetId:(NSString *)targetId;

/**
 根据关键字搜索

 @param keyword 关键字
 @return 搜索结果
 */
- (NSArray<RCSearchConversationResult *> *)searchConversationskeyword:(NSString *)keyword;

/**
 删除会话

 @param conversationType 会话类型
 @param targetId 会话ID
 @param isDeleteMessage 是否删除回话中的消息
 @param isSync 是否与服务器同步删除除
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)deleteConversation:(RCConversationType)conversationType
                  targetId:(NSString *)targetId
             deletemessage:(BOOL)isDeleteMessage
                      sync:(BOOL)isSync
                   success:(void (^)(void))successBlock
                     error:(void (^)(RCErrorCode status))errorBlock;

/**
 消息置顶

 @param conversationType 会话类型
 @param targetId 会话ID
 @param isTop 是否置顶
 @return 置顶是否成功
 */
- (BOOL)setConversationToTop:(RCConversationType)conversationType
                    targetId:(NSString *)targetId
                       isTop:(BOOL)isTop;

#pragma mark - 草稿

/**
 获取草稿

 @param conversationType 会话类型
 @param targetId 会话ID
 @return 草稿
 */
- (NSString *)getTextMessageDraft:(RCConversationType)conversationType
                         targetId:(NSString *)targetId;

/**
 保存草稿

 @param conversationType 会话类型
 @param targetId 会话ID
 @param content 草稿内容
 @return 存储是否成功
 */
- (BOOL)saveTextMessageDraft:(RCConversationType)conversationType
                    targetId:(NSString *)targetId
                     content:(NSString *)content;

/**
 删除会话中的草稿

 @param conversationType 会话类型
 @param targetId 会话ID
 @return 清除是否成功
 */
- (BOOL)clearTextMessageDraft:(RCConversationType)conversationType
                     targetId:(NSString *)targetId;

#pragma mark - 提醒状态

/**
 设置会话提醒状态

 @param conversationType 会话类型
 @param targetId 会话ID
 @param successBlock 成功回调
 @param errorBlock 失败回调
 
 *调用后会改变会话现有状态，免打扰->接受提醒 接受提醒->免打扰
 
 */
- (void)setConversationNotificationStatus:(RCConversationType)conversationType
                                 targetId:(NSString *)targetId
                                  success:(void (^)(RCConversationNotificationStatus nStatus))successBlock
                                    error:(void (^)(RCErrorCode status))errorBlock;

/**
 查询会话提醒状态

 @param conversationType 会话类型
 @param targetId 会话ID
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)getConversationNotificationStatus:(RCConversationType)conversationType
                                 targetId:(NSString *)targetId
                                  success:(void (^)(RCConversationNotificationStatus nStatus))successBlock
                                    error:(void (^)(RCErrorCode status))errorBlock;

/**
 屏蔽某个时间段的消息提醒（全局）

 @param startTime 开始时间HH:MM:SS
 @param spanMins 持续时间（分钟 (0, 1440)）
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)setNotificationQuietHours:(NSString *)startTime
                         spanMins:(int)spanMins
                          success:(void (^)())successBlock
                            error:(void (^)(RCErrorCode status))errorBlock;

/**
 查询消息屏蔽时间段设置（全局）

 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)getNotificationQuietHours:(void (^)(NSString *startTime, int spansMin))successBlock
                            error:(void (^)(RCErrorCode status))errorBlock;


/**
 删除消息时间段屏蔽（全局）

 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)removeNotificationQuietHours:(void (^)())successBlock
                               error:(void (^)(RCErrorCode status))errorBlock;

#pragma mark - 输入状态

/**
 发送输入状态

 @param conversationType 会话类型
 @param targetId 会话ID
 @param objectName 消息类型
 */
- (void)sendTypingStatus:(RCConversationType)conversationType
                targetId:(NSString *)targetId
             contentType:(NSString *)objectName;

#pragma mark - 多端阅读消息数同步

/**
 多端阅读消息数同步 点击进入会话或者退出会话的时候调用

 @param conversationType 会话类型
 @param targetId 会话ID
 @param timestamp 已经阅读的最后一条消息的时间戳
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)syncConversationReadStatus:(RCConversationType)conversationType
                          targetId:(NSString *)targetId
                              time:(long long)timestamp
                           success:(void (^)())successBlock
                             error:(void (^)(RCErrorCode nErrorCode))errorBlock;
@end
