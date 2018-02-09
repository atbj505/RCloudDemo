//
//  IMService+Contact.h
//  RCloudDemo
//
//  Created by Robert on 2018/2/8.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Contact)

/**
 添加好友

 @param targetUserId 请求目标者ID
 @param message 请求信息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)ContactRequestTargetUserId:(NSString *)targetUserId
                           message:(NSString *)message
                             extra:(NSDictionary *)extra
                           success:(sendSuccessBlock)successBlock
                             error:(sendErrorBlock)errorBlock;

/**
 同意添加好友
 
 @param targetUserId 请求目标者ID
 @param message 请求信息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)ContactAcceptResponseTargetUserId:(NSString *)targetUserId
                                  message:(NSString *)message
                                    extra:(NSDictionary *)extra
                                  success:(sendSuccessBlock)successBlock
                                    error:(sendErrorBlock)errorBlock;

/**
 拒绝添加好友
 
 @param targetUserId 请求目标者ID
 @param message 请求信息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)ContactRejectResponseTargetUserId:(NSString *)targetUserId
                                  message:(NSString *)message
                                    extra:(NSDictionary *)extra
                                  success:(sendSuccessBlock)successBlock
                                    error:(sendErrorBlock)errorBlock;
@end
