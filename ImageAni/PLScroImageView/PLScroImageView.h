//
//  PLScroImageView.h
//  ImageAni
//
//  Created by qmtv on 2018/5/3.
//  Copyright © 2018年 clOud. All rights reserved.
//
/**
 * 如果有第一次滚动图片串位的情况，可以在tableview视图中对tableview使用scrollTo类似方法隐士滚动一次在恢复
 */
#import <UIKit/UIKit.h>

@protocol PLScroDataSource <NSObject>
@required
@property (nonatomic, assign) CGFloat parallax;
@property (nonatomic, weak) __kindof UITableViewCell *cell;
@end
//复写所有ImageView属性

@interface PLScroImageView : UIView <PLScroDataSource>

@property (nonatomic, strong) UIImage *image;

- (void)viewDidScroll;

@end



