//
//  CompanyListViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "CompanyListViewController.h"

@interface CompanyListViewController ()

@end

@implementation CompanyListViewController

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
    
    [_tableView registerNib:[UINib nibWithNibName:@"CompanyTableViewCell" bundle:nil] forCellReuseIdentifier:@"CompanyCell"];
    
    _companyList = @[].mutableCopy;
    
    [Timeline fetchCompanyList].then(^(NSData *data){
        _companyList = (NSMutableArray*)data;
        [_tableView reloadData];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _companyList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CompanyCell"];
    cell.nameLabel.text = _companyList[indexPath.row][@"name"];
    cell.industryLabel.text = _companyList[indexPath.row][@"industry_type"];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 54;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self performSegueWithIdentifier:@"companyToDetail" sender:_companyList[indexPath.row]];
    
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"companyToDetail"]) {
        CompanyDetailViewController *cdvc = segue.destinationViewController;
        cdvc.targetCompany = sender;
    }
}


- (IBAction)tapMenuButton:(id)sender {
    [self.viewDeckController toggleLeftViewAnimated:YES];
}
@end
