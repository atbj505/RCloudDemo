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
        NSLog(@"文字消息内容：%@", testMessage.content);
    }else if ([message.content isMemberOfClass:[RCImageMessage class]]) {
        RCImageMessage *imageMessage = (RCImageMessage *)message.content;
        NSLog(@"图片消息内容：%@", imageMessage.imageUrl);
    }else if ([message.content isMemberOfClass:[RCVoiceMessage class]]) {
        RCVoiceMessage *voiceMessage = (RCVoiceMessage *)message.content;
        NSLog(@"语音消息内容：%ld", voiceMessage.duration);
    }
    
    NSLog(@"还剩余的未接收的消息数：%d", nLeft);
}

@end
