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

@property (nonatomic, strong, readwrite) IMServiceReceiver *receiver;

@property (nonatomic, strong, readwrite) RCUserInfo *userInfo;

@property (nonatomic, assign, readwrite) RCConnectionStatus connectStatus;

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
        [[RCIMClient sharedRCIMClient] setRCConnectionStatusChangeDelegate:self.receiver];
    }
    return self;
}

- (void)setSenderUserId:(NSString *)userId
               userName:(NSString *)userName
               photoUrl:(NSString *)url {
    self.userInfo = [[RCUserInfo alloc] initWithUserId:userId name:userName portrait:url];
}

- (IMServiceReceiver *)receiver {
    if (!_receiver) {
        _receiver = [[IMServiceReceiver alloc] init];
    }
    return _receiver;
}

- (RCConnectionStatus)connectStatus {
    _connectStatus = [[RCIMClient sharedRCIMClient] getConnectionStatus];
    return _connectStatus;
}

@end
