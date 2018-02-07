//
//  IMService+BlackList.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/7.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService+BlackList.h"


@implementation IMService (BlackList)

- (void)getBlacklist:(void (^)(NSArray *blockUserIds))successBlock
               error:(void (^)(RCErrorCode status))errorBlock {
    [[RCIMClient sharedRCIMClient] getBlacklist:successBlock error:errorBlock];
}

- (void)getBlacklistStatus:(NSString *)userId success:(void (^)(BOOL))successBlock error:(void (^)(RCErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] getBlacklistStatus:userId success:^(int bizStatus) {
        if (bizStatus == 0) {
            successBlock(true);
        } else if (bizStatus == 101) {
            successBlock(false);
        }
    } error:errorBlock];
}

- (void)addToBlacklist:(NSString *)userId success:(void (^)())successBlock error:(void (^)(RCErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] addToBlacklist:userId success:successBlock error:errorBlock];
}

- (void)removeFromBlacklist:(NSString *)userId success:(void (^)())successBlock error:(void (^)(RCErrorCode))errorBlock {
    [[RCIMClient sharedRCIMClient] removeFromBlacklist:userId success:successBlock error:errorBlock];
}

@end
