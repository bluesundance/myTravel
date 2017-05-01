//
//  TravelOptionTableViewCell.h
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TravelOptionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *travelOptionLogo;
@property (weak, nonatomic) IBOutlet UILabel *travelOptionPrice;
@property (weak, nonatomic) IBOutlet UILabel *travelOptionDetails;
@property (weak, nonatomic) IBOutlet UILabel *travelOptionDuration;

@end
