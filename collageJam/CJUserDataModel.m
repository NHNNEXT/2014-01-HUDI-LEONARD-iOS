//
//  CJUserDataModel.m
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 9..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import "CJUserDataModel.h"

@implementation CJUserDataModel
@synthesize userImageModel = _userImageModel;

- (id)init
{
    self = [super init];
    if (self) {
        _userImageModel = [[NSMutableArray alloc] init];
    }
    return self;
}

+ (CJUserDataModel*) sharedInstance
{
    static CJUserDataModel *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    
    return sharedInstance;
}

- (void) addPhotos: (NSArray *) chosen
{
    for ( ALAsset *eachPhoto in chosen )
    {
        NSURL *photoURL = [[eachPhoto defaultRepresentation] url];
        NSDate *photoDate = [eachPhoto valueForProperty:ALAssetPropertyDate];
        UIImage *photoThumbnail = [UIImage imageWithCGImage:[eachPhoto aspectRatioThumbnail]];
        
        CJImageDataModel *imageData = [[CJImageDataModel alloc] initWithURL:photoURL
                                                                       Date:photoDate
                                                                  Thumbnail:photoThumbnail];
        [_userImageModel addObject: imageData];
    }
}


@end
