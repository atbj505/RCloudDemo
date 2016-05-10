//
//  IMService+Record.h
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService.h"

typedef void (^recordStopBlock)(NSURL *url, long duration);

@interface IMService (Record)

/**
 *  开始录制
 */
- (void)startRecord;

/**
 *  停止录制
 *
 *  @param recordStopBlock 停止录制回调
 */
- (void)stopRecord:(recordStopBlock)recordStopBlock;

/**
 *  删除录制文件
 */
- (void)deleteRecord;

@end
