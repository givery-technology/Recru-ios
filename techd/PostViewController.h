//
//  PostViewController.h
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SBPickerSelector.h"

@interface PostViewController : UIViewController<SBPickerSelectorDelegate>

- (IBAction)tapCancelButton:(id)sender;

- (IBAction)tapPostButton:(id)sender;

- (IBAction)tapCategorySelect:(id)sender;

- (IBAction)tapFeelingSelect:(id)sender;


@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UILabel *selectLabel;


@end
