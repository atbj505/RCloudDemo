//
//  IMServiceReceiver.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMServiceReceiver.h"
#import "IMService+Message.h"


@interface IMServiceReceiver ()

@property (nonatomic, weak) id<IMServiceReceiverMessageDelegate> messageDelegate;

@property (nonatomic, weak) id<IMServiceConnectDelegate> connectDelegate;

@property (nonatomic, strong) NSMutableDictionary *messageDelegateDict;

@end


@implementation IMServiceReceiver

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self name:RCLibDispatchReadReceiptNotification object:nil];
}

- (instancetype)init {
    if (self = [super init]) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(ReadReceiptMessage:) name:RCLibDispatchReadReceiptNotification object:nil];
        self.messageDelegateDict = [NSMutableDictionary dictionary];
    }
    return self;
}

- (void)setMessageDelegate:(id<IMServiceReceiverMessageDelegate>)delegate forKey:(NSString *)target {
    [self.messageDelegateDict setObject:delegate forKey:target];
}

- (void)setConnectionStatusDelegate:(id<IMServiceConnectDelegate>)delegate {
    self.connectDelegate = delegate;
}

#pragma mark - RCIMClientReceiveMessageDelegate
- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    NSString *targetId = message.targetId;
    id delegate = self.messageDelegateDict[targetId];

    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
            [delegate onReceivedMessage:message type:IMServiceTextMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCImageMessage class]]) {
        if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
            [delegate onReceivedMessage:message type:IMServiceImageMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCVoiceMessage class]]) {
        if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
            [delegate onReceivedMessage:message type:IMServiceVoiceMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCFileMessage class]]) {
        if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
            [delegate onReceivedMessage:message type:IMServiceFileMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCLocationMessage class]]) {
        if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
            [delegate onReceivedMessage:message type:IMServiceLocationMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCRichContentMessage class]]) {
        if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
            [delegate onReceivedMessage:message type:IMServiceRichContentMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCCommandMessage class]]) {
        RCCommandMessage *commandMessage = (RCCommandMessage *)message.content;
        if (delegate && [delegate respondsToSelector:@selector(onReceivedCommandMessage:content:left:)]) {
            [delegate onReceivedCommandMessage:message content:commandMessage left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCContactNotificationMessage class]]) {
        RCContactNotificationMessage *contactNotification = (RCContactNotificationMessage *)message.content;
        if (delegate && [delegate respondsToSelector:@selector(onReceivedContactNotificationMessage:content:left:)]) {
            [delegate onReceivedContactNotificationMessage:message content:contactNotification left:nLeft];
        }
    } else if ([message.content isMemberOfClass:[RCGroupNotificationMessage class]]) {
        RCGroupNotificationMessage *contactNotification = (RCGroupNotificationMessage *)message.content;
        if (delegate && [delegate respondsToSelector:@selector(onReceivedGroupNotificationMessage:content:left:)]) {
            [delegate onReceivedGroupNotificationMessage:message content:contactNotification left:nLeft];
        }
    }
}

- (void)onMessageRecalled:(long)messageId {
    //    id delegate = self.messageDelegateDict[targetId];
    //    RCMessage *message = [[IMService sharedIMService] getMessage:messageId];
    //    RCRecallNotificationMessage *recalledMessage = (RCRecallNotificationMessage *)message.content;
    //    if (delegate && [delegate respondsToSelector:@selector(onReceivedRecalledMessage:content:)]) {
    //        [delegate onReceivedRecalledMessage:message content:recalledMessage];
    //    }
}

- (void)onMessageReceiptRequest:(RCConversationType)conversationType
                       targetId:(NSString *)targetId
                     messageUId:(NSString *)messageUId {
    id delegate = self.messageDelegateDict[targetId];
    RCMessage *message = [[IMService sharedIMService] getMessageByUId:messageUId];
    if (delegate && [delegate respondsToSelector:@selector(onReceivedMessageReceiptRequest:targetId:message:)]) {
        [delegate onReceivedMessageReceiptRequest:conversationType targetId:targetId message:message];
    }
}

- (void)onMessageReceiptResponse:(RCConversationType)conversationType
                        targetId:(NSString *)targetId
                      messageUId:(NSString *)messageUId
                      readerList:(NSMutableDictionary *)userIdList {
    id delegate = self.messageDelegateDict[targetId];
    RCMessage *message = [[RCIMClient sharedRCIMClient] getMessageByUId:messageUId];
    if (delegate && [delegate respondsToSelector:@selector(onReceivedMessageReceiptResponse:targetId:message:readerList:)]) {
        [delegate onReceivedMessageReceiptResponse:conversationType targetId:targetId message:message readerList:userIdList];
    }
}

#pragma mark - RCTypingStatusDelegate

- (void)onTypingStatusChanged:(RCConversationType)conversationType
                     targetId:(NSString *)targetId
                       status:(NSArray *)userTypingStatusList {
    if (userTypingStatusList) {
        id delegate = self.messageDelegateDict[targetId];
        RCUserTypingStatus *typeStatus = [userTypingStatusList lastObject];
        if (delegate && [delegate respondsToSelector:@selector(onReceivedTypingStatusChanged:targetId:userId:contentType:)]) {
            [delegate onReceivedTypingStatusChanged:conversationType targetId:targetId userId:typeStatus.userId contentType:typeStatus.contentType];
        }
    }
}

#pragma mark - RCLibDispatchReadReceiptNotification

- (void)ReadReceiptMessage:(NSNotification *)notification {
    NSNumber *ctype = [notification.userInfo objectForKey:@"cType"];
    NSNumber *time = [notification.userInfo objectForKey:@"messageTime"];
    NSString *targetId = [notification.userInfo objectForKey:@"tId"];
    id delegate = self.messageDelegateDict[targetId];
    if (delegate && [delegate respondsToSelector:@selector(onReceivedReadReceiptMessage:targetId:time:)]) {
        [delegate onReceivedReadReceiptMessage:[ctype integerValue] targetId:targetId time:[time longLongValue]];
    }
}

#pragma mark - RCConnectionStatusChangeDelegate

- (void)onConnectionStatusChanged:(RCConnectionStatus)status {
    if (self.connectDelegate && [self.connectDelegate respondsToSelector:@selector(onConnectStatusChanged:)]) {
        [self.connectDelegate onConnectStatusChanged:status];
    }
}

@end
