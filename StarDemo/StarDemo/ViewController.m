//
//  ViewController.m
//  StarDemo
//
//  Created by MacBook on 2018/1/20.
//  Copyright © 2018年 李Sir灬. All rights reserved.
//

#import "ViewController.h"
#import "FJStarView.h"

@interface ViewController ()<StarViewDelegate>
@property (nonatomic,strong) UILabel *mLabel;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    FJStarView *ratingBar1 = [[FJStarView alloc] init];
    ratingBar1.frame = CGRectMake(0, 0, 200, 20);
    ratingBar1.center = self.view.center;
    ratingBar1.delegate = self;
    [self.view addSubview:ratingBar1];
    
    [ratingBar1 setTotalScore:5 unSelectedImage:@"xinggray" halfSelectedImage:@"halfStar" fullSelectedImage:@"xingyellow"];
    
    self.mLabel = [[UILabel alloc]init];
    self.mLabel.frame = CGRectMake(0, 0, 200, 20);
    self.mLabel.center = CGPointMake(self.view.center.x, self.view.center.y - 22);
    self.mLabel.textColor = [UIColor blackColor];
    [self.view addSubview:self.mLabel];
}

- (void)ratingBar:(FJStarView *)ratingBar ratingChanged:(float)newRating{
     self.mLabel.text = [NSString stringWithFormat:@"%.1f分",newRating];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
