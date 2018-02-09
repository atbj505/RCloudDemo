//
//  IMService.h
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IMServiceReceiver.h"


@interface IMService : NSObject

typedef void (^sendProgressBlock)(int progress, long messageId);
typedef void (^sendSuccessBlock)(long messageId);
typedef void (^sendErrorBlock)(RCErrorCode errorcode, long messageId);

/**
 消息回调接受者
 */
@property (nonatomic, strong, readonly) IMServiceReceiver *receiver;

/**
 消息发送者用户信息
 */
@property (nonatomic, strong, readonly) RCUserInfo *userInfo;

/**
 链接状态
 */
@property (nonatomic, assign, readonly) RCConnectionStatus connectStatus;

/**
 *  单例方法
 *
 *  @return 单例对象
 */
+ (instancetype)sharedIMService;

/**
 设置消息发送者信息

 @param userId 用户ID
 @param userName 用户名称
 @param url 用户头像URL
 */
- (void)setSenderUserId:(NSString *)userId
               userName:(NSString *)userName
               photoUrl:(NSString *)url;

@end
