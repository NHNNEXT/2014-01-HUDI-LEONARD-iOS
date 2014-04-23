//
//  CJUserImageData.m
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 23..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import "CJUserImageData.h"

@implementation CJUserImageData
- (id) initWithURL:(NSURL *)theURL
              Date:(NSDate *)theDate
         Thumbnail:(UIImage *)theThumbnail
{
    if (self = [super init])
    {
        self.photoURL = theURL;
        self.photoDate = theDate;
        self.thumbnailPhoto = theThumbnail;
    }
    return self;
}
@end
