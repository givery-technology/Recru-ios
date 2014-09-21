//
//  FeedView.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "FeedView.h"

@implementation FeedView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = NO;
        // 影のかかる方向を指定する
        self.layer.shadowOffset = CGSizeMake(0, 0);
        // 影の透明度
        self.layer.shadowOpacity = 0.7f;
        // 影の色
        self.layer.shadowColor = [UIColor colorWithHexString:@"999999" alpha:1].CGColor;
        // ぼかしの量
        self.layer.shadowRadius = 1;
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}


-(id)initWithCoder:(NSCoder *)aDecoder{
    self = [super initWithCoder:aDecoder];
    if (self) {
//        self.layer.borderColor = [UIColor colorWithHexString:@"cccccc" alpha:1].CGColor;
//        self.layer.borderWidth = 1;
        self.layer.cornerRadius = 3;
        self.layer.masksToBounds = NO;
        // 影のかかる方向を指定する
        self.layer.shadowOffset = CGSizeMake(0, 0);
        // 影の透明度
        self.layer.shadowOpacity = 0.7f;
        // 影の色
        self.layer.shadowColor = [UIColor colorWithHexString:@"999999" alpha:1].CGColor;
        // ぼかしの量
        self.layer.shadowRadius = 1;
        
    }
    return self;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
