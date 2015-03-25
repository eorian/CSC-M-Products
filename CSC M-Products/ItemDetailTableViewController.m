//
//  ItemDetailTableViewController.m
//  CSC M-Products
//
//  Created by namle on 3/24/15.
//  Copyright (c) 2015 TrungPhan. All rights reserved.
//

#import "ItemDetailTableViewController.h"
#import "ItemDetailTableViewCell.h"
#import "GlobalData.h"
#import "Constant.h"
#import "ImageViewTableViewCell.h"
#import "ImagePageViewController.h"
#define TABLEVIEW_CELL_REUSE_ID @"ItemDetailTableViewCell"
#define TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID @"ImageViewTableViewCell"
@interface ItemDetailTableViewController ()

@end

@implementation ItemDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:TABLEVIEW_CELL_REUSE_ID bundle:nil] forCellReuseIdentifier:TABLEVIEW_CELL_REUSE_ID];
    [self.tableView registerNib:[UINib nibWithNibName:TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID bundle:nil] forCellReuseIdentifier:TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID];
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 1;
    }
    else
        return [GlobalData sharedManager].description.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ItemDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_REUSE_ID forIndexPath:indexPath];
    cell.iconImageView.image = [UIImage imageNamed:[self.firstCellData objectForKey:@"iconImage"]];
    cell.appNameLabel.text = [self.firstCellData objectForKey:@"appName"];
    cell.partnerLabel.text = [self.firstCellData objectForKey:@"partner"];
    cell.releaseDateLabel.text = [self.firstCellData objectForKey:@"releaseDate"];
    return cell;
    }
    else if (indexPath.section == 1)
    {
        
        NSDictionary* cellInfos = [[GlobalData sharedManager].description objectForKey:@"descriptionImages"];
        int tableViewStyle = [[cellInfos objectForKey:@"tableViewCellStyle"]intValue];
        switch (tableViewStyle) {
            case TABLEVIEWCELL_STYLE_IMAGEVIEW:
            {
                ImageViewTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID];
                NSArray* images = [cellInfos objectForKey:@"images"];
                for (int i = 0 ; i < images.count; i++)
                {
                    UIButton* screenShot = [[UIButton alloc]initWithFrame:CGRectMake(10*i +160*i +10, 10, 160, 284)];
                    screenShot.tag = 1100+i;
                    [screenShot setBackgroundImage:[UIImage imageNamed:[images  objectAtIndex:i]] forState:UIControlStateNormal];;
                    screenShot.contentMode = UIViewContentModeScaleAspectFit;
                    [screenShot addTarget:self action:@selector(ImageSelected:) forControlEvents:UIControlEventTouchUpInside];
                    cell.scrollView.contentSize = CGSizeMake(160*5+60, 284);
                    cell.scrollView.alwaysBounceVertical = NO;
                    //cell.scrollView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
                    [cell.scrollView addSubview:screenShot];
                }
                    return cell;
            }
                break;
            default:
                break;
        }
    }
    return nil;
}
- (void)ImageSelected:(id)sender
{
    NSDictionary* cellInfos = [[GlobalData sharedManager].description objectForKey:@"descriptionImages"];
    NSArray* images = [cellInfos objectForKey:@"images"];
    //getImage Array and create new scrollViewController to show it
    
    ImagePageViewController* controller = [[ImagePageViewController alloc]init];
    controller.data = images;
    controller.selectedIndex = ((UIButton*)sender).tag - 1100;
    [self.navigationController pushViewController:controller animated:YES];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(indexPath.section == 0)
    {
        return 90.0f;
    }else if(indexPath.section == 1)
        return 304.0f;
    return 0;

}
- (UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 1) {
        UIView* headerView = [[UIView alloc]initWithFrame:CGRectMake(0.0f, 0.0f, self.view.bounds.size.width, 44.0f)];
        NSArray* segmentedItems = @[@"Descriptions",@"Technology",@"Team size"];
        UISegmentedControl* segmented = [[UISegmentedControl alloc]initWithItems:segmentedItems];
        segmented.frame = CGRectMake(0, 0, self.view.bounds.size.width - 30 , 30);
        segmented.center = headerView.center;
        segmented.tintColor = [UIColor grayColor];
        [segmented addTarget:self action:@selector(MySegmentControlAction:) forControlEvents: UIControlEventValueChanged];
        segmented.selectedSegmentIndex = 0;
        [headerView addSubview:segmented];
        headerView.backgroundColor = [UIColor whiteColor];
        return headerView;
    }

    return nil;
}
-(void)MySegmentControlAction:(UISegmentedControl*)segmented
{

    NSLog(@"segmented touch:%ld", (long)segmented.selectedSegmentIndex);
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if(section == 1)
    {
        return 44.0f;
    }
    return 0;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
}

@end
