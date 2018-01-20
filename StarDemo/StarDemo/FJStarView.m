//
//  FJStarView.m
//  StarDemo
//
//  Created by MacBook on 2018/1/20.
//  Copyright © 2018年 李Sir灬. All rights reserved.
//

#import "FJStarView.h"

@interface FJStarView()

@property (nonatomic,assign) CGFloat starRating;
@property (nonatomic,assign) CGFloat lastRating;
@property (nonatomic,assign) CGFloat totalScore;

@property (nonatomic,assign) CGFloat starWidth;
@property (nonatomic,assign) CGFloat starSpace;

@property (nonatomic,strong) UIImage *unSelectedImage;
@property (nonatomic,strong) UIImage *halfSelectedImage;
@property (nonatomic,strong) UIImage *fullSelectedImage;

@property (nonatomic,strong) NSMutableArray *imageViewArray;

@end

@implementation FJStarView


- (void)setUnSelectedImage:(NSString *)unSelectedImageName halfSelectedImage:(NSString *)halfSelectedImageName fullSelectedImage:(NSString *)fullSelectedImageName{
    [self setStarWidth:20 starSpace:10 totalScore:5 unSelectedImage:unSelectedImageName halfSelectedImage:halfSelectedImageName fullSelectedImage:halfSelectedImageName];
}


- (void)setTotalScore:(CGFloat)totalScore unSelectedImage:(NSString *)unSelectedImageName halfSelectedImage:(NSString *)halfSelectedImageName fullSelectedImage:(NSString *)fullSelectedImageName{
    [self setStarWidth:20 starSpace:10 totalScore:totalScore unSelectedImage:unSelectedImageName halfSelectedImage:halfSelectedImageName fullSelectedImage:fullSelectedImageName];
}


- (void)setStarWidth:(CGFloat)starWidth starSpace:(CGFloat)starSpace totalScore:(CGFloat)totalScore unSelectedImage:(NSString *)unSelectedImageName halfSelectedImage:(NSString *)halfSelectedImageName fullSelectedImage:(NSString *)fullSelectedImageName{
    self.starWidth = starWidth;
    self.starSpace = starSpace;
    self.totalScore = totalScore;
    self.unSelectedImage = [UIImage imageNamed:unSelectedImageName];
    self.halfSelectedImage = [UIImage imageNamed:halfSelectedImageName];
    self.fullSelectedImage = [UIImage imageNamed:fullSelectedImageName];
    
    for (int i=0; i<5; i++) {
        UIImageView *imageView = [[UIImageView alloc]init];
        imageView.tag = 8000+i;
        imageView.image = self.unSelectedImage;
        imageView.frame = CGRectMake(_starSpace*(i+1)+_starWidth*i, 0, _starWidth, _starWidth);
        [self addSubview:imageView];
        [self.imageViewArray addObject:imageView];
        
    }
    
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self touchesRating:touches];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
     [self touchesRating:touches];
}

- (void)touchesRating:(NSSet *)touches{
    if (self.isIndicator) {
        return;
    }
     CGPoint point = [[touches anyObject] locationInView:self];
    
    float newRating = 0;
    
    if (point.x >= 0 && point.x <= self.frame.size.width) {

        if (point.x <= _starSpace+_starWidth*0.5f) {
            newRating = self.totalScore/10;
        }else if (point.x < _starSpace*2+_starWidth){
            newRating = (self.totalScore/10)*2;
        }else if (point.x < _starSpace*2+_starWidth*1.5){
            newRating = (self.totalScore/10)*3;
        }else if (point.x <= 3*_starSpace+2*_starWidth){
            newRating = (self.totalScore/10)*4;
        }else if (point.x <= 3*_starSpace+2.5*_starWidth){
            newRating = (self.totalScore/10)*5;
        }else if (point.x <= 4*_starSpace+3*_starWidth){
            newRating = (self.totalScore/10)*6;
        }else if (point.x <= 4*_starSpace+3.5*_starWidth){
            newRating = (self.totalScore/10)*7;
        }else if (point.x <= 5*_starSpace+4*_starWidth){
            newRating = (self.totalScore/10)*8;
        }else if (point.x <=5*_starSpace+4.5*_starWidth){
            newRating = (self.totalScore/10)*9;
        }else {
            newRating = self.totalScore;
        }
        
    }
    
    if (newRating != _lastRating){
        [self displayRating:newRating];
    }
}

-(void)displayRating:(float)rating{
    
    [self.imageViewArray enumerateObjectsUsingBlock:^(UIImageView *imageView, NSUInteger idx, BOOL * _Nonnull stop) {
        imageView.image = self.unSelectedImage;
    }];
    
    if (rating >= self.totalScore/10) {
        [self.imageViewArray[0] setImage:_halfSelectedImage];
    }
    if (rating >= self.totalScore/10*2) {
        [self.imageViewArray[0] setImage:_fullSelectedImage];
    }
    if (rating >= self.totalScore/10*3) {
        [self.imageViewArray[1] setImage:_halfSelectedImage];
    }
    if (rating >= self.totalScore/10*4) {
        [self.imageViewArray[1] setImage:_fullSelectedImage];
    }
    if (rating >= self.totalScore/10*5) {
        [self.imageViewArray[2] setImage:_halfSelectedImage];
    }
    if (rating >= self.totalScore/10*6) {
        [self.imageViewArray[2] setImage:_fullSelectedImage];
    }
    if (rating >= self.totalScore/10*7) {
        [self.imageViewArray[3] setImage:_halfSelectedImage];
    }
    if (rating >= self.totalScore/10*8) {
        [self.imageViewArray[3] setImage:_fullSelectedImage];
    }
    if (rating >= self.totalScore/10*9) {
        [self.imageViewArray[4] setImage:_halfSelectedImage];
    }
    if (rating >= self.totalScore) {
        [self.imageViewArray[4] setImage:_fullSelectedImage];
    }
    
    self.starRating = rating;
    self.lastRating = rating;
    
    if (_delegate && [_delegate respondsToSelector:@selector(ratingBar:ratingChanged:)]) {
        [_delegate ratingBar:self ratingChanged:self.lastRating];
    }
}

- (NSMutableArray *)imageViewArray{
    if (!_imageViewArray) {
        _imageViewArray = [[NSMutableArray alloc]init];
    }
    return _imageViewArray;
}


@end
