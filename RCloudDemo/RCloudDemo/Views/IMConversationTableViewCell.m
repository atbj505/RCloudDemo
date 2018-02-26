//
//  IMConversationTableViewCell.m
//  RCloudDemo
//
//  Created by Robert on 2018/2/26.
//  Copyright © 2018年 Robert. All rights reserved.
//

#import "IMConversationTableViewCell.h"
#import "IMConversationContentView.h"


@interface IMConversationTableViewCell ()

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *avatar;

@property (nonatomic, strong) IMConversationContentView *messageContentView;

@end


@implementation IMConversationTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self addSubview:self.nameLabel];
        [self addSubview:self.avatar];
        [self addSubview:self.messageContentView];
    }
    return self;
}

- (void)updateConstraints {
    [self.avatar mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.mas_top).offset(5);
        make.left.mas_equalTo(self.mas_left).offset(5);
        make.width.and.height.mas_equalTo(35);
    }];

    [self.nameLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatar.mas_right).offset(5);
        make.bottom.mas_equalTo(self.avatar.mas_bottom);
        make.height.mas_equalTo(@(16));
    }];

    [self.messageContentView mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(self.avatar.mas_left);
        make.top.mas_equalTo(self.avatar.mas_bottom).offset(5);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-5);
        make.width.mas_lessThanOrEqualTo(self.bounds.size.width - 30);
    }];

    [super updateConstraints];
}

- (UILabel *)nameLabel {
    if (!_nameLabel) {
        _nameLabel = [[UILabel alloc] init];
        _nameLabel.textAlignment = NSTextAlignmentLeft;
        _nameLabel.font = [UIFont systemFontOfSize:16];
    }
    return _nameLabel;
}

- (UIImageView *)avatar {
    if (!_avatar) {
        _avatar = [[UIImageView alloc] init];
    }
    return _avatar;
}

- (IMConversationContentView *)messageContentView {
    if (!_messageContentView) {
        _messageContentView = [[IMConversationContentView alloc] init];
    }
    return _messageContentView;
}

- (void)setMessage:(RCMessage *)message {
    _message = message;
    self.nameLabel.text = _message.content.senderUserInfo.name;
    [self.avatar sd_setImageWithURL:[NSURL URLWithString:_message.content.senderUserInfo.portraitUri]];
    [self updateConstraintsIfNeeded];
}

@end
