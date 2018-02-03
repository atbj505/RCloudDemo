//
//  IMService+Connect.m
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+Connect.h"


@implementation IMService (Connect)

- (void)connectWithToken:(NSString *)token {
    [[RCIMClient sharedRCIMClient] connectWithToken:token success:^(NSString *userId) {
        NSLog(@"success:%@", userId);
        [[RCIMClient sharedRCIMClient] setOfflineMessageDuration:3 success:^{

        } failure:^(RCErrorCode nErrorCode){

        }];
    } error:^(RCConnectErrorCode status) {
        NSLog(@"error:%ld", (long)status);
    } tokenIncorrect:^{
        NSLog(@"tokenIncorrect");
    }];
}

@end
