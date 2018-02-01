//
//  IMServiceReceiver.h
//  RCloudDemo
//
//  Created by Robert on 2018/1/29.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol IMServiceReceiverDelegate

- (void)onReceivedTextMessage:(RCMessage *)message left:(int)nLeft;

- (void)onReceivedImageMessage:(RCMessage *)message left:(int)nLeft;

- (void)onReceivedVoiceMessage:(RCMessage *)message left:(int)nLeft;


@end


@interface IMServiceReceiver : NSObject <RCIMClientReceiveMessageDelegate>

@property (nonatomic, weak) id<IMServiceReceiverDelegate> delegate;

@end
