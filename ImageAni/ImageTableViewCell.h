//
//  ImageTableViewCell.h
//  ImageAni
//
//  Created by qmtv on 2018/5/3.
//  Copyright © 2018年 clOud. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PLParallaxImageView.h"
@interface ImageTableViewCell : UITableViewCell

@property (nonatomic, strong) PLParallaxImageView *imgView;
@property (nonatomic, strong) UILabel *titleLabel;

@property (nonatomic, weak) UITableView *tableView;

@end
