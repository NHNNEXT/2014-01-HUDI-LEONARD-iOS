//
//  CJManagingPhotoViewController.h
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 9..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LSConstantVariable.h"
#import "CJUserDataModel.h"
#import "CJPhotoViewCell.h"
#import "LXReorderableCollectionViewFlowLayout.h"
#import "QBImagePickerController.h"

@interface CJManagingPhotoViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UIActionSheetDelegate, QBImagePickerControllerDelegate>
{
    CJUserDataModel *_userDataModel;
    NSMutableArray *_userImageModel;
    UICollectionView *_collectionView;
    LXReorderableCollectionViewFlowLayout *_layout;
    UIToolbar *_myToolbar;
    QBImagePickerController *_imagePicker;
    
}

@end
