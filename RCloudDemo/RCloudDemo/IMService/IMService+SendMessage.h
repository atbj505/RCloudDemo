//
//  IMService+SendMessage.h
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (SendMessage)

#pragma mark - 文字消息
/**
 发送单人文字消息
 
 @param userId       用户ID
 @param content      文字内容
 @param extra        附加信息
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendTextUserId:(NSString *)userId
               content:(NSString *)content
                 extra:(NSDictionary *)extra
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock;

/**
 发送群聊文字消息
 
 @param groupId      群组ID
 @param content      文字内容
 @param extra        附加信息
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                  extra:(NSDictionary *)extra
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

#pragma mark - 图片消息
/**
 发送单人图片消息
 
 @param userId        用户ID
 @param image         图片（UIImage）
 @param full          是否原图
 @param extra         附加信息
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
                   full:(BOOL)isFull
                  extra:(NSDictionary *)extra
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送群聊图片消息
 
 @param groupId       群组ID
 @param image         图片（UIImage）
 @param full          是否原图
 @param extra         附加信息
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageGroupId:(NSString *)groupId
                   image:(UIImage *)image
                    full:(BOOL)isFull
                   extra:(NSDictionary *)extra
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock;

/**
 发送单人图片消息（图片上传自己服务器）
 
 @param userId        用户ID
 @param imageUrl      图片URL（图片上传成功后服务器返回的URL）
 @param full          是否原图
 @param extra         附加信息
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
                   full:(BOOL)isFull
                  extra:(NSDictionary *)extra
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送群聊图片消息（图片上传自己服务器）
 
 @param groupId       群组ID
 @param imageUrl      图片URL（图片上传成功后服务器返回的URL）
 @param full          是否原图
 @param extra         附加信息
 @param progressBlock 进度回调
 @param successBlock  成功回调
 @param errorBlock    失败回调
 */
- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                    full:(BOOL)isFull
                   extra:(NSDictionary *)extra
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock;

#pragma mark - 语音消息
/**
 发送单人语音消息
 
 @param userId       用户ID
 @param fileUrl      语音文件本地URL
 @param duration     语音长度
 @param extra         附加信息
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendVoiceUserId:(NSString *)userId
                fileUrl:(NSString *)fileUrl
               duration:(long)duration
                  extra:(NSDictionary *)extra
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

/**
 发送群聊语音消息
 
 @param groupId      群组ID
 @param fileUrl      语音文件本地URL
 @param duration     语音长度
 @param extra         附加信息
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock   失败回调
 */
- (void)sendVoiceGroupId:(NSString *)groupId
                 fileUrl:(NSString *)fileUrl
                duration:(long)duration
                   extra:(NSDictionary *)extra
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock;

#pragma mark - 文件消息
/**
 发送单人文件消息
 
 @param userId 用户ID
 @param fileUrl 文件本地URL
 @param extra 附加信息
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock  失败回调
 */
- (void)sendFileUserId:(NSString *)userId
               fileUrl:(NSString *)fileUrl
                 extra:(NSDictionary *)extra
              progress:(sendProgressBlock)progressBlock
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock;

/**
 发送群组文件信息
 
 @param groupId 群组ID
 @param fileUrl 文件本地URL
 @param extra 附加信息
 @param progressBlock 进度回调
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendFileGroupId:(NSString *)groupId
                fileUrl:(NSString *)fileUrl
                  extra:(NSDictionary *)extra
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;


/**
 发送单人文件消息
 
 @param userId 用户ID
 @param fileUrl 文件URL（文件上传成功后服务器返回的URL）
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendFileUserId:(NSString *)userId
       uploadedFileUrl:(NSString *)fileUrl
                 extra:(NSDictionary *)extra
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock;

/**
 发送群组文件消息
 
 @param groupId 群组ID
 @param fileUrl 文件URL（文件上传成功后服务器返回的URL）
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendFileGroupId:(NSString *)groupId
        uploadedFileUrl:(NSString *)fileUrl
                  extra:(NSDictionary *)extra
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock;

#pragma mark - 位置消息

/**
 发送单人位置信息

 @param userId 用户ID
 @param location 经纬度
 @param name 位置名称
 @param image 位置图片
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendLocationUserId:(NSString *)userId
                  location:(CLLocationCoordinate2D)location
              locationName:(NSString *)name
            thumbnailImage:(UIImage *)image
                     extra:(NSDictionary *)extra
                   success:(sendSuccessBlock)successBlock
                     error:(sendErrorBlock)errorBlock;

/**
 发送群组位置信息
 
 @param groupId 群组ID
 @param location 经纬度
 @param name 位置名称
 @param image 位置图片
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendLocationGroupId:(NSString *)groupId
                   location:(CLLocationCoordinate2D)location
               locationName:(NSString *)name
             thumbnailImage:(UIImage *)image
                      extra:(NSDictionary *)extra
                    success:(sendSuccessBlock)successBlock
                      error:(sendErrorBlock)errorBlock;

#pragma mark - 富文本消息

/**
 发送单人富文本消息

 @param userId 用户ID
 @param title 标题
 @param digest 内容概述
 @param imageURL 图片URL
 @param url 链接URL
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendRichContentUserId:(NSString *)userId
                        title:(NSString *)title
                       digest:(NSString *)digest
                     imageURL:(NSString *)imageURL
                          url:(NSString *)url
                        extra:(NSDictionary *)extra
                      success:(sendSuccessBlock)successBlock
                        error:(sendErrorBlock)errorBlock;

/**
 发送群组富文本消息
 
 @param groupId 群组ID
 @param title 标题
 @param digest 内容概述
 @param imageURL 图片URL
 @param url 链接URL
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendRichContentGroupId:(NSString *)groupId
                         title:(NSString *)title
                        digest:(NSString *)digest
                      imageURL:(NSString *)imageURL
                           url:(NSString *)url
                         extra:(NSDictionary *)extra
                       success:(sendSuccessBlock)successBlock
                         error:(sendErrorBlock)errorBlock;

#pragma mark - 命令消息

/**
 发送单人命令消息

 @param userId 用户ID
 @param name 命令名
 @param data 命令数据（字典 -> json字符串）
 @param isSave 是否存储
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendCommandUserId:(NSString *)userId
                     name:(NSString *)name
                     data:(NSDictionary *)data
                     save:(BOOL)isSave
                  success:(sendSuccessBlock)successBlock
                    error:(sendErrorBlock)errorBlock;

/**
 发送群组命令信息

 @param groupId 群组ID
 @param name 命令名
 @param data 命令数据（字典 -> json字符串）
 @param isSave 是否存储
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendCommandGroupId:(NSString *)groupId
                      name:(NSString *)name
                      data:(NSDictionary *)data
                      save:(BOOL)isSave
                   success:(sendSuccessBlock)successBlock
                     error:(sendErrorBlock)errorBlock;

#pragma mark - 好友请求消息

/**
 好友请求消息

 @param operation 操作类型
 @param sourceUserId 请求发起者ID
 @param targetUserId 请求目标者ID
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendContactNotificationOperation:(NSString *)operation
                            sourceUserId:(NSString *)sourceUserId
                            targetUserId:(NSString *)targetUserId
                                 message:(NSString *)message
                                   extra:(NSDictionary *)extra
                                 success:(sendSuccessBlock)successBlock
                                   error:(sendErrorBlock)errorBlock;

#pragma mark - 群组通知消息

/**
 群组通知消息

 @param groupID 群组ID
 @param operation 操作类型
 @param operatorUserId 操作发起用户ID
 @param data 目标数据（想要修改的数据）
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendGroupNotificationGroupId:(NSString *)groupId
                           Operation:(NSString *)operation
                      operatorUserId:(NSString *)operatorUserId
                                data:(NSString *)data
                             message:(NSString *)message
                               extra:(NSDictionary *)extra
                             success:(sendSuccessBlock)successBlock
                               error:(sendErrorBlock)errorBlock;

#pragma mark - @消息
/**
 发送@消息

 @param groupId 群组ID
 @param type @消息类型
 @param userIdList 用户列表，如果是@所有人，则传nil
 @param mentionedContent 提醒内容
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendGroupId:(NSString *)groupId
      mentionedType:(RCMentionedType)type
         userIdList:(NSArray *)userIdList
   mentionedContent:(NSString *)mentionedContent
              extra:(NSDictionary *)extra
            success:(sendSuccessBlock)successBlock
              error:(sendErrorBlock)errorBlock;

#pragma mark - 发送消息已读

/**
 单聊消息已读回执
 
 @param conversationType 会话类型
 @param targetId 会话ID
 @param lastMessage 最后一条信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendReadReceiptMessage:(RCConversationType)conversationType
                      targetId:(NSString *)targetId
                       message:(RCMessage *)lastMessage
                       success:(void (^)(void))successBlock
                         error:(void (^)(RCErrorCode errorcode))errorBlock;

/**
 群组消息请求该信息需要回执，读之后需要收到阅读回执的消息

 @param message 消息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendReadReceiptRequest:(RCMessage *)message
                       success:(void (^)())successBlock
                         error:(void (^)(RCErrorCode nErrorCode))errorBlock;

/**
 群组消息已阅回执

 @param conversationType 会话类型
 @param targetId 会话ID
 @param messageList 消息列表
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)sendReadReceiptResponse:(RCConversationType)conversationType
                       targetId:(NSString *)targetId
                    messageList:(NSArray<RCMessage *> *)messageList
                        success:(void (^)(void))successBlock
                          error:(void (^)(RCErrorCode nErrorCode))errorBlock;
@end
