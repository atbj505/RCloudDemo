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
                 extra:(NSDictionary *)extra
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCTextMessage *textMessage = [RCTextMessage messageWithContent:content];
    textMessage.senderUserInfo = self.userInfo;
    textMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendTextGroupId:(NSString *)groupId
                content:(NSString *)content
                  extra:(NSDictionary *)extra
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCTextMessage *textMessage = [RCTextMessage messageWithContent:content];
    textMessage.senderUserInfo = self.userInfo;
    textMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:textMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendImageUserId:(NSString *)userId
                  image:(UIImage *)image
                   full:(BOOL)isFull
                  extra:(NSDictionary *)extra
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
    imageMessage.senderUserInfo = self.userInfo;
    imageMessage.extra = extraStr;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:imageMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendImageGroupId:(NSString *)groupId
                   image:(UIImage *)image
                    full:(BOOL)isFull
                   extra:(NSDictionary *)extra
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCImageMessage *imageMessage = [RCImageMessage messageWithImage:image];
    imageMessage.senderUserInfo = self.userInfo;
    imageMessage.extra = extraStr;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:imageMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendImageUserId:(NSString *)userId
               imageUrl:(NSString *)imageUrl
                   full:(BOOL)isFull
                  extra:(NSDictionary *)extra
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    imageMessage.senderUserInfo = self.userInfo;
    imageMessage.extra = extraStr;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:imageMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendImageGroupId:(NSString *)groupId
                imageUrl:(NSString *)imageUrl
                    full:(BOOL)isFull
                   extra:(NSDictionary *)extra
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCImageMessage *imageMessage = [RCImageMessage messageWithImageURI:imageUrl];
    imageMessage.senderUserInfo = self.userInfo;
    imageMessage.extra = extraStr;
    [imageMessage setFull:isFull];

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:imageMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendVoiceUserId:(NSString *)userId
                fileUrl:(NSString *)fileUrl
               duration:(long)duration
                  extra:(NSDictionary *)extra
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileUrl]];

    RCVoiceMessage *voiceMessage = [RCVoiceMessage messageWithAudio:data duration:duration];
    voiceMessage.senderUserInfo = self.userInfo;
    voiceMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:voiceMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendVoiceGroupId:(NSString *)groupId
                 fileUrl:(NSString *)fileUrl
                duration:(long)duration
                   extra:(NSDictionary *)extra
                progress:(sendProgressBlock)progressBlock
                 success:(sendSuccessBlock)successBlock
                   error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    NSData *data = [NSData dataWithContentsOfURL:[NSURL fileURLWithPath:fileUrl]];

    RCVoiceMessage *voiceMessage = [RCVoiceMessage messageWithAudio:data duration:duration];
    voiceMessage.senderUserInfo = self.userInfo;
    voiceMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:voiceMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileUserId:(NSString *)userId
               fileUrl:(NSString *)fileUrl
                 extra:(NSDictionary *)extra
              progress:(sendProgressBlock)progressBlock
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;
    fileMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_PRIVATE targetId:userId content:fileMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileGroupId:(NSString *)groupId
                fileUrl:(NSString *)fileUrl
                  extra:(NSDictionary *)extra
               progress:(sendProgressBlock)progressBlock
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;
    fileMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMediaMessage:ConversationType_GROUP targetId:groupId content:fileMessage pushContent:nil pushData:nil progress:progressBlock success:successBlock error:errorBlock cancel:nil];
}

- (void)sendFileUserId:(NSString *)userId
       uploadedFileUrl:(NSString *)fileUrl
                 extra:(NSDictionary *)extra
               success:(sendSuccessBlock)successBlock
                 error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;
    fileMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:fileMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendFileGroupId:(NSString *)groupId
        uploadedFileUrl:(NSString *)fileUrl
                  extra:(NSDictionary *)extra
                success:(sendSuccessBlock)successBlock
                  error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCFileMessage *fileMessage = [RCFileMessage messageWithFile:fileUrl];
    fileMessage.senderUserInfo = self.userInfo;
    fileMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:fileMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendLocationUserId:(NSString *)userId
                  location:(CLLocationCoordinate2D)location
              locationName:(NSString *)name
            thumbnailImage:(UIImage *)image
                     extra:(NSDictionary *)extra
                   success:(sendSuccessBlock)successBlock
                     error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCLocationMessage *locationMessage = [RCLocationMessage messageWithLocationImage:image location:location locationName:name];
    locationMessage.senderUserInfo = self.userInfo;
    locationMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:locationMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendLocationGroupId:(NSString *)groupId
                   location:(CLLocationCoordinate2D)location
               locationName:(NSString *)name
             thumbnailImage:(UIImage *)image
                      extra:(NSDictionary *)extra
                    success:(sendSuccessBlock)successBlock
                      error:(sendErrorBlock)errorBlock {
    NSString *extraStr = [self getExtraInfo:extra];
    RCLocationMessage *locationMessage = [RCLocationMessage messageWithLocationImage:image location:location locationName:name];
    locationMessage.senderUserInfo = self.userInfo;
    locationMessage.extra = extraStr;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:locationMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendRichContentUserId:(NSString *)userId
                        title:(NSString *)title
                       digest:(NSString *)digest
                     imageURL:(NSString *)imageURL
                          url:(NSString *)url
                        extra:(NSDictionary *)extra
                      success:(sendSuccessBlock)successBlock
                        error:(sendErrorBlock)errorBlock {
    RCRichContentMessage *richContentMessage = nil;
    NSString *extraStr = [self getExtraInfo:extra];

    if (url) {
        richContentMessage = [RCRichContentMessage messageWithTitle:title digest:digest imageURL:imageURL url:url extra:extraStr];
    } else {
        richContentMessage = [RCRichContentMessage messageWithTitle:title digest:digest imageURL:imageURL extra:extraStr];
    }
    richContentMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_PRIVATE targetId:userId content:richContentMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendRichContentGroupId:(NSString *)groupId
                         title:(NSString *)title
                        digest:(NSString *)digest
                      imageURL:(NSString *)imageURL
                           url:(NSString *)url
                         extra:(NSDictionary *)extra
                       success:(sendSuccessBlock)successBlock
                         error:(sendErrorBlock)errorBlock {
    RCRichContentMessage *richContentMessage = nil;
    NSString *extraStr = [self getExtraInfo:extra];

    if (url) {
        richContentMessage = [RCRichContentMessage messageWithTitle:title digest:digest imageURL:imageURL url:url extra:extraStr];
    } else {
        richContentMessage = [RCRichContentMessage messageWithTitle:title digest:digest imageURL:imageURL extra:extraStr];
    }
    richContentMessage.senderUserInfo = self.userInfo;

    [[RCIMClient sharedRCIMClient] sendMessage:ConversationType_GROUP targetId:groupId content:richContentMessage pushContent:nil pushData:nil success:successBlock error:errorBlock];
}

- (void)sendGroupIdId:(NSString *)groupId
        mentionedType:(RCMentionedType)type
           userIdList:(NSArray *)userIdList
     mentionedContent:(NSString *)mentionedContent
                extra:(NSDictionary *)extra
              success:(sendSuccessBlock)successBlock
                error:(sendErrorBlock)errorBlock {
    RCMentionedInfo *mentionInfo = [[RCMentionedInfo alloc] initWithMentionedType:type userIdList:userIdList mentionedContent:mentionedContent];

    NSString *extraStr = [self getExtraInfo:extra];

    RCTextMessage *textMessage = [RCTextMessage messageWithContent:mentionedContent];
    textMessage.mentionedInfo = mentionInfo;
    textMessage.senderUserInfo = self.userInfo;
    textMessage.extra = extraStr;

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

- (NSString *)getExtraInfo:(NSDictionary *)extra {
    NSString *extraStr = @"";
    if (extra) {
        NSError *error = nil;
        NSData *data = [NSJSONSerialization dataWithJSONObject:extra options:NSJSONWritingPrettyPrinted error:&error];
        if (data && !error) {
            extraStr = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
        }
    }
    return extraStr;
}

@end
