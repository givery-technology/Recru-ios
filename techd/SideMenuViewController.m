//
//  SideMenuViewController.m
//  techd
//
//  Created by Masatoshi Awashima on 2014/09/20.
//  Copyright (c) 2014年 givery. All rights reserved.
//

#import "SideMenuViewController.h"

@interface SideMenuViewController ()

@end

@implementation SideMenuViewController

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
    
    _menuNameArray = @[@"タイムライン", @"友達リスト", @"企業リスト"];
    
    [_tableView registerNib:[UINib nibWithNibName:@"MenuTableViewCell" bundle:nil] forCellReuseIdentifier:@"MenuCell"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _menuNameArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    MenuTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"MenuCell"];
    cell.nameLabel.text = _menuNameArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    return 50;
    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (indexPath.row == 0) {
        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"ViewController"];
        self.viewDeckController.centerController = viewController;
        
    } else if (indexPath.row == 1) {
        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"FriendListViewController"];
        self.viewDeckController.centerController = viewController;
    } else if (indexPath.row == 2) {
        UIViewController *viewController = [self.storyboard instantiateViewControllerWithIdentifier:@"CompanyListViewController"];
        self.viewDeckController.centerController = viewController;
    }
    [self.viewDeckController closeLeftViewAnimated:YES];
}

@end
