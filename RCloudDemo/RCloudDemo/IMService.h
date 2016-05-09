//
//  IMService.h
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void (^sendSuccessBlock)(long messageId);
typedef void (^sendFailBlock)(RCErrorCode errorcode, long messageId);

@interface IMService : NSObject <RCIMClientReceiveMessageDelegate>

+ (instancetype)sharedIMService;

- (void)sendMessageUserId:(NSString *)userId
                  content:(NSString *)content
                  success:(sendSuccessBlock)successBlock
                     fail:(sendFailBlock)failBlock;

@end
