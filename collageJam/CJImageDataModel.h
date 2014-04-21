//
//  CJImageDataModel.h
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 9..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CJImageDataModel : NSObject
@property (strong, nonatomic) NSURL *photoURL;
@property (strong, nonatomic) NSDate *photoDate;
@property (strong, nonatomic) UIImage *thumbnailPhoto;
@property (strong, nonatomic) NSIndexPath *indexPath;

- (id) initWithURL:(NSURL *)theURL
              Date:(NSDate *)theDate
         Thumbnail:(UIImage *)theThumbnail;
@end
