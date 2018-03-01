# FJStarView
滑动评定星级

>
>进行星级评分的控件
>

![效果图](https://github.com/nuanqing/FJStarView/blob/master/star.gif)


使用方法
---
```
FJStarView *ratingBar1 = [[FJStarView alloc] init];
ratingBar1.frame = CGRectMake(0, 0, 200, 20);
ratingBar1.center = self.view.center;
ratingBar1.delegate = self;
[self.view addSubview:ratingBar1];

[ratingBar1 setTotalScore:5 unSelectedImage:@"xinggray" halfSelectedImage:@"halfStar" fullSelectedImage:@"xingyellow"];
```
代理
```
- (void)ratingBar:(FJStarView *)ratingBar ratingChanged:(float)newRating{
self.mLabel.text = [NSString stringWithFormat:@"%.1f分",newRating];
}
```
