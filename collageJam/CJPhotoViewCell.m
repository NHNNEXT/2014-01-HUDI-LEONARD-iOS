//
//  CJPhotoViewCell.m
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 14..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import "CJPhotoViewCell.h"

@implementation CJPhotoViewCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        _repImageView = [[UIImageView alloc] initWithFrame:[self.contentView bounds]];
        [_repImageView.layer setMasksToBounds:YES];
        [_repImageView setContentMode:UIViewContentModeScaleAspectFill];
        
        _deleteButton = [[UIButton alloc] init];
        NSString *deletePath = [[NSBundle mainBundle] pathForResource:@"blackDeleteButton.png" ofType:nil];
        UIImage *deleteButtonImage = [UIImage imageWithContentsOfFile:deletePath];
        [CATransaction begin];
        [CATransaction setValue:(id)kCFBooleanTrue forKey:kCATransactionDisableActions];
        [_deleteButton setFrame: CGRectMake(82, 5, 20, 20)];
        [CATransaction commit];
        [_deleteButton setImage: deleteButtonImage forState:UIControlStateNormal];

        [self.contentView addSubview:_repImageView];
        [self.contentView addSubview:_deleteButton];
    }
    return self;
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect
 {
 // Drawing code
 }
 */

@end
