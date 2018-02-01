//
//  IMService+Record.m
//  RCloudDemo
//
//  Created by Robert on 16/5/10.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "IMService+Record.h"
#import <AVFoundation/AVFoundation.h>
#import <objc/runtime.h>

const char kAudioRecorder;


@interface IMService ()

@property (nonatomic, strong) AVAudioRecorder *audioRecorder;

@end


@implementation IMService (Record)

- (void)startRecord {
    NSDictionary *settings = @{ AVFormatIDKey : @(kAudioFormatLinearPCM),
                                AVSampleRateKey : @8000.00f,
                                AVNumberOfChannelsKey : @1,
                                AVLinearPCMBitDepthKey : @16,
                                AVLinearPCMIsNonInterleaved : @NO,
                                AVLinearPCMIsFloatKey : @NO,
                                AVLinearPCMIsBigEndianKey : @NO };
    NSError *error = nil;

    NSURL *recordUrl = [NSURL URLWithString:[NSTemporaryDirectory() stringByAppendingString:@"record.wav"]];

    self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:recordUrl settings:settings error:&error];

    [self.audioRecorder record];
}

- (void)stopRecord:(recordStopBlock)recordStopBlock {
    [self.audioRecorder stop];

    AVURLAsset *audioAsset = [AVURLAsset URLAssetWithURL:self.audioRecorder.url options:nil];

    CMTime audioDuration = audioAsset.duration;

    float audioDurationSeconds = CMTimeGetSeconds(audioDuration);

    if (recordStopBlock) {
        recordStopBlock(self.audioRecorder.url, audioDurationSeconds);
    }
}

- (void)deleteRecord {
    [self.audioRecorder deleteRecording];
}

#pragma mark Setter&&Getter

- (AVAudioRecorder *)audioRecorder {
    return objc_getAssociatedObject(self, &kAudioRecorder);
}

- (void)setAudioRecorder:(AVAudioRecorder *)audioRecorder {
    objc_setAssociatedObject(self, &kAudioRecorder, audioRecorder, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
