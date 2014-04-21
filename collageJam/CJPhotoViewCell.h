//
//  CJPhotoViewCell.h
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 14..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CJUserDataModel.h"

@interface CJPhotoViewCell : UICollectionViewCell
{
    CJUserDataModel *_userImageModel;
    
}

@property (strong, nonatomic) UIImageView *repImageView;
@property (strong, nonatomic) UIButton *deleteButton;

@end
