//
//  FJStarView.h
//  StarDemo
//
//  Created by MacBook on 2018/1/20.
//  Copyright © 2018年 李Sir灬. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FJStarView;
@protocol StarViewDelegate <NSObject>

/**
 *  评分改变
 *
 *  @param ratingBar 评分控件
 *  @param newRating 评分值
 */
- (void)ratingBar:(FJStarView *)ratingBar ratingChanged:(float)newRating;
@end

@interface FJStarView : UIView
/**
 *  是否是指示器，如果是指示器，就不能滑动了，只显示结果，不是指示器的话就能滑动修改值
 *  默认为NO
 */
@property (nonatomic,assign) BOOL isIndicator;

@property (nonatomic,weak) id<StarViewDelegate> delegate;

- (void)setUnSelectedImage:(NSString *)unSelectedImageName halfSelectedImage:(NSString *)halfSelectedImageName fullSelectedImage:(NSString *)fullSelectedImageName;

- (void)setTotalScore:(CGFloat)totalScore unSelectedImage:(NSString *)unSelectedImageName halfSelectedImage:(NSString *)halfSelectedImageName fullSelectedImage:(NSString *)fullSelectedImageName;

- (void)setStarWidth:(CGFloat)starWidth starSpace:(CGFloat)starSpace totalScore:(CGFloat)totalScore unSelectedImage:(NSString *)unSelectedImageName halfSelectedImage:(NSString *)halfSelectedImageName fullSelectedImage:(NSString *)fullSelectedImageName;

- (void)displayRating:(float)rating;

@end
