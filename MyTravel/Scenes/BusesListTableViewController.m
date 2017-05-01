//
//  BusesListTableViewController.m
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

#import "BusesListTableViewController.h"
#import "TravelOptionTableViewCell.h"
#import "ListTravelOptionsHelper.h"
#import "MyTravel-Swift.h"

@interface BusesListTableViewController ()

@property (nonatomic, strong) UIActivityIndicatorView *activityView;

@end

@implementation BusesListTableViewController

@synthesize activityView;

static NSString* travelOptionCellIdentifier = @"TravelOptionCell";
static NSString* travelOptionCellNibName = @"TravelOptionTableViewCell";

- (void)viewDidLoad {
    [super viewDidLoad];

    self.presenter.delegate = self;
}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];

    [self.tableView registerNib:[UINib nibWithNibName: travelOptionCellNibName
                                               bundle:[NSBundle mainBundle]] forCellReuseIdentifier: travelOptionCellIdentifier];

    [activityView startAnimating];
    [self.tableView setBackgroundView:activityView];

    [self.presenter getTravelOptions];
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
    return [self.presenter.travelOptions count];
}


-(void)didGetTravelOptionsWithTravelOptions:(NSArray *)travelOptions {

    [activityView stopAnimating];
    [self.tableView setBackgroundView:nil];
    [self.tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    TravelOption* travelOption = [self.presenter.travelOptions objectAtIndex:indexPath.row];

    return [ListTravelOptionsHelper tableView:self.tableView cellForTravelOption:travelOption withIdentifier:travelOptionCellIdentifier atIndexPath:indexPath];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {

    return UITableViewAutomaticDimension;
}

- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {

    [ListTravelOptionsHelper showAlertWith:self title:@"Info" message:@"Offer details are not yet implemented!" dissmissAfer:1.5];
}

- (IBAction)didTapSortingButton:(UIBarButtonItem *)sender {

    if(self.presenter.currentSortOrder == TimeOptionsSortOrderDepartureTime) {
        [self.presenter sortCurrentTimeOptions:TimeOptionsSortOrderArrivalTime];
    } else {
        [self.presenter sortCurrentTimeOptions:TimeOptionsSortOrderDepartureTime];
    }

    [self.tableView reloadData];
}
@end
