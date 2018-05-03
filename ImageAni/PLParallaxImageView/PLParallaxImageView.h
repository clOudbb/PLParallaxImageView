//
//  PLParallaxImageView.h
//  ImageAni
//
//  Created by qmtv on 2018/5/3.
//  Copyright © 2018年 clOud. All rights reserved.
//
/**
 * 如果有第一次滚动图片串位的情况，可以在tableview视图中对tableview使用scrollTo类似方法隐士滚动一次在恢复
 */
#import <UIKit/UIKit.h>

@protocol PLParallaxDataSource <NSObject>
@required
@property (nonatomic, assign) CGFloat parallax;
@property (nonatomic, weak) __kindof UITableViewCell *cell;
@end
//复写所有ImageView属性

@interface PLParallaxImageView : UIView <PLParallaxDataSource>

@property (nonatomic, strong) UIImage *image;
@property (nullable, nonatomic, strong) UIImage *highlightedImage NS_AVAILABLE_IOS(3_0); // default is nil
@property (nonatomic, assign) BOOL userInterEnabledWithImage; // default is NO
@property (nullable, nonatomic, copy) NSArray<UIImage *> *animationImages; // The array must contain UIImages. Setting hides the single image. default is nil
@property (nullable, nonatomic, copy) NSArray<UIImage *> *highlightedAnimationImages NS_AVAILABLE_IOS(3_0); // The array must contain UIImages. Setting hides the single image. default is nil

@property (nonatomic) NSTimeInterval animationDuration;         // for one cycle of images. default is number of images * 1/30th of a second (i.e. 30 fps)
@property (nonatomic) NSInteger      animationRepeatCount;      // 0 means infinite (default is 0)

@property (nonatomic, assign) BOOL isAnimaing;

- (void)viewDidScroll;

@end

@interface PLParallaxImageView (Origin)

- (void)startAnimation;
- (void)stopAnimation;

@end


