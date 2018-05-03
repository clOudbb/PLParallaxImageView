//
//  PLScroImageView.m
//  ImageAni
//
//  Created by qmtv on 2018/5/3.
//  Copyright © 2018年 clOud. All rights reserved.
//

#import "PLScroImageView.h"

@interface PLScroImageView ()

@property (nonatomic, strong) UIImageView *imgView;

@end

@implementation PLScroImageView
@synthesize parallax = _parallax;
@synthesize cell = _cell;

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.layer.masksToBounds = true;
        [self addSubview:self.imgView];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    _imgView.frame = (CGRect){0, 0, self.frame.size.width, self.frame.size.height + _parallax};
//    [self viewDidScroll:_tableView];
}

- (void)setImage:(UIImage *)image
{
    _image = image;
    _imgView.image = image;
}

- (UIImageView *)imgView
{
    if (!_imgView) {
        _imgView = [UIImageView new];
    }
    return _imgView;
}

- (void)viewDidScroll
{
    /**
     * 核心公式
     * cell高度 / window高度（准确应该是tableview高度）= imageView的Y坐标（<-所要求得的值） / imageView与imgContain的高度差值
     */
    UIView *view = [UIApplication sharedApplication].keyWindow;
    // 获取cell相对window的位置
    CGRect rectInSuperview = [_cell.superview convertRect:_cell.frame toView:view];
    // 位移相對中心點的距離
    float mid = view.frame.size.height / 2 - CGRectGetMinY(rectInSuperview);
    // 计算移动距离
    float move = (mid / view.frame.size.height) * _parallax;
    
    // 先將imageView向上移動一半的視差高度(difference/2)，然後根據move程度變化y的位置
    CGRect imageRect = _imgView.frame;
    imageRect.origin.y = -(_parallax / 2) + move;
    _imgView.frame = imageRect;
}



@end
