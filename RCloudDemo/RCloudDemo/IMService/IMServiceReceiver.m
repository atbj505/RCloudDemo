//
//  IMServiceReceiver.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMServiceReceiver.h"


@implementation IMServiceReceiver

- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        RCTextMessage *testMessage = (RCTextMessage *)message.content;

    } else if ([message.content isMemberOfClass:[RCImageMessage class]]) {
        RCImageMessage *imageMessage = (RCImageMessage *)message.content;

    } else if ([message.content isMemberOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *voiceMessage = (RCVoiceMessage *)message.content;

    } else if ([message.content isMemberOfClass:[RCFileMessage class]]) {
        RCFileMessage *fileMessage = (RCFileMessage *)message.content;
    }
}

@end
