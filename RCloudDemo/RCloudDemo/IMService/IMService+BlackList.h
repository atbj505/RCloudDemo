//
//  IMService+BlackList.h
//  RCloudDemo
//
//  Created by Robert on 2018/2/7.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (BlackList)

/**
 查询黑名单

 @param successBlock 成功回调 返回黑名单中用户ID列表
 @param errorBlock 失败回调
 */
- (void)getBlacklist:(void (^)(NSArray *blockUserIds))successBlock
               error:(void (^)(RCErrorCode status))errorBlock;

/**
 查询某用户是否在黑名单中

 @param userId 用户ID
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)getBlacklistStatus:(NSString *)userId
                   success:(void (^)(BOOL status))successBlock
                     error:(void (^)(RCErrorCode status))errorBlock;

/**
 添加某个用户到黑名单中

 @param userId 用户ID
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)addToBlacklist:(NSString *)userId
               success:(void (^)())successBlock
                 error:(void (^)(RCErrorCode status))errorBlock;

/**
 移除黑名单中的某个用户

 @param userId 用户ID
 @param successBlock 成功回调
 @param errorBlock 失败回调
 */
- (void)removeFromBlacklist:(NSString *)userId
                    success:(void (^)())successBlock
                      error:(void (^)(RCErrorCode status))errorBlock;
@end
