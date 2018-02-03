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
typedef void (^sendErrorBlock)(RCErrorCode errorcode, long messageId);


@interface IMService (SendMessage)

#pragma mark-- 文字消息
/**
 发送单人文字消息
 
 @param userId       用户ID
 @param content      文字内容
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendTextUserId:(NSString *)userId
               content:(NSString *)content
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock;

/**
 发送群聊文字消息
 
 @param groupId      群组ID
 @param content      文字内容
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

#pragma mark-- 图片消息
/**
 发送单人图片消息
 
 @param userId        用户ID
 @param image         图片（UIImage）
 @param full          是否原图
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
                   full:(BOOL)isFull
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送群聊图片消息
 
 @param groupId       群组ID
 @param image         图片（UIImage）
 @param full          是否原图
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageGroupId:(NSString *)groupId
                   image:(UIImage *)image
                    full:(BOOL)isFull
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock;

/**
 发送单人图片消息（图片上传自己服务器）
 
 @param userId        用户ID
 @param imageUrl      图片URL（图片上传成功后服务器返回的URL）
 @param full          是否原图
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
                   full:(BOOL)isFull
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送群聊图片消息（图片上传自己服务器）
 
 @param groupId       群组ID
 @param imageUrl      图片URL（图片上传成功后服务器返回的URL）
 @param full          是否原图
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                    full:(BOOL)isFull
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock;

#pragma mark-- 语音消息
/**
 发送单人语音消息
 
 @param userId       用户ID
 @param fileUrl      语音文件本地URL
 @param duration     语音长度
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendVoiceUserId:(NSString *)userId
                fileUrl:(NSString *)fileUrl
               duration:(long)duration
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送群聊语音消息
 
 @param groupId      群组ID
 @param fileUrl      语音文件本地URL
 @param duration     语音长度
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendVoiceGroupId:(NSString *)groupId
                 fileUrl:(NSString *)fileUrl
                duration:(long)duration
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock;

#pragma mark-- 文件消息
/**
 发送单人文件消息
 
 @param userId 用户ID
 @param fileUrl 文件本地URL
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)sendFileUserId:(NSString *)userId
               fileUrl:(NSString *)fileUrl
              progress:(sendProgressBlock)progressBlock
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock;

/**
 发送群组文件信息
 
 @param groupId 群组ID
 @param fileUrl 文件本地URL
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendFileGroupId:(NSString *)groupId
                fileUrl:(NSString *)fileUrl
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;


/**
 发送单人文件消息
 
 @param userId 用户ID
 @param fileUrl 文件URL（文件上传成功后服务器返回的URL）
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendFileUserId:(NSString *)userId
       uploadedFileUrl:(NSString *)fileUrl
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock;

/**
 发送群组文件消息
 
 @param groupId 群组ID
 @param fileUrl 文件URL（文件上传成功后服务器返回的URL）
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendFileGroupId:(NSString *)groupId
        uploadedFileUrl:(NSString *)fileUrl
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送@消息

 @param groupId 群组ID
 @param type @消息类型
 @param userIdList 用户列表，如果是@所有人，则传nil
 @param mentionedContent 提醒内容
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendGroupIdId:(NSString *)groupId
        mentionedType:(RCMentionedType)type
           userIdList:(NSArray *)userIdList
     mentionedContent:(NSString *)mentionedContent
              success:(sendSuccessBlock)successBlock
                error:(sendErrorBlock)errorBlock;
@end
