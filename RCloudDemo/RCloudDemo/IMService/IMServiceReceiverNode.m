//
//  IMServiceReceiverNode.m
//  RCloudDemo
//
//  Created by Robert on 2018/6/27.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMServiceReceiverNode.h"


@implementation IMServiceReceiverNode

- (instancetype)initWithDelegate:(id)delegate delegateQueue:(dispatch_queue_t)delegateQueue {
    if (self = [super init]) {
        _delegate = delegate;
        _delegateQueue = delegateQueue;
    }
    return self;
}

@end
