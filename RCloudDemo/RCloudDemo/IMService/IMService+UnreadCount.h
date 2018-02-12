//
//  IMService+UnreadCount.h
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (UnreadCount)

/**
 *  获取全部未读消息
 *
 *  @return 未读消息个数
 */
- (int)getUnreadCount;

/**
 *  获取指定会话未读消息
 *
 *  @param conversationType 会话类型
 *  @param targetId         会话ID
 *
 *  @return 未读消息个数
 */
- (int)getUnreadCount:(RCConversationType)conversationType
             targetId:(NSString *)targetId;

/**
 获取指定多个会话未读消息

 @param conversations 会话对象数组
 @return 未读消息列表
 */
- (NSArray *)getUnreadConverSations:(NSArray<RCConversation *> *)conversations;

/**
 *  清除未读消息
 *
 *  @param conversationType 会话类型
 *  @param targetId         会话ID
 */
- (void)clearMessagesUnreadStatus:(RCConversationType)conversationType
                         targetId:(NSString *)targetId;
@end
