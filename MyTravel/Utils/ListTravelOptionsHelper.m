//
//  ListTravelOptionsHelper.m
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

#import "ListTravelOptionsHelper.h"
@implementation ListTravelOptionsHelper

+(void)showAlertWith:(UIViewController *) viewController title:(NSString*)title message:(NSString*)message dissmissAfer:(double)dismissTime {

    UIAlertController *alertController =
    [UIAlertController alertControllerWithTitle:title
                                        message:message
                                 preferredStyle:UIAlertControllerStyleAlert];

    [viewController presentViewController:alertController animated:YES completion:nil];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(dismissTime * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{

        [alertController dismissViewControllerAnimated:YES completion:^{
            // do something ?
        }];

    });
}

+ (UITableViewCell *)tableView:(UITableView *)tableView cellForTravelOption:(TravelOption *)travelOption withIdentifier:(NSString *)identifier atIndexPath:(NSIndexPath *)indexPath {

    TravelOptionTableViewCell *cell = (TravelOptionTableViewCell *) [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];

    [cell.travelOptionPrice setText:[NSString stringWithFormat:@"€ %@",travelOption.priceInEuros]];

    NSString *details = [NSString stringWithFormat:@"%@ - %@", travelOption.departureTime, travelOption.arrivalTime];

    if (travelOption.numberOfStops >0) {
        details = [details stringByAppendingString:[NSString stringWithFormat:@" (+%ld)", travelOption.numberOfStops]];
    }

    [cell.travelOptionDetails setText:details];

    dispatch_async(dispatch_get_global_queue(0,0), ^{
        NSString * finalUrl = [travelOption.providerLogoUrl stringByReplacingOccurrencesOfString:@"{size}"
                                                                                      withString:@"63"];
        NSData * data = [[NSData alloc] initWithContentsOfURL: [NSURL URLWithString: finalUrl]];
        if ( data == nil )
            return;
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.travelOptionLogo.image = [UIImage imageWithData: data];
        });
    });

    [cell.travelOptionDuration setText:[NSString stringWithFormat:@" Direct   %@",travelOption.duration]];

    [cell setAccessoryType:UITableViewCellAccessoryDisclosureIndicator];
    
    return cell;
}

@end
