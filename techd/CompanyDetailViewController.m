//
//  CompanyDetailViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/21.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "CompanyDetailViewController.h"

@interface CompanyDetailViewController ()

@end

@implementation CompanyDetailViewController

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
    
    [_tableView registerNib:[UINib nibWithNibName:@"CompanyDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"DetailCell"];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompanyDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"DetailCell"];
    cell.nameLabel.text = _targetCompany[@"name"];
    cell.inductryLabel.text = _targetCompany[@"industry_type"];
    cell.urlLabel.text = _targetCompany[@"url"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 154;
    
}


- (IBAction)tapBackButton:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
@end
