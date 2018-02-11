//
//  IMService+Connect.h
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMService.h"


@interface IMService (Connect)

/**
 *  链接融云服务器
 *
 *  @param token 令牌
 */
- (void)connectWithToken:(NSString *)token;

/**
 断开与融云服务器的链接
 */
- (void)disconnect;

/**
 获取当前链接状态
 */
- (RCConnectionStatus)getConnectionStatus;

/**
 获取当前网络状态
 */
- (RCNetworkStatus)getCurrentNetworkStatus;

@end
