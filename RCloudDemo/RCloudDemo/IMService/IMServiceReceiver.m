//
//  IMServiceReceiver.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMServiceReceiver.h"
#import "IMService+Message.h"
#import "IMServiceReceiverNode.h"


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

- (void)addMessageDelegate:(id<IMServiceReceiverMessageDelegate>)delegate forTargetId:(NSString *)targetId delegateQueue:(dispatch_queue_t)delegateQueue {
    IMServiceReceiverNode *node = [[IMServiceReceiverNode alloc] initWithDelegate:delegate delegateQueue:delegateQueue];
    [self.messageDelegateDict setObject:node forKey:targetId];
}

- (void)removeMessageDelegate:(NSString *)targetId {
    [self.messageDelegateDict removeObjectForKey:targetId];
}

- (void)removeAllDelegate {
    [self.messageDelegateDict removeAllObjects];
}

- (void)setConnectionStatusDelegate:(id<IMServiceConnectDelegate>)delegate {
    self.connectDelegate = delegate;
}

#pragma mark - RCIMClientReceiveMessageDelegate
- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    NSString *targetId = message.targetId;
    IMServiceReceiverNode *node = self.messageDelegateDict[targetId];
    id delegate = node.delegate;
    RCMessage *transMessage = nil;
    IMServiceMessageType type = 99;

    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        transMessage.content = (RCTextMessage *)message.content;
        type = IMServiceTextMessage;
    } else if ([message.content isMemberOfClass:[RCImageMessage class]]) {
        transMessage.content = (RCImageMessage *)message.content;
        type = IMServiceImageMessage;
    } else if ([message.content isMemberOfClass:[RCVoiceMessage class]]) {
        transMessage.content = (RCVoiceMessage *)message.content;
        type = IMServiceVoiceMessage;
    } else if ([message.content isMemberOfClass:[RCFileMessage class]]) {
        transMessage.content = (RCFileMessage *)message.content;
        type = IMServiceFileMessage;
    } else if ([message.content isMemberOfClass:[RCLocationMessage class]]) {
        transMessage.content = (RCLocationMessage *)message.content;
        type = IMServiceLocationMessage;
    } else if ([message.content isMemberOfClass:[RCRichContentMessage class]]) {
        transMessage.content = (RCRichContentMessage *)message.content;
        type = IMServiceRichContentMessage;
    } else if ([message.content isMemberOfClass:[RCCommandMessage class]]) {
        transMessage.content = (RCCommandMessage *)message.content;
        type = IMServiceCommandMessage;
    } else if ([message.content isMemberOfClass:[RCContactNotificationMessage class]]) {
        transMessage.content = (RCContactNotificationMessage *)message.content;
        type = IMServiceContactNotificationMessage;
    } else if ([message.content isMemberOfClass:[RCGroupNotificationMessage class]]) {
        transMessage.content = (RCGroupNotificationMessage *)message.content;
        type = IMServiceGroupNotificationMessage;
    }
    if (delegate && [delegate respondsToSelector:@selector(onReceivedMessage:type:left:)]) {
        dispatch_async(node.delegateQueue, ^{
            [delegate onReceivedMessage:transMessage type:type left:nLeft];
        });
    }
}

- (void)onMessageRecalled:(long)messageId {
    RCMessage *message = [[IMService sharedIMService] getMessage:messageId];
    IMServiceReceiverNode *node = self.messageDelegateDict[message.targetId];
    id delegate = node.delegate;
    RCRecallNotificationMessage *recalledMessage = (RCRecallNotificationMessage *)message.content;
    if (delegate && [delegate respondsToSelector:@selector(onReceivedRecalledMessage:content:)]) {
        dispatch_async(node.delegateQueue, ^{
            [delegate onReceivedRecalledMessage:message content:recalledMessage];
        });
    }
}

- (void)onMessageReceiptRequest:(RCConversationType)conversationType
                       targetId:(NSString *)targetId
                     messageUId:(NSString *)messageUId {
    IMServiceReceiverNode *node = self.messageDelegateDict[targetId];
    id delegate = node.delegate;
    RCMessage *message = [[IMService sharedIMService] getMessageByUId:messageUId];
    if (delegate && [delegate respondsToSelector:@selector(onReceivedRecalledMessage:content:)]) {
        dispatch_async(node.delegateQueue, ^{
            [delegate onReceivedMessageReceiptRequest:conversationType targetId:targetId message:message];
        });
    }
}

- (void)onMessageReceiptResponse:(RCConversationType)conversationType
                        targetId:(NSString *)targetId
                      messageUId:(NSString *)messageUId
                      readerList:(NSMutableDictionary *)userIdList {
    IMServiceReceiverNode *node = self.messageDelegateDict[targetId];
    id delegate = node.delegate;
    RCMessage *message = [[RCIMClient sharedRCIMClient] getMessageByUId:messageUId];
    if (delegate && [delegate respondsToSelector:@selector(onReceivedMessageReceiptResponse:targetId:message:readerList:)]) {
        dispatch_async(node.delegateQueue, ^{
            [delegate onReceivedMessageReceiptResponse:conversationType targetId:targetId message:message readerList:userIdList];
        });
    }
}

#pragma mark - RCTypingStatusDelegate

- (void)onTypingStatusChanged:(RCConversationType)conversationType
                     targetId:(NSString *)targetId
                       status:(NSArray *)userTypingStatusList {
    if (userTypingStatusList) {
        IMServiceReceiverNode *node = self.messageDelegateDict[targetId];
        id delegate = node.delegate;
        RCUserTypingStatus *typeStatus = [userTypingStatusList lastObject];
        if (delegate && [delegate respondsToSelector:@selector(onReceivedTypingStatusChanged:targetId:userId:contentType:)]) {
            dispatch_async(node.delegateQueue, ^{
                [delegate onReceivedTypingStatusChanged:conversationType targetId:targetId userId:typeStatus.userId contentType:typeStatus.contentType];
            });
        }
    }
}

#pragma mark - RCLibDispatchReadReceiptNotification

- (void)ReadReceiptMessage:(NSNotification *)notification {
    NSNumber *ctype = [notification.userInfo objectForKey:@"cType"];
    NSNumber *time = [notification.userInfo objectForKey:@"messageTime"];
    NSString *targetId = [notification.userInfo objectForKey:@"tId"];
    IMServiceReceiverNode *node = self.messageDelegateDict[targetId];
    id delegate = node.delegate;
    if (delegate && [delegate respondsToSelector:@selector(onReceivedReadReceiptMessage:targetId:time:)]) {
        dispatch_async(node.delegateQueue, ^{
            [delegate onReceivedReadReceiptMessage:[ctype integerValue] targetId:targetId time:[time longLongValue]];
        });
    }
}

#pragma mark - RCConnectionStatusChangeDelegate

- (void)onConnectionStatusChanged:(RCConnectionStatus)status {
    if (self.connectDelegate && [self.connectDelegate respondsToSelector:@selector(onConnectStatusChanged:)]) {
        [self.connectDelegate onConnectStatusChanged:status];
    }
}

@end
