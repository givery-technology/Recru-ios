//
//  ViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	_tableView.delegate = self;
    _tableView.dataSource = self;
    
    [_tableView registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
    
    _timelineList = @[].mutableCopy;
    
    [self fetchTimeline];
}

-(void)viewDidAppear:(BOOL)animated{
    [self fetchTimeline];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _timelineList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    [[cell viewWithTag:20] removeFromSuperview];
    [[cell viewWithTag:10] removeFromSuperview];
    OHAttributedLabel *label = [[OHAttributedLabel alloc] initWithFrame:CGRectMake(30, 80, 260, 180)];
    label.numberOfLines = 0;
    label.tag = 10;
    NSString *text = _timelineList[indexPath.row][@"comment"];
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
    NSURL *url = [NSURL URLWithString:_timelineList[indexPath.row][@"img"]];
    [cell.userImageView sd_setImageWithURL:url];
    
    cell.statusLabel.text = [NSString stringWithFormat:@"%@さんが%@の%@について投稿しました", _timelineList[indexPath.row][@"name"], _timelineList[indexPath.row][@"company_name"], _timelineList[indexPath.row][@"category_name"]];
    
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{

    NSString *str = _timelineList[indexPath.row][@"comment"];
    CGSize size = [str sizeWithFont:[UIFont systemFontOfSize:13.0]
                                                  constrainedToSize:CGSizeMake(260, 900)];
    return (size.height)*1.4 + 90;

}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

    [self performSegueWithIdentifier:@"timelineToDetail" sender:_timelineList[indexPath.row]];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"timelineToDetail"]) {
        DetailViewController *cdvc = segue.destinationViewController;
        cdvc.targetStatus = sender;
    }
}

-(void)fetchTimeline{
    [Timeline fetchTimeline].always(^(NSData *data){
        _timelineList = (NSMutableArray*)data;
        [_tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)tapPostButton:(id)sender {
    [self performSegueWithIdentifier:@"listToPost" sender:nil];
    
}

- (IBAction)tapMenuButton:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}
@end
