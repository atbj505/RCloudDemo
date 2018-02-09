//
//  IMService+Group.h
//  RCloudDemo
//
//  Created by Robert on 2018/2/7.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Group)

/**
 发送加入群组通知

 @param groupId 群组ID
 @param data 目标数据
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)groupOperationAddGroupId:(NSString *)groupId
                            data:(NSString *)data
                         message:(NSString *)message
                           extra:(NSDictionary *)extra
                         success:(sendSuccessBlock)successBlock
                           error:(sendErrorBlock)errorBlock;

/**
 发送退出群组通知
 
 @param groupId 群组ID
 @param data 目标数据
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)groupOperationQuitGroupId:(NSString *)groupId
                             data:(NSString *)data
                          message:(NSString *)message
                            extra:(NSDictionary *)extra
                          success:(sendSuccessBlock)successBlock
                            error:(sendErrorBlock)errorBlock;

/**
 发送被踢出群组通知

 @param groupId 群组ID
 @param data 目标数据
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)groupOperationKickedGroupId:(NSString *)groupId
                               data:(NSString *)data
                            message:(NSString *)message
                              extra:(NSDictionary *)extra
                            success:(sendSuccessBlock)successBlock
                              error:(sendErrorBlock)errorBlock;

/**
 发送群组改名通知
 
 @param groupId 群组ID
 @param data 目标数据
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)groupOperationRenameGroupId:(NSString *)groupId
                               data:(NSString *)data
                            message:(NSString *)message
                              extra:(NSDictionary *)extra
                            success:(sendSuccessBlock)successBlock
                              error:(sendErrorBlock)errorBlock;
/**
 发送群组公告变更通知
 
 @param groupId 群组ID
 @param data 目标数据
 @param message 请求消息
 @param extra 附加信息
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)groupOperationBulletinGroupId:(NSString *)groupId
                                 data:(NSString *)data
                              message:(NSString *)message
                                extra:(NSDictionary *)extra
                              success:(sendSuccessBlock)successBlock
                                error:(sendErrorBlock)errorBlock;

@end
