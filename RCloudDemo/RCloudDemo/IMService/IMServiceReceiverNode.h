//
//  IMServiceReceiverNode.h
//  RCloudDemo
//
//  Created by Robert on 2018/6/27.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface IMServiceReceiverNode : NSObject

@property (nonatomic, weak) id delegate;

@property (nonatomic, strong) dispatch_queue_t delegateQueue;

- (instancetype)initWithDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue;

@end
