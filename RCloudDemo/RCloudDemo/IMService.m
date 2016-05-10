//
//  IMService.m
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"

static NSString * const RCIMAPPTOKEN = @"c9kqb3rdkglbj";

@implementation IMService

+ (instancetype)sharedIMService {
    static dispatch_once_t onceToken;
    static IMService *service;
    
    dispatch_once(&onceToken, ^{
        service = [[[self class] alloc] init];
    });
    
    return service;
}

- (instancetype)init {
    if (self = [super init]) {
        [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:self object:nil];
        [[RCIMClient sharedRCIMClient] initWithAppKey:@"c9kqb3rdkglbj"];
    }
    return self;
}

- (void)connectWithToken:(NSString *)token {
    [[RCIMClient sharedRCIMClient] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"success:%@", userId);
    } error:^(RCConnectErrorCode status) {
        NSLog(@"error:%d", status);
    } tokenIncorrect:^{
        NSLog(@"tokenIncorrect");
    }];
}

#pragma mark RCIMClientReceiveMessageDelegate
- (void)onReceived:(RCMessage *)message left:(int)nLeft object:(id)object {
    if ([message.content isMemberOfClass:[RCTextMessage class]]) {
        RCTextMessage *testMessage = (RCTextMessage *)message.content;
        NSLog(@"消息内容：%@", testMessage.content);
    }
    
    NSLog(@"还剩余的未接收的消息数：%d", nLeft);
}

@end
