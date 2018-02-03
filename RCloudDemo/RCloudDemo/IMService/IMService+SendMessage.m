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

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCTextMessage *textMessage = [RCTextMessage messageWithContent:content];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
                   full:(BOOL)isFull
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
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
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:imageMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
                   full:(BOOL)isFull
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:imageMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                    full:(BOOL)isFull
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
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

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:voiceMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileUserId:(NSString *)userId
               fileUrl:(NSString *)fileUrl
              progress:(sendProgressBlock)progressBlock
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:fileMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileGroupId:(NSString *)groupId
                fileUrl:(NSString *)fileUrl
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:fileMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileUserId:(NSString *)userId
       uploadedFileUrl:(NSString *)fileUrl
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:fileMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendFileGroupId:(NSString *)groupId
        uploadedFileUrl:(NSString *)fileUrl
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];

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

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

@end
