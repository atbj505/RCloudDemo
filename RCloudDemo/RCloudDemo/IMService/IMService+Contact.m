//
//  IMService+Contact.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/8.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Contact.h"


@implementation IMService (Contact)

- (void)ContactRequestSourceUserId:(NSString *)sourceUserId
                      targetUserId:(NSString *)targetUserId
                           message:(NSString *)message
                             extra:(NSDictionary *)extra
                           success:(sendSuccessBlock)successBlock
                             error:(sendErrorBlock)errorBlock {
    [self sendContactNotificationOperation:ContactNotificationMessage_ContactOperationRequest sourceUserId:sourceUserId targetUserId:targetUserId message:message extra:extra success:successBlock error:errorBlock];
}

- (void)ContactAcceptResponseSourceUserId:(NSString *)sourceUserId
                             targetUserId:(NSString *)targetUserId
                                  message:(NSString *)message
                                    extra:(NSDictionary *)extra
                                  success:(sendSuccessBlock)successBlock
                                    error:(sendErrorBlock)errorBlock {
    [self sendContactNotificationOperation:ContactNotificationMessage_ContactOperationAcceptResponse sourceUserId:sourceUserId targetUserId:targetUserId message:message extra:extra success:successBlock error:errorBlock];
}

- (void)ContactRejectResponseSourceUserId:(NSString *)sourceUserId
                             targetUserId:(NSString *)targetUserId
                                  message:(NSString *)message
                                    extra:(NSDictionary *)extra
                                  success:(sendSuccessBlock)successBlock
                                    error:(sendErrorBlock)errorBlock {
    [self sendContactNotificationOperation:ContactNotificationMessage_ContactOperationRejectResponse sourceUserId:sourceUserId targetUserId:targetUserId message:message extra:extra success:successBlock error:errorBlock];
}

@end
