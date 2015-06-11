//
//  MasterViewController.m
//  Stretch My Header
//
//  Created by Ian Tsai on 2015-06-09.
//  Copyright (c) 2015 Ian Tsai. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "NewsItem.h"
#import "NewsTableViewCell.h"

const double kTableHeaderHeight = 250.0;

@interface MasterViewController () <UIScrollViewDelegate>

@property NSMutableArray *objects;

@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@property (weak, nonatomic) IBOutlet UIView *headerView;


@end

@implementation MasterViewController

- (void)awakeFromNib {
    [super awakeFromNib];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
    self.tableView.tableHeaderView = nil;
    [self.tableView addSubview:self.headerView];
    self.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0.0, 0.0, 0.0);
    
    //
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    
    //date label
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"MMMM dd"];
    
    NSDate *currentDate = [NSDate date];
    self.dateLabel.text = [formatter stringFromDate:currentDate];
    
    //setting table view cell height
    self.tableView.estimatedRowHeight = 100;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.navigationController setNavigationBarHidden:YES];
    
    //adding objects to array
    self.objects = [NSMutableArray array];
    
    NewsItem *newsItem = [[NewsItem alloc] init];
    newsItem.category = @"World";
    newsItem.headline = @"Climate change protests, divestments meet fossil fuels realities";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"Americas";
    newsItem.headline = @"Officials: FBI is tracking 100 Americans who fought alongside IS in Syria";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"Europe";
    newsItem.headline = @"Scotland's 'Yes' leader says independence vote is 'once in a lifetime";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"Middle East";
    newsItem.headline = @"Airstrikes boost Islamic State, FBI director warns more hostages possible";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"Africa";
    newsItem.headline = @"Nigeria says 70 dead in building collapse; questions S. Africa victim claim";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"Asia Pacific";
    newsItem.headline = @"Despite UN ruling, Japan seeks backing for whale hunting";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"World";
    newsItem.headline = @"South Africa in $40 billion deal for Russian nuclear reactors";
    [self.objects addObject:newsItem];
    
    newsItem = [[NewsItem alloc] init];
    newsItem.category = @"Europe";
    newsItem.headline = @"One million babies' created by EU student exchanges";
    [self.objects addObject:newsItem];
    
    
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView {
    
    [self updateHeaderView:scrollView.contentOffset];
    
}

-(void)updateHeaderView:(CGPoint)contentOffSet {
    

//    CGRect newFrame = self.headerView.frame;
//    newFrame.origin.y = self.tableView.contentOffset.y;
//    self.headerView.frame = newFrame;
//    
//    if (self.tableView.contentOffset.y < 0) {
//        
//        CGRect frame = self.headerView.frame;
//        frame.origin.y = self.tableView.contentOffset.y;
//        frame.size.height = 0 - self.tableView.contentOffset.y;
//        self.headerView.frame = frame;
//        
//    }
    
    CGFloat frameWidth = self.tableView.frame.size.width;
    CGFloat frameHeight = MAX(kTableHeaderHeight, -contentOffSet.y);
    self.headerView.frame = CGRectMake(0, -frameHeight, frameWidth, frameHeight);
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

-(BOOL)prefersStatusBarHidden {
    
    return YES;
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        NSDate *object = self.objects[indexPath.row];
        [[segue destinationViewController] setDetailItem:object];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.objects.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NewsTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    cell.object = (self.objects)[indexPath.row];
    
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.objects removeObjectAtIndex:indexPath.row];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
