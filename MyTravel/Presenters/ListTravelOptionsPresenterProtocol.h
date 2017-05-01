//
//  ListTravelOptionsPresenterProtocol.h
//  MyTravel
//
//  Created by Anibal Ferreira on 30/04/2017.
//  Copyright © 2017 Anibal Ferreira. All rights reserved.
//

#ifndef ListTravelOptionsPresenterProtocol_h
#define ListTravelOptionsPresenterProtocol_h

#import "ListTravelOptionsPresenterDelegate.h"

@protocol ListTravelOptionsPresenterProtocol

@property (nonatomic, weak ) id<ListTravelOptionsPresenterDelegate> delegate;
@property (nonatomic, strong )NSArray* travelOptions;
@property (nonatomic, assign) NSInteger currentSortOrder;

-(void) getTravelOptions;
-(void) sortCurrentTimeOptions:(NSInteger)sortOrder;

@end

#endif /* ListTravelOptionsPresenterProtocol_h */
