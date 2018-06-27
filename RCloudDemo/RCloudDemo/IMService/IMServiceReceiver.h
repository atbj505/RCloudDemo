//
//  IMServiceReceiver.h
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>


typedef NS_ENUM(NSUInteger, IMServiceMessageType) {
    IMServiceTextMessage = 0,
    IMServiceImageMessage,
    IMServiceVoiceMessage,
    IMServiceFileMessage,
    IMServiceLocationMessage,
    IMServiceRichContentMessage,
    IMServiceCommandMessage,
    IMServiceContactNotificationMessage,
    IMServiceGroupNotificationMessage
};

@protocol IMServiceReceiverMessageDelegate <NSObject>

@optional
//收到消息
- (void)onReceivedMessage:(RCMessage *)message
                     type:(IMServiceMessageType)type
                     left:(int)left;

//收到消息撤回
- (void)onReceivedRecalledMessage:(RCMessage *)message
                          content:(RCRecallNotificationMessage *)content;

/**
 收到用户输入状态改变

 @param conversationType 会话类型
 @param targetId 会话ID
 @param userId 用户ID
 @param contentType 正在输入的消息类型名
 RCTextMessageTypeIdentifier -> 文本类型
 RCImageMessageTypeIdentifier -> 图片类型
 RCVoiceMessageTypeIdentifier -> 语音类型
 RCFileMessageTypeIdentifier -> 文件类型
 */
- (void)onReceivedTypingStatusChanged:(RCConversationType)conversationType
                             targetId:(NSString *)targetId
                               userId:(NSString *)userId
                          contentType:(NSString *)contentType;

/**
 收到单聊信息已读信息

 @param conversationType 会话类型
 @param targetId 会话ID
 @param time 已读时间
 */
- (void)onReceivedReadReceiptMessage:(RCConversationType)conversationType
                            targetId:(NSString *)targetId
                                time:(long long)time;

/**
 收到群组消息已读请求

 @param conversationType 会话类型
 @param targetId 会话ID
 @param message 消息
 */
- (void)onReceivedMessageReceiptRequest:(RCConversationType)conversationType
                               targetId:(NSString *)targetId
                                message:(RCMessage *)message;

/**
 收到群组消息已读回执

 @param conversationType 会话类型
 @param targetId 会话ID
 @param message 消息
 @param userIdList 用户列表
 */
- (void)onReceivedMessageReceiptResponse:(RCConversationType)conversationType
                                targetId:(NSString *)targetId
                                 message:(RCMessage *)message
                              readerList:(NSMutableDictionary *)userIdList;
@end

@protocol IMServiceConnectDelegate <NSObject>
/**
 连接状态改变

 @param status 连接状态
 */
- (void)onConnectStatusChanged:(RCConnectionStatus)status;

@end


@interface IMServiceReceiver : NSObject <RCIMClientReceiveMessageDelegate, RCTypingStatusDelegate, RCConnectionStatusChangeDelegate>

- (void)addMessageDelegate:(id<IMServiceReceiverMessageDelegate>)delegate forTargetId:(NSString *)targetId delegateQueue:(dispatch_queue_t)delegateQueue;

- (void)removeMessageDelegate:(NSString *)targetId;

- (void)removeAllDelegate;

- (void)setConnectionStatusDelegate:(id<IMServiceConnectDelegate>)delegate;

@end
