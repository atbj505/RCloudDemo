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
#import "IMConversationTableViewCell.h"


@interface IMConversationViewController () <UITableViewDelegate, UITableViewDataSource, IMServiceReceiverMessageDelegate, IMServiceConnectDelegate>

@property (nonatomic, strong) RCConversation *conversation;

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray *dataArray;

@end


@implementation IMConversationViewController

- (instancetype)initWithConversation:(RCConversation *)converstaion {
    if (self = [super init]) {
        self.conversation = converstaion;
        self.dataArray = [NSMutableArray array];
    }
    return self;
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self sync];
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self sync];

    [[IMService sharedIMService].receiver setMessageDelegate:self forKey:self.conversation.targetId];

    [self.view addSubview:self.tableView];
}

- (void)sync {
    [[IMService sharedIMService] syncConversationReadStatus:self.conversation.conversationType targetId:self.conversation.targetId time:self.conversation.receivedTime success:^{

    } error:^(RCErrorCode nErrorCode){

    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.dataArray = [[[IMService sharedIMService] getLatestMessages:self.conversation.conversationType targetId:self.conversation.targetId] mutableCopy];
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    IMConversationTableViewCell *tableviewCell = [tableView dequeueReusableCellWithIdentifier:@"conversationtablviewCell" forIndexPath:indexPath];
    RCMessage *message = self.dataArray[indexPath.row];
    tableviewCell.message = message;
    return tableviewCell;
}

#pragma mark - IMServiceReceiverMessageDelegate
- (void)onReceivedMessage:(RCMessage *)message type:(IMServiceMessageType)type left:(int)left {
}

#pragma marl - IMServiceConnectDelegate
- (void)onConnectStatusChanged:(RCConnectionStatus)status {
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[IMConversationTableViewCell class] forCellReuseIdentifier:@"conversationtablviewCell"];
    }
    return _tableView;
}

@end
