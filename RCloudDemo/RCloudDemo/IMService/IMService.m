//
//  IMService.m
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"

static NSString *const RCIMAPPKEY = @"c9kqb3rdkglbj";


@interface IMService ()

@end


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
        [[RCIMClient sharedRCIMClient] initWithAppKey:RCIMAPPKEY];
        [[RCIMClient sharedRCIMClient] setReceiveMessageDelegate:self.receiver object:nil];
        [[RCIMClient sharedRCIMClient] setRCTypingStatusDelegate:self.receiver];
    }
    return self;
}

- (IMServiceReceiver *)receiver {
    if (!_receiver) {
        _receiver = [[IMServiceReceiver alloc] init];
    }
    return _receiver;
}

@end
