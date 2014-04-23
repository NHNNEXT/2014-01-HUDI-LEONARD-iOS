//
//  CJUserDataModel.h
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 9..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import "CJUserImageData.h"

@interface CJUserDataModel : NSObject
@property (strong, nonatomic) NSMutableArray *userImageModel;

+ (CJUserDataModel*) sharedInstance;
- (void) addPhotos: (NSArray *) chosen;

@end
