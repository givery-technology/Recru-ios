//
//  PostViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "PostViewController.h"

@interface PostViewController ()

@end

@implementation PostViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textView.layer.borderColor = [UIColor colorWithHexString:@"cccccc" alpha:1].CGColor;
    _textView.layer.borderWidth = 1;
    _textView.clipsToBounds = YES;
}

-(void)viewDidAppear:(BOOL)animated{
    [_textView becomeFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)tapCancelButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)tapPostButton:(id)sender {
    [SVProgressHUD show];
    
    [Timeline createContribution:@1 companyId:@1 text:_textView.text].always(^(NSData *data){
        [SVProgressHUD showSuccessWithStatus:@"投稿しました"];
        [self dismissViewControllerAnimated:YES completion:nil];
    });
    
}

- (IBAction)tapCategorySelect:(id)sender {
    [_textView resignFirstResponder];
    [self showGenderPicker:sender];
}

-(void)showGenderPicker:(id)sender {
    SBPickerSelector *picker = [SBPickerSelector picker];
    picker.tag = 2;
    
    picker.pickerData = [@[@"雰囲気",@"オフィスのかっこよさ",@"選考状況"] mutableCopy]; //picker content
    picker.delegate = self;
    picker.pickerType = SBPickerSelectorTypeText;
    picker.doneButtonTitle = @"Done";
    picker.cancelButtonTitle = @"Cancel";
    
    CGPoint point = [self.view convertPoint:[sender frame].origin fromView:[sender superview]];
    CGRect frame = [sender frame];
    frame.origin = point;
    [picker showPickerIpadFromRect:frame inView:self.view];

}

-(void) SBPickerSelector:(SBPickerSelector *)selector selectedValue:(NSString *)value index:(NSInteger)idx{
    _selectLabel.text = value;
    
}


@end
