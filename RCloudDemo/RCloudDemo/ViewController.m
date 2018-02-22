//
//  ViewController.m
//  RCloudDemo
//
//  Created by Robert on 16/5/9.
//  Copyright © 2016年 Robert. All rights reserved.
//

#import "ViewController.h"
#import "IMService+SendMessage.h"
#import "IMService+Conversation.h"


@interface ViewController ()

@property (nonatomic, strong) UILabel *label;

@end


@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.label = [[UILabel alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.label];
    self.label.numberOfLines = 0;
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [[IMService sharedIMService] sendTextUserId:@"080904" content:@"test" extra:nil success:^(long messageId) {
        dispatch_async(dispatch_get_main_queue(), ^{
            NSString *string = self.label.text;
            if (!string) {
                string = @"";
            }
            string = [string stringByAppendingFormat:@"Sended Message: %ld\n", messageId];
            self.label.text = string;
        });
    } error:^(RCErrorCode errorcode, long messageId){

    }];
}

@end
