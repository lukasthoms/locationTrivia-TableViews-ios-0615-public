//
//  FISLocationsTableViewController.m
//  locationTrivia-tableviews
//
//  Created by Lukas Thoms on 6/16/15.
//  Copyright (c) 2015 Joe Burgess. All rights reserved.
//

#import "FISLocationsTableViewController.h"
#import "FISTriviaTableViewController.h"

@interface FISLocationsTableViewController ()

@end

@implementation FISLocationsTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.accessibilityLabel = @"Locations Table";
    self.tableView.accessibilityIdentifier = @"Locations Table";
    
    FISLocation *rockIsland = [[FISLocation alloc] initWithName:@"Rock Island, IL" Latitude:@0 Longitude:@0];
    FISTrivia *rq1 = [[FISTrivia alloc] initWithContent:@"What is the number of the dam located in Rock Island?" Likes:2];
    FISTrivia *rq2 = [[FISTrivia alloc] initWithContent:@"What famous general made a home in Rock Island?" Likes:4];
    rockIsland.trivia = [@[rq1, rq2] mutableCopy];
    FISLocation *exeter = [[FISLocation alloc] initWithName:@"Exeter, NH" Latitude:@12 Longitude:@12];
    FISTrivia *e1 = [[FISTrivia alloc] initWithContent:@"What prep school is located in Exeter?" Likes:1];
    FISTrivia *e2 = [[FISTrivia alloc] initWithContent:@"What river flows through Exeter?" Likes:5];
    FISTrivia *e3 = [[FISTrivia alloc] initWithContent:@"What successful presidential candidate didn't visit Exeter in 2008?" Likes:5];
    exeter.trivia = [@[e1, e2, e3] mutableCopy];
    self.locations = @[rockIsland, exeter];
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    // Return the number of rows in the section.
    return self.locations.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"locationCell" forIndexPath:indexPath];
    
    FISLocation *location = self.locations[indexPath.row];
    NSString *locationName = location.name;
    NSUInteger numberOfTrivia = location.trivia.count;
    cell.textLabel.text = locationName;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu",numberOfTrivia];
    
    return cell;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/


#pragma mark - Navigation

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UITableViewCell*)sender {
    FISTriviaTableViewController *destination = segue.destinationViewController;
//    CGPoint buttonPosition = [sender convertPoint:CGPointZero toView:self.tableView];
//    NSIndexPath *indexPath = [self.tableView indexPathForRowAtPoint:buttonPosition];
    NSIndexPath *indexPath = self.tableView.indexPathForSelectedRow;
    FISLocation *selectedLocation = self.locations[indexPath.row];
    destination.trivia = selectedLocation.trivia;
}


@end
