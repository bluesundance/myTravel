//
//  BusesListTableViewController.h
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ListTravelOptionsPresenterDelegate.h"
#import "ListTravelOptionsPresenterProtocol.h"

//Note: Although Xcode gives warning about not finding protocol, everything works
@interface BusesListTableViewController : UITableViewController<ListTravelOptionsPresenterDelegate>

@property (nonatomic, strong) id<ListTravelOptionsPresenterProtocol> presenter;
- (IBAction)didTapSortingButton:(UIBarButtonItem *)sender;

@end
