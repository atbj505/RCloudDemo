//
//  IMService+UnreadCount.m
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService+UnreadCount.h"


@implementation IMService (UnreadCount)

- (int)getUnreadCount {
    int totalUnreadCount = [[RCIMClient sharedRCIMClient] getTotalUnreadCount];
    return totalUnreadCount;
}

- (int)getUnreadCount:(RCConversationType)conversationType
             targetId:(NSString *)targetId {
    int unreadCount = [[RCIMClient sharedRCIMClient] getUnreadCount:conversationType targetId:targetId];
    return unreadCount;
}

- (NSArray *)getUnreadConverSations:(NSArray<RCConversation *> *)conversations {
    NSMutableArray *unreadCounts = [NSMutableArray arrayWithCapacity:conversations.count];
    for (RCConversation *conversation in conversations) {
        RCConversationType type = conversation.conversationType;
        NSString *targetId = conversation.targetId;

        NSInteger unreadCount = [self getUnreadCount:type targetId:targetId];
        [unreadCounts addObject:@(unreadCount)];
    }
    return unreadCounts;
}

- (void)clearMessagesUnreadStatus:(RCConversationType)conversationType
                         targetId:(NSString *)targetId {
    [[RCIMClient sharedRCIMClient] clearMessagesUnreadStatus:conversationType targetId:targetId];
}
@end
