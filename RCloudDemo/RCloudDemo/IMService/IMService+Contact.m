//
//  IMService+Contact.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/8.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Contact.h"
#import "IMService+SendMessage.h"


@implementation IMService (Contact)

- (void)ContactRequestTargetUserId:(NSString *)targetUserId
                           message:(NSString *)message
                             extra:(NSDictionary *)extra
                           success:(sendSuccessBlock)successBlock
                             error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;
    [self sendContactNotificationOperation:ContactNotificationMessage_ContactOperationRequest sourceUserId:currentUserId targetUserId:targetUserId message:message extra:extra success:successBlock error:errorBlock];
}

- (void)ContactAcceptResponseTargetUserId:(NSString *)targetUserId
                                  message:(NSString *)message
                                    extra:(NSDictionary *)extra
                                  success:(sendSuccessBlock)successBlock
                                    error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;
    [self sendContactNotificationOperation:ContactNotificationMessage_ContactOperationAcceptResponse sourceUserId:currentUserId targetUserId:targetUserId message:message extra:extra success:successBlock error:errorBlock];
}

- (void)ContactRejectResponseTargetUserId:(NSString *)targetUserId
                                  message:(NSString *)message
                                    extra:(NSDictionary *)extra
                                  success:(sendSuccessBlock)successBlock
                                    error:(sendErrorBlock)errorBlock {
    NSString *currentUserId = [RCIMClient sharedRCIMClient].currentUserInfo.userId;
    [self sendContactNotificationOperation:ContactNotificationMessage_ContactOperationRejectResponse sourceUserId:currentUserId targetUserId:targetUserId message:message extra:extra success:successBlock error:errorBlock];
}

@end
