//
//  DetailViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

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
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    [_tableView registerNib:[UINib nibWithNibName:@"DetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    
    _textView.delegate = self;
    _textView.layer.borderWidth = 1;
    _textView.layer.borderColor = [UIColor colorWithHexString:@"999999" alpha:1].CGColor;
    _textView.layer.cornerRadius = 3;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardHide:) name:UIKeyboardWillHideNotification object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(onKeyboardShow:) name:UIKeyboardWillShowNotification object:nil];
    
    _reactionList = @[].mutableCopy;
    
    [self fetchReactionList];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _reactionList.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
        OHAttributedLabel *label = [[OHAttributedLabel alloc] initWithFrame:CGRectMake(30, 80, 260, 180)];
        [[cell viewWithTag:10] removeFromSuperview];
        [[cell viewWithTag:20] removeFromSuperview];
        label.numberOfLines = 0;
        label.tag = 10;
        NSString *text = _targetStatus[@"comment"];
        NSMutableAttributedString *attrStr = [NSMutableAttributedString attributedStringWithString:text];
        [attrStr setFont:[UIFont systemFontOfSize:13.0]];
        label.attributedText = attrStr;
        [cell addSubview:label];
        
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:13.0]
                       constrainedToSize:CGSizeMake(260, 900)];
        float height = (size.height)*1.4;
        
        FeedView *feedView = [[FeedView alloc] initWithFrame:CGRectMake(7, 7, 306, height + 80)];
        feedView.tag = 20;
        [cell addSubview:feedView];
        [cell sendSubviewToBack:feedView];
        NSURL *url = [NSURL URLWithString:_targetStatus[@"img"]];
        [cell.userImageView sd_setImageWithURL:url];
        
        cell.statusLabel.text = [NSString stringWithFormat:@"%@さんが%@の%@について投稿しました", _targetStatus[@"name"], _targetStatus[@"company_name"], _targetStatus[@"category_name"]];
        return cell;
    } else {
        DetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
        NSURL *url = [NSURL URLWithString:_reactionList[indexPath.row - 1][@"img"]];
        [cell.userImageView sd_setImageWithURL:url];
        cell.nameLabel.text = _reactionList[indexPath.row - 1][@"name"];
        OHAttributedLabel *label = [[OHAttributedLabel alloc] initWithFrame:CGRectMake(30, 80, 260, 180)];
        [[cell viewWithTag:10] removeFromSuperview];
        [[cell viewWithTag:20] removeFromSuperview];
        label.numberOfLines = 0;
        label.tag = 10;
        NSString *text = _reactionList[indexPath.row - 1][@"reaction"];
        NSMutableAttributedString *attrStr = [NSMutableAttributedString attributedStringWithString:text];
        [attrStr setFont:[UIFont systemFontOfSize:13.0]];
        label.attributedText = attrStr;
        [cell addSubview:label];
        
        CGSize size = [text sizeWithFont:[UIFont systemFontOfSize:13.0]
                       constrainedToSize:CGSizeMake(260, 900)];
        float height = (size.height)*1.4;
        
        FeedView *feedView = [[FeedView alloc] initWithFrame:CGRectMake(7, 0, 306, height + 86)];
        feedView.tag = 20;
        [cell addSubview:feedView];
        [cell sendSubviewToBack:feedView];
        
        return cell;
    }
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        NSString *str = _targetStatus[@"comment"];
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:13.0]
                      constrainedToSize:CGSizeMake(260, 900)];
        return (size.height)*1.4 + 90;
    } else {
        NSString *str = _reactionList[indexPath.row - 1][@"reaction"];
        CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:13.0]
                      constrainedToSize:CGSizeMake(260, 900)];
        return (size.height)*1.4 + 90;
    }
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}



-(void)adjustEditArea :(BOOL)isAnimate{
    float baseViewY = _nowKeyBoardY + 8;
    float baseTextY = _nowKeyBoardY - 7;
    
    CGRect frame2 = _commentView.frame;
    frame2.size.height = _textView.contentSize.height + 20;
    frame2.origin.y = baseViewY - frame2.size.height;
    
    
    CGRect frame = _textView.frame;
    frame.size.height = _textView.contentSize.height;
    frame.origin.y = baseTextY - frame.size.height;
    
    if (isAnimate) {
        [UIView animateWithDuration:0.3 animations:^(void){
            [_commentView setFrame:frame2];
            [_textView setFrame:frame];
        }];
    } else {
        [_commentView setFrame:frame2];
        [_textView setFrame:frame];
    }
}

-(void)putInBackEditArea{
    CGRect frame2 = _textView.frame;
    frame2.size.height = 31;
    frame2.origin.y = 568 - frame2.size.height - 8;
    
    
    CGRect frame = _commentView.frame;
    frame.size.height = 46;
    frame.origin.y = 568 - frame.size.height;
    
    [UIView animateWithDuration:0.25 animations:^(void){
        [_commentView setFrame:frame];
        [_textView setFrame:frame2];
    }];
}

-(void)textViewDidChange:(UITextView*)textView{
    [self adjustEditArea:YES];
    
}

- (void)textViewDidBeginEditing:(UITextView *)textView{
    [self adjustEditArea:YES];
}

-(void)onKeyboardHide:(NSNotification *)notification
{
    [self putInBackEditArea];
}

-(void)onKeyboardShow:(NSNotification *)notification
{
    CGRect keyboardFrameEnd = [[notification.userInfo
                                objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    keyboardFrameEnd = [self.view convertRect:keyboardFrameEnd
                                     fromView:self.view.window];
    _nowKeyBoardY = keyboardFrameEnd.origin.y;
    [self adjustEditArea:YES];
}

-(void)fetchReactionList{
    [Timeline fetchReactionList:_targetStatus[@"id"]].always(^(NSData *data){
        _reactionList = (NSMutableArray*)data;
        [_tableView reloadData];
    });
}




- (IBAction)tapBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)tapPostButton:(id)sender {
    [SVProgressHUD show];
    [Timeline createReaction:_targetStatus[@"id"] text:_textView.text].always(^(NSData *data){
        [SVProgressHUD showSuccessWithStatus:@"投稿しました"];
        [_textView resignFirstResponder];
        _textView.text = @"";
        [self putInBackEditArea];
        [self fetchReactionList];
        
    });
    
    
}
@end
