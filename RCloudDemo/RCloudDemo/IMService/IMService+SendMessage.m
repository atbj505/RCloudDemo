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
                 error:(sendErrorBlock)errorBlock {
    RCTextMessage *textMessage = [RCTextMessage messageWithContent:content];
    textMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCTextMessage *textMessage = [RCTextMessage messageWithContent:content];
    textMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
                   full:(BOOL)isFull
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
    imageMessage.senderUserInfo = self.userInfo;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:imageMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendImageGroupId:(NSString *)groupId
                   image:(UIImage *)image
                    full:(BOOL)isFull
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
    imageMessage.senderUserInfo = self.userInfo;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:imageMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
                   full:(BOOL)isFull
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    imageMessage.senderUserInfo = self.userInfo;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:imageMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                    full:(BOOL)isFull
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    imageMessage.senderUserInfo = self.userInfo;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:imageMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendVoiceUserId:(NSString *)userId
                fileUrl:(NSString *)fileUrl
               duration:(long)duration
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileUrl]];

    RCVoiceMessage *voiceMessage = [RCVoiceMessage messageWithAudio:data duration:duration];
    voiceMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:voiceMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendVoiceGroupId:(NSString *)groupId
                 fileUrl:(NSString *)fileUrl
                duration:(long)duration
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileUrl]];

    RCVoiceMessage *voiceMessage = [RCVoiceMessage messageWithAudio:data duration:duration];
    voiceMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:voiceMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileUserId:(NSString *)userId
               fileUrl:(NSString *)fileUrl
              progress:(sendProgressBlock)progressBlock
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:fileMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileGroupId:(NSString *)groupId
                fileUrl:(NSString *)fileUrl
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:fileMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileUserId:(NSString *)userId
       uploadedFileUrl:(NSString *)fileUrl
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:fileMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendFileGroupId:(NSString *)groupId
        uploadedFileUrl:(NSString *)fileUrl
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:fileMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendGroupIdId:(NSString *)groupId
        mentionedType:(RCMentionedType)type
           userIdList:(NSArray *)userIdList
     mentionedContent:(NSString *)mentionedContent
              success:(sendSuccessBlock)successBlock
                error:(sendErrorBlock)errorBlock {
    RCMentionedInfo *mentionInfo = [[RCMentionedInfo alloc] initWithMentionedType:type userIdList:userIdList mentionedContent:mentionedContent];

    RCTextMessage *textMessage = [RCTextMessage messageWithContent:mentionedContent];
    textMessage.mentionedInfo = mentionInfo;
    textMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendReadReceiptMessage:(RCConversationType)conversationType
                      targetId:(NSString *)targetId
                       message:(RCMessage *)lastMessage
                       success:(void (^)(void))successBlock
                         error:(void (^)(RCErrorCode errorcode))errorBlock {
    long long time = lastMessage.sentTime;
    [[RCIMClient sharedRCIMClient] sendReadReceiptMessage:conversationType targetId:targetId time:time success:successBlock error:errorBlock];
}

- (void)sendReadReceiptRequest:(RCMessage *)message
                       success:(void (^)())successBlock
                         error:(void (^)(RCErrorCode nErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] sendReadReceiptRequest:message success:successBlock error:errorBlock];
}

- (void)sendReadReceiptResponse:(RCConversationType)conversationType
                       targetId:(NSString *)targetId
                    messageList:(NSArray<RCMessage *> *)messageList
                        success:(void (^)(void))successBlock
                          error:(void (^)(RCErrorCode nErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] sendReadReceiptResponse:conversationType targetId:targetId messageList:messageList success:successBlock error:errorBlock];
}

@end
