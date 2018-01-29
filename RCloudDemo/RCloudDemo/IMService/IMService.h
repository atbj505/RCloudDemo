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

@end
