//
//  IMService.h
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IMService : NSObject <RCIMClientReceiveMessageDelegate>

/**
 *  单例方法
 *
 *  @return 单例对象
 */
+ (instancetype)sharedIMService;

/**
 *  链接融云服务器
 *
 *  @param token 令牌
 */
- (void)connectWithToken:(NSString *)token;

@end
