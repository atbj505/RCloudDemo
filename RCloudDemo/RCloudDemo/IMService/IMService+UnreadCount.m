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

- (void)clearMessagesUnreadStatus:(RCConversationType)conversationType
                         targetId:(NSString *)targetId {
    [[RCIMClient sharedRCIMClient] clearMessagesUnreadStatus:conversationType targetId:targetId];
}
@end
