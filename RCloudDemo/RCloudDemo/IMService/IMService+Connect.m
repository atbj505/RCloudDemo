//
//  IMService+Connect.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Connect.h"


@implementation IMService (Connect)

- (void)connectWithToken:(NSString *)token
                 success:(void (^)(NSString *userId))successBlock
                   error:(void (^)(RCConnectErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] connectWithToken:token success:^(NSString *userId) {
        successBlock(userId);
        //设置当前用户ID
        [RCIMClient sharedRCIMClient].currentUserInfo.userId = userId;
        //设置离线消息补偿时间
        [[RCIMClient sharedRCIMClient] setOfflineMessageDuration:3 success:^{

        } failure:^(RCErrorCode nErrorCode){

        }];
    } error:^(RCConnectErrorCode status) {
        errorBlock(status);
    } tokenIncorrect:^{

    }];
}

- (void)disconnect {
    [[RCIMClient sharedRCIMClient] disconnect:false];
}

- (RCConnectionStatus)getConnectionStatus {
    return [[RCIMClient sharedRCIMClient] getConnectionStatus];
}

- (RCNetworkStatus)getCurrentNetworkStatus {
    return [[RCIMClient sharedRCIMClient] getCurrentNetworkStatus];
}

@end
