//
//  IMService+Conversation.h
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Conversation)

/**
 *  获取会话列表
 *
 *  @return 会话列表
 */
- (NSArray *)getConversationLists;

/**
 *  获取指定会话
 *
 *  @param conversationType 会话类型
 *  @param targetId         会话ID
 *
 *  @return 会话对象
 */
- (RCConversation *)getConversation:(RCConversationType)conversationType
                           targetId:(NSString *)targetId;

@end
