//
//  IMConversationViewController.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/24.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMConversationViewController.h"
#import "IMService+Conversation.h"
#import "IMService+Message.h"
#import "IMServiceReceiver.h"


@interface IMConversationViewController () <IMServiceReceiverMessageDelegate, IMServiceConnectDelegate>

@property (nonatomic, strong) RCConversation *conversation;

@property (nonatomic, strong) UITableView *tablewView;

@property (nonatomic, strong) NSArray *dataArray;

@end


@implementation IMConversationViewController

- (instancetype)initWithConversation:(RCConversation *)converstaion {
    if (self = [super init]) {
        self.conversation = converstaion;
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [[IMService sharedIMService] syncConversationReadStatus:self.conversation.conversationType targetId:self.conversation.targetId time:self.conversation.receivedTime success:^{

    } error:^(RCErrorCode nErrorCode){

    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [[IMService sharedIMService].receiver setMessageDelegate:self forKey:self.conversation.targetId];

    self.dataArray = [[IMService sharedIMService] getAllLocalMessage:self.conversation.conversationType targetId:self.conversation.targetId];

    [[IMService sharedIMService] syncConversationReadStatus:self.conversation.conversationType targetId:self.conversation.targetId time:self.conversation.receivedTime success:^{

    } error:^(RCErrorCode nErrorCode){

    }];
}

@end
