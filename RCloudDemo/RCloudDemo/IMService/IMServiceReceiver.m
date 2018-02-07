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
    }
}

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

- (void)onMessageRecalled:(long)messageId {
    RCMessage *message = [[RCIMClient sharedRCIMClient] getMessage:messageId];
    RCRecallNotificationMessage *recalledMessage = (RCRecallNotificationMessage *)message.content;
    if (self.delegate && [self.delegate respondsToSelector:@selector(onReceivedRecalledMessage:content:)]) {
        [self.delegate onReceivedRecalledMessage:message content:recalledMessage];
    }
}

@end
