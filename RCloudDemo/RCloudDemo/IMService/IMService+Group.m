//
//  IMService+Group.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/7.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Group.h"
#import "IMService+SendMessage.h"


@implementation IMService (Group)

- (void)groupOperationAddGroupId:(NSString *)groupId
                            data:(NSString *)data
                         message:(NSString *)message
                           extra:(NSDictionary *)extra
                         success:(sendSuccessBlock)successBlock
                           error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;

    [self sendGroupNotificationGroupId:groupId Operation:GroupNotificationMessage_GroupOperationAdd operatorUserId:currentUserId data:data message:message extra:extra success:successBlock error:errorBlock];
}

- (void)groupOperationQuitGroupId:(NSString *)groupId
                             data:(NSString *)data
                          message:(NSString *)message
                            extra:(NSDictionary *)extra
                          success:(sendSuccessBlock)successBlock
                            error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;

    [self sendGroupNotificationGroupId:groupId Operation:GroupNotificationMessage_GroupOperationQuit operatorUserId:currentUserId data:data message:message extra:extra success:successBlock error:errorBlock];
}

- (void)groupOperationKickedGroupId:(NSString *)groupId
                               data:(NSString *)data
                            message:(NSString *)message
                              extra:(NSDictionary *)extra
                            success:(sendSuccessBlock)successBlock
                              error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;

    [self sendGroupNotificationGroupId:groupId Operation:GroupNotificationMessage_GroupOperationKicked operatorUserId:currentUserId data:data message:message extra:extra success:successBlock error:errorBlock];
}

- (void)groupOperationRenameGroupId:(NSString *)groupId
                               data:(NSString *)data
                            message:(NSString *)message
                              extra:(NSDictionary *)extra
                            success:(sendSuccessBlock)successBlock
                              error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;

    [self sendGroupNotificationGroupId:groupId Operation:GroupNotificationMessage_GroupOperationRename operatorUserId:currentUserId data:data message:message extra:extra success:successBlock error:errorBlock];
}

- (void)groupOperationBulletinGroupId:(NSString *)groupId
                                 data:(NSString *)data
                              message:(NSString *)message
                                extra:(NSDictionary *)extra
                              success:(sendSuccessBlock)successBlock
                                error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;

    [self sendGroupNotificationGroupId:groupId Operation:GroupNotificationMessage_GroupOperationBulletin operatorUserId:currentUserId data:data message:message extra:extra success:successBlock error:errorBlock];
}

@end
