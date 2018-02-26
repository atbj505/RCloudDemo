//
//  IMConversationListsViewController.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/24.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMConversationListsViewController.h"
#import "IMService+Conversation.h"
#import "IMConversationViewController.h"


@interface IMConversationListsViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSArray *dataArray;

@end


@implementation IMConversationListsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.tableView];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    self.dataArray = [[IMService sharedIMService] getConversationLists];
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *tableviewCell = [tableView dequeueReusableCellWithIdentifier:@"tablviewCell" forIndexPath:indexPath];
    RCConversation *conversation = self.dataArray[indexPath.row];
    tableviewCell.textLabel.text = conversation.targetId;
    return tableviewCell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    RCConversation *conversation = self.dataArray[indexPath.row];
    IMConversationViewController *vc = [[IMConversationViewController alloc] initWithConversation:conversation];
    [self.navigationController pushViewController:vc animated:true];
}

- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"tablviewCell"];
    }
    return _tableView;
}

@end
