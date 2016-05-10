//
//  IMService+SendMessage.m
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService+SendMessage.h"

@implementation IMService (SendMessage)

- (void)sendTextUserId:(NSString *)userId
               content:(NSString *)content
               success:(sendSuccessBlock)successBlock
                  fail:(sendFailBlock)failBlock {
    RCTextMessage *testMessage = [RCTextMessage messageWithContent:content];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE
                                      targetId:userId
                                       content:testMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock {
    RCTextMessage *testMessage = [RCTextMessage messageWithContent:content];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP
                                      targetId:groupId
                                       content:testMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
    
    [[RCIMClient sharedRCIMClient] sendImageMessage:ConversationType_PRIVATE
                                           targetId:userId
                                            content:imageMessage
                                        pushContent:nil
                                           pushData:nil
                                           progress:^(int progress, long messageId) {
                                               if (progressBlock) {
                                                   progressBlock(progress, messageId);
                                               }
                                           } success:^(long messageId) {
                                               if (successBlock) {
                                                   successBlock(messageId);
                                               }
                                           } error:^(RCErrorCode errorCode, long messageId) {
                                               if (failBlock) {
                                                   failBlock(errorCode, messageId);
                                               }
                                           }];
}

- (void)sendImageGroupId:(NSString *)groupId
                   image:(UIImage *)image
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                    fail:(sendFailBlock)failBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
    
    [[RCIMClient sharedRCIMClient] sendImageMessage:ConversationType_GROUP
                                           targetId:groupId
                                            content:imageMessage
                                        pushContent:nil
                                           pushData:nil
                                           progress:^(int progress, long messageId) {
                                               if (progressBlock) {
                                                   progressBlock(progress, messageId);
                                               }
                                           } success:^(long messageId) {
                                               if (successBlock) {
                                                   successBlock(messageId);
                                               }
                                           } error:^(RCErrorCode errorCode, long messageId) {
                                               if (failBlock) {
                                                   failBlock(errorCode, messageId);
                                               }
                                           }];
}

- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE
                                      targetId:userId
                                       content:imageMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                    fail:(sendFailBlock)failBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP
                                      targetId:groupId
                                       content:imageMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

- (void)sendVoiceUserId:(NSString *)userId
                fileUrl:(NSString *)fileUrl
               duration:(long)duration
                success:(sendSuccessBlock)successBlock
                   fail:(sendFailBlock)failBlock; {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileUrl]];
    
    RCVoiceMessage *voiceMessage = [RCVoiceMessage messageWithAudio:data duration:duration];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE
                                      targetId:userId
                                       content:voiceMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

- (void)sendGroupVoiceGroupId:(NSString *)groupId
                      fileUrl:(NSString *)fileUrl
                     duration:(long)duration
                      success:(sendSuccessBlock)successBlock
                         fail:(sendFailBlock)failBlock {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileUrl]];
    
    RCVoiceMessage *voiceMessage = [RCVoiceMessage messageWithAudio:data duration:duration];
    
    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP
                                      targetId:groupId
                                       content:voiceMessage
                                   pushContent:nil
                                      pushData:nil
                                       success:^(long messageId) {
                                           if (successBlock) {
                                               successBlock(messageId);
                                           }
                                       } error:^(RCErrorCode nErrorCode, long messageId) {
                                           if (failBlock) {
                                               failBlock(nErrorCode, messageId);
                                           }
                                       }];
}

@end
