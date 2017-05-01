//
//  ListTravelOptionsHelper.h
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "TravelOptionTableViewCell.h"
#import "MyTravel-Swift.h"

@interface ListTravelOptionsHelper : NSObject
+(void)showAlertWith:(UIViewController *) viewController title:(NSString*)title message:(NSString*)message dissmissAfer:(double)dismissTime;
+ (UITableViewCell *)tableView:(UITableView *)tableView cellForTravelOption:(TravelOption *)travelOption withIdentifier:(NSString *)identifier atIndexPath:(NSIndexPath *)indexPath;

@end
