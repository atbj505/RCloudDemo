//
//  IMServiceReceiver.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMServiceReceiver.h"
#import "IMService+Message.h"


@implementation IMServiceReceiver

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:RCLibDispatchReadReceiptNotification object:nil];
}

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ReadReceiptMessage:) name:RCLibDispatchReadReceiptNotification object:nil];
    }
    return self;
}

#pragma mark - RCIMClientReceiveMessageDelegate
- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        RCTextMessage *textMessage = (RCTextMessage *)message.content;
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedTextMessage:content:left:)]) {
            [self.delegate onReceivedTextMessage:message content:textMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCImageMessage class]]) {
        RCImageMessage *imageMessage = (RCImageMessage *)message.content;
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedImageMessage:content:left:)]) {
            [self.delegate onReceivedImageMessage:message content:imageMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *voiceMessage = (RCVoiceMessage *)message.content;
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedVoiceMessage:content:left:)]) {
            [self.delegate onReceivedVoiceMessage:message content:voiceMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCFileMessage class]]) {
        RCFileMessage *fileMessage = (RCFileMessage *)message.content;
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedFileMessage:content:left:)]) {
            [self.delegate onReceivedFileMessage:message content:fileMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCLocationMessage class]]) {
        RCLocationMessage *locationMessage = (RCLocationMessage *)message.content;
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedFileMessage:content:left:)]) {
            [self.delegate onReceivedLocationMessage:locationMessage content:locationMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCRichContentMessage class]]) {
        RCRichContentMessage *locationMessage = (RCRichContentMessage *)message.content;
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedFileMessage:content:left:)]) {
            [self.delegate onReceivedRichContentMessage:message content:locationMessage left:nLeft];
        }
    }
}

- (void)onMessageRecalled:(long)messageId {
    RCMessage *message = [[IMService sharedIMService] getMessage:messageId];
    RCRecallNotificationMessage *recalledMessage = (RCRecallNotificationMessage *)message.content;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedRecalledMessage:content:)]) {
        [self.delegate onReceivedRecalledMessage:message content:recalledMessage];
    }
}

- (void)onMessageReceiptRequest:(RCConversationType)conversationType
                       targetId:(NSString *)targetId
                     messageUId:(NSString *)messageUId {
    RCMessage *message = [[IMService sharedIMService] getMessageByUId:messageUId];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedMessageReceiptRequest:targetId:message:)]) {
        [self.delegate onReceivedMessageReceiptRequest:conversationType targetId:targetId message:message];
    }
}

- (void)onMessageReceiptResponse:(RCConversationType)conversationType
                        targetId:(NSString *)targetId
                      messageUId:(NSString *)messageUId
                      readerList:(NSMutableDictionary *)userIdList {
    RCMessage *message = [[RCIMClient sharedRCIMClient] getMessageByUId:messageUId];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedMessageReceiptResponse:targetId:message:readerList:)]) {
        [self.delegate onReceivedMessageReceiptResponse:conversationType targetId:targetId message:message readerList:userIdList];
    }
}

#pragma mark - RCTypingStatusDelegate

- (void)onTypingStatusChanged:(RCConversationType)conversationType
                     targetId:(NSString *)targetId
                       status:(NSArray *)userTypingStatusList {
    if (userTypingStatusList) {
        RCUserTypingStatus *typeStatus = [userTypingStatusList lastObject];
        if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedTypingStatusChanged:targetId:userId:contentType:)]) {
            [self.delegate onReceivedTypingStatusChanged:conversationType targetId:targetId userId:typeStatus.userId contentType:typeStatus.contentType];
        }
    }
}

#pragma mark - RCLibDispatchReadReceiptNotification

- (void)ReadReceiptMessage:(NSNotification *)notification {
    NSNumber *ctype = [notification.userInfo objectForKey:@"cType"];
    NSNumber *time = [notification.userInfo objectForKey:@"messageTime"];
    NSString *targetId = [notification.userInfo objectForKey:@"tId"];
    if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedReadReceiptMessage:targetId:time:)]) {
        [self.delegate onReceivedReadReceiptMessage:[ctype integerValue] targetId:targetId time:[time longLongValue]];
    }
}

#pragma mark - RCConnectionStatusChangeDelegate

- (void)onConnectionStatusChanged:(RCConnectionStatus)status {
    if (self.delegate && [self.delegate respondsToSelector:@selector(onConnectStatusChanged:)]) {
        [self.delegate onConnectStatusChanged:status];
    }
}

@end
