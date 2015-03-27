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
#import "PlainTableViewCell.h"
#import "TeamMemberTableViewCell.h"
#import "MemberDetailViewController.h"
#define TABLEVIEW_CELL_REUSE_ID @"ItemDetailTableViewCell"
#define TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID @"ImageViewTableViewCell"
#define TABLEVIEW_CELL_PLAINTEXT_REUSE_ID @"PlainTableViewCell"
#define TABLEVIEW_CELL_TEMAM_MEMBER_REUSE_ID @"TeamMemberTableViewCell"
@interface ItemDetailTableViewController ()
{
    NSInteger segmentSelected;
    NSMutableDictionary* textCellheight;
}
@end

@implementation ItemDetailTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    segmentSelected =0;
    textCellheight = [NSMutableDictionary new];
    [self.tableView registerNib:[UINib nibWithNibName:TABLEVIEW_CELL_REUSE_ID bundle:nil] forCellReuseIdentifier:TABLEVIEW_CELL_REUSE_ID];
    [self.tableView registerNib:[UINib nibWithNibName:TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID bundle:nil] forCellReuseIdentifier:TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID];
    [self.tableView registerNib:[UINib nibWithNibName:TABLEVIEW_CELL_PLAINTEXT_REUSE_ID bundle:nil] forCellReuseIdentifier:TABLEVIEW_CELL_PLAINTEXT_REUSE_ID];
    [self.tableView registerNib:[UINib nibWithNibName:TABLEVIEW_CELL_TEMAM_MEMBER_REUSE_ID bundle:nil] forCellReuseIdentifier:TABLEVIEW_CELL_TEMAM_MEMBER_REUSE_ID];
    self.title =[self.data objectForKey:@"appName"];
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
        if (section == 1) {
            switch (segmentSelected) {
                case 0:
                    return ((NSArray*)[self.data objectForKey:@"description"]).count;
                    break;
                case 1:
                    return 0;
                    break;
                case 2:
                    return ((NSArray*)[self.data objectForKey:@"teamsize"]).count;
                    break;
                    
                default:
                    break;
            }
        }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        ItemDetailTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_REUSE_ID forIndexPath:indexPath];
    cell.iconImageView.image = [UIImage imageNamed:[self.data objectForKey:@"iconImage"]];
    cell.appNameLabel.text = [self.data objectForKey:@"appName"];
    cell.partnerLabel.text = [self.data objectForKey:@"partner"];
    cell.releaseDateLabel.text = [self.data objectForKey:@"releaseDate"];
    return cell;
    }
    else if (indexPath.section == 1)
    {
        switch (segmentSelected) {
            case 0://App Description
            {
                NSDictionary* cellInfos = [[self.data objectForKey:@"description"]objectAtIndex:indexPath.row];
                int tableViewStyle = [[cellInfos objectForKey:@"tableViewStyle"]intValue];
                switch (tableViewStyle) {
                    case TABLEVIEWCELL_STYLE_IMAGEVIEW:
                    {
                        ImageViewTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_IMAGEVIEW_REUSE_ID];
                        
                        NSArray* images = [cellInfos objectForKey:@"images"];
                        for (int i = 0 ; i < images.count; i++)
                        {
                            UIImageView* screenShot = [[UIImageView alloc]initWithFrame:CGRectMake(10*i +160*i +10, 10, 160, 284)];
                            UIButton* button = [[UIButton alloc]initWithFrame:CGRectMake(10*i +160*i +10, 10, 160, 284)];
                            button.tag = 1100+i;
                            screenShot.contentMode = UIViewContentModeScaleAspectFit;
                            [screenShot setImage:[UIImage imageNamed:[images  objectAtIndex:i]]];
                            button.titleLabel.tag = indexPath.row;
                            [button addTarget:self action:@selector(ImageSelected:) forControlEvents:UIControlEventTouchUpInside];
                            
                            //cell.scrollView.contentInset = UIEdgeInsetsMake(0, 10, 0, 10)
                            [cell.scrollView addSubview:screenShot];
                            [cell.scrollView addSubview:button];
                        }
                        cell.scrollView.contentSize = CGSizeMake(160*images.count+10*(images.count+1), 284);
                        cell.scrollView.alwaysBounceVertical = NO;
                        return cell;
                    }
                        break;
                    case TABLEVIEWCELL_STYLE_PLAINTEXT:
                    {
                        PlainTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_PLAINTEXT_REUSE_ID];
                        cell.titlelabel.text = [cellInfos objectForKey:@"title"];
                        cell.containlabel.text = [cellInfos objectForKey:@"text"];
                        CGRect labelFrame = cell.containlabel.frame;
                        labelFrame.size.width = 310;
                        //NSLog([NSString stringWithFormat:@"%f",cell.containlabel.frame.size.height]);
                        cell.containlabel.numberOfLines=0;
                        cell.containlabel.frame = labelFrame;
                        //cell.containlabel.backgroundColor = [UIColor grayColor];
                       [cell.containlabel sizeToFit];
                        //NSLog([NSString stringWithFormat:@"%f",cell.containlabel.frame.size.height]);
                        
                        [textCellheight setObject:[NSNumber numberWithFloat:(cell.containlabel.frame.size.height + 40)] forKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]];
                        
                        return cell;
                    }
                        break;
                    default:
                        break;
                }
            }
                break;
            case 1://Technologies
            {
            }
                break;
            case 2://Team size
            {
                NSDictionary* data = [[self.data objectForKey:@"teamsize"]objectAtIndex:indexPath.row];
                TeamMemberTableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:TABLEVIEW_CELL_TEMAM_MEMBER_REUSE_ID];
                cell.memberImageView.image = [UIImage imageNamed:[data objectForKey:@"memberImage"]];
                cell.memberNameLabel.text =[data objectForKey:@"memberName"];
                cell.memberTitle.text = [data objectForKey:@"memberTitle"];
                //prepare Data
                cell.memberImageView.layer.cornerRadius = cell.memberImageView.frame.size.height/2;
                [cell.memberImageView.layer setMasksToBounds:YES];
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
    NSInteger index = ((UIButton*)sender).titleLabel.tag;
    NSDictionary* cellInfos = [[self.data objectForKey:@"description"]objectAtIndex:index];
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
    {
        
            switch (segmentSelected) {
                case 0:
                {
                    NSDictionary* cellInfos = [[self.data objectForKey:@"description"]objectAtIndex:indexPath.row];
                    int tableViewStyle = [[cellInfos objectForKey:@"tableViewStyle"]intValue];
                    switch (tableViewStyle)
                    {
                        case TABLEVIEWCELL_STYLE_IMAGEVIEW:
                        {
                            return 304;
                        }
                            break;
                        case TABLEVIEWCELL_STYLE_PLAINTEXT:
                        {
                            return [[textCellheight objectForKey:[NSString stringWithFormat:@"%ld",(long)indexPath.row]] floatValue];
                        }
                            break;
                        default:
                            break;
                    }

                }
                    break;
                case 1:
                    return 66;
                    break;
                case 2:
                    return 66;
                    break;
                    
                default:
                    break;
            }
        

        
            }
    
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
        segmented.selectedSegmentIndex = segmentSelected;
        
        [headerView addSubview:segmented];
        headerView.backgroundColor = [UIColor whiteColor];
        return headerView;
    }

    return nil;
}

-(void)MySegmentControlAction:(UISegmentedControl*)segmented
{
    segmentSelected = segmented.selectedSegmentIndex;
    [self.tableView reloadData];

   
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
    if (indexPath.section == 1 && segmentSelected == 2) {
        MemberDetailViewController* controller = [MemberDetailViewController  new];
        controller.data = [[self.data objectForKey:@"teamsize"]objectAtIndex:indexPath.row];
        
        [self.navigationController pushViewController:controller animated:YES];
        
    }
}

@end
