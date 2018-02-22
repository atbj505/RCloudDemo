//
//  IMServiceReceiver.h
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMServiceReceiverDelegate <NSObject>

//收到文本消息
- (void)onReceivedTextMessage:(RCMessage *)message
                      content:(RCTextMessage *)content
                         left:(int)nLeft;

//收到图片消息
- (void)onReceivedImageMessage:(RCMessage *)message
                       content:(RCImageMessage *)content
                          left:(int)nLeft;

//收到语音消息
- (void)onReceivedVoiceMessage:(RCMessage *)message
                       content:(RCVoiceMessage *)content
                          left:(int)nLeft;

//收到文件消息
- (void)onReceivedFileMessage:(RCMessage *)message
                      content:(RCFileMessage *)content
                         left:(int)nLeft;

//收到位置消息
- (void)onReceivedLocationMessage:(RCMessage *)message
                          content:(RCLocationMessage *)content
                             left:(int)nLeft;

//收到富文本消息
- (void)onReceivedRichContentMessage:(RCMessage *)message
                             content:(RCRichContentMessage *)content
                                left:(int)nLeft;

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

/**
 连接状态改变

 @param status 连接状态
 */
- (void)onConnectStatusChanged:(RCConnectionStatus)status;

@end


@interface IMServiceReceiver : NSObject <RCIMClientReceiveMessageDelegate, RCTypingStatusDelegate, RCConnectionStatusChangeDelegate>

@property (nonatomic, weak) id<IMServiceReceiverDelegate> delegate;

@end
