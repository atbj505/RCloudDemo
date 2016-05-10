//
//  IMService+SendMessage.h
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"

typedef void (^sendProgressBlock)(int progress, long messageId);
typedef void (^sendSuccessBlock)(long messageId);
typedef void (^sendFailBlock)(RCErrorCode errorcode, long messageId);

@interface IMService (SendMessage)

/**
 *  发送单人文字消息
 *
 *  @param userId       用户ID
 *  @param content      文字内容
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
- (void)sendTextUserId:(NSString *)userId
               content:(NSString *)content
               success:(sendSuccessBlock)successBlock
                  fail:(sendFailBlock)failBlock;

/**
 *  发送群聊文字消息
 *
 *  @param groupId      群组ID
 *  @param content      文字内容
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock;

/**
 *  发送单人图片消息
 *
 *  @param userId        用户ID
 *  @param image         图片（UIImage）
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 */
- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock;

/**
 *  发送群聊图片消息
 *
 *  @param groupId       群组ID
 *  @param image         图片（UIImage）
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 */
- (void)sendImageGroupId:(NSString *)groupId
                   image:(UIImage *)image
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                    fail:(sendFailBlock)failBlock;

/**
 *  发送单人图片消息（图片上传自己服务器）
 *
 *  @param userId        用户ID
 *  @param imageUrl      图片URL（图片上传成功后服务器返回的URL）
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 */
- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock;

/**
 *  发送群聊图片消息（图片上传自己服务器）
 *
 *  @param groupId       群组ID
 *  @param imageUrl      图片URL（图片上传成功后服务器返回的URL）
 *  @param progressBlock 进度回调
 *  @param successBlock  成功回调
 *  @param failBlock     失败回调
 */
- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                    fail:(sendFailBlock)failBlock;

/**
 *  发送单人语音消息
 *
 *  @param userId       用户ID
 *  @param fileUrl      语音文件本地URL
 *  @param duration     语音长度
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
- (void)sendVoiceUserId:(NSString *)userId
                fileUrl:(NSString *)fileUrl
               duration:(long)duration
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock;

/**
 *  发送群聊语音消息
 *
 *  @param groupId      群组ID
 *  @param fileUrl      语音文件本地URL
 *  @param duration     语音长度
 *  @param successBlock 成功回调
 *  @param failBlock    失败回调
 */
- (void)sendGroupVoiceGroupId:(NSString *)groupId
                      fileUrl:(NSString *)fileUrl
                     duration:(long)duration
                      success:(sendSuccessBlock)successBlock
                         fail:(sendFailBlock)failBlock;

@end
