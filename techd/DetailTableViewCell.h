//
//  DetailTableViewCell.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;

@end
