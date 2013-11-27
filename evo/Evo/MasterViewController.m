//
//  MasterViewController.m
//  Evo
//
//  Created by Ashley Schneider on 1/8/13.
//  Copyright (c) 2013 Ashley Schneider. All rights reserved.
//

#import "MasterViewController.h"
#import "Database.h"
#import "DetailViewController.h"
#import "Timeline.h"
#import "CustomCell.h"
#import <QuartzCore/QuartzCore.h>
#import "CustomCollectionCell.h"

@implementation MasterViewController

- (void)awakeFromNib
{
    Database *data = [[Database alloc] init];
    timelines = [data timelineInfo];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        self.contentSizeForViewInPopover = CGSizeMake(320.0, 600.0);
    }
    [super awakeFromNib];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.tableView deselectRowAtIndexPath:[self.tableView indexPathForSelectedRow] animated:YES];
    [self setRandomBg];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;

    self.titleView.layer.shadowOffset = CGSizeMake(-15, 15);
    self.titleView.layer.shadowOpacity = 1.0;
    self.titleView.layer.shadowRadius = 4;
    self.titleView.layer.masksToBounds = NO;
    self.titleView.layer.shadowColor = [[UIColor blackColor] CGColor];
    
    
    UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
    self.navigationItem.rightBarButtonItem = addButton;
    self.detailViewController = [[DetailViewController alloc] initWithNibName:@"DetailView" bundle:[NSBundle mainBundle]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView
     numberOfItemsInSection:(NSInteger)section
{
    return timelines.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCollectionCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"animalCell" forIndexPath:indexPath];
    Timeline *object = timelines[indexPath.row];
    cell.name.text = [object getName];
    NSArray *anims = [object getAnimals];
    //[cell.layer setBorderColor:[UIColor colorWithRed:213.0/255.0f green:210.0/255.0f blue:199.0/255.0f alpha:0.3f].CGColor];
   // [cell.layer setBorderWidth:1.0f];
    NSString* x = @"p-";
    cell.layer.cornerRadius = 2;
    [cell.layer setShadowOffset:CGSizeMake(0, 3)];
    [cell.layer setShadowRadius:2.0];
    [cell.layer setShadowColor:[UIColor blackColor].CGColor] ;
    [cell.layer setShadowOpacity:0.2];
    [cell.layer setShadowPath:[[UIBezierPath bezierPathWithRect:cell.bounds] CGPath]];
    cell.desc.text = object.getDesc;
    [cell.animalImg setImage:[UIImage imageNamed:[x stringByAppendingString:[anims[anims.count - 1] getFileName]]]];
    
    //[[cell button] addTarget:self action:@selector(myClickEvent:event:) forControlEvents:UIControlEventTouchUpInside];
   

    return cell;
}
-(IBAction)myClickEvent:(id)sender event:(id)event {
    
    NSSet *touches = [event allTouches];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint currentTouchPosition = [touch locationInView:_test ];
    
    NSIndexPath *indexPath = [_test indexPathForItemAtPoint: currentTouchPosition];
    NSLog(@"%i", indexPath.row);
    cur = indexPath.row;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        
        Timeline *object = timelines[indexPath.row];
        [self.detailViewController setTimeline:object];
        
    }

}
-(void)setRandomBg{
    int randNum = arc4random() % 4;
    
    if(randNum == 0){
        [self.bg setImage:[UIImage imageNamed:@"red.jpg"]];
    }
    else if(randNum == 1){
        [self.bg setImage:[UIImage imageNamed:@"blue.jpg"]];
    }
    else if(randNum == 2){
        [self.bg setImage:[UIImage imageNamed:@"green.jpg"]];
    }
    else if(randNum == 3){
        [self.bg setImage:[UIImage imageNamed:@"yellow.jpg"]];
    }
}
#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return timelines.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CustomCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    Timeline *object = timelines[indexPath.row];
    cell.title.text = [object getName];
    NSArray *anims = [object getAnimals];
    [cell.image setImage:[UIImage imageNamed:[anims[anims.count - 1] getFileName]]];
        return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        Timeline *object = timelines[indexPath.row];
        [self.detailViewController setTimeline:object];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"p");
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        Timeline *object = timelines[cur];
        [[segue destinationViewController] setTimeline:object];
    }
}

- (IBAction)cellTap:(id)sender {
}
- (IBAction)cellButtonPressed:(id)sender forEvent:(UIEvent *)event {
    NSSet *touches = [event allTouches];
    
    UITouch *touch = [touches anyObject];
    
    CGPoint currentTouchPosition = [touch locationInView:_test ];
    
    NSIndexPath *indexPath = [_test indexPathForItemAtPoint: currentTouchPosition];
    NSLog(@"%i", indexPath.row);
    cur = indexPath.row;
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPad) {
        Timeline *object = timelines[indexPath.row];
        [self.detailViewController setTimeline:object];
    }

}
@end
