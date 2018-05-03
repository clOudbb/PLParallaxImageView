//
//  ImageTableViewCell.m
//  ImageAni
//
//  Created by qmtv on 2018/5/3.
//  Copyright © 2018年 clOud. All rights reserved.
//

#import "ImageTableViewCell.h"

@implementation ImageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self.contentView addSubview:self.imgView];
        [self.contentView addSubview:self.titleLabel];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imgView.frame = (CGRect){0, 0, self.frame.size.width, self.frame.size.height - 50};
    _titleLabel.frame = (CGRect){0, self.frame.size.height - 40, self.frame.size.width, 30};
}

- (PLParallaxImageView *)imgView
{
    if (!_imgView) {
        _imgView = [PLParallaxImageView new];
        _imgView.cell = self;
        _imgView.parallax = 70;
    }
    return _imgView;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        _titleLabel = [UILabel new];
    }
    return _titleLabel;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

@end
