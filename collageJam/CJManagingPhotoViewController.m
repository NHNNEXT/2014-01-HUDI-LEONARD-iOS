//
//  CJManagingPhotoViewController.m
//  collageJam
//
//  Created by Wonhyo Yi on 2014. 4. 9..
//  Copyright (c) 2014년 LEONARD. All rights reserved.
//

#import "CJManagingPhotoViewController.h"

@interface CJManagingPhotoViewController ()

@end

@implementation CJManagingPhotoViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setTitle:@"Photos"];
    
    _imagePicker = [[QBImagePickerController alloc] init];
    [_imagePicker setDelegate:self];
    [_imagePicker setAllowsMultipleSelection:YES];
    [_imagePicker setFilterType:QBImagePickerControllerFilterTypePhotos];
    [_imagePicker setGroupTypes:@[
                                 @(ALAssetsGroupAll)
                                 ]];

    _userDataModel = [CJUserDataModel sharedInstance];
    _userImageModel = [_userDataModel userImageModel];
    _layout = [[LXReorderableCollectionViewFlowLayout alloc] init];
    
    _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height - 44) collectionViewLayout:_layout];
    [_collectionView setDataSource:self];
    [_collectionView setDelegate:self];
    [_collectionView registerClass:[CJPhotoViewCell class] forCellWithReuseIdentifier:@"photoCell"];
    [_collectionView setBackgroundColor:[UIColor whiteColor]];
    
    _myToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, self.view.frame.size.height - 44, self.view.frame.size.width, 44)];
    //[_myToolbar setBackgroundColor:[UIColor whiteColor]];
    [_myToolbar setBarTintColor:RGBLeonard];
    [_myToolbar setTintColor:[UIColor whiteColor]];
    
    NSMutableArray *toolBarItems = [[NSMutableArray alloc] init];
    [toolBarItems addObject:[[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(addMorePhotos)]];
    [toolBarItems addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil]];
    [toolBarItems addObject:[[UIBarButtonItem alloc] initWithTitle:@"Sort" style:UIBarButtonItemStylePlain target:self action:@selector(sortButtonTouched)]];
    [toolBarItems addObject:[[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil]];
    [toolBarItems addObject:[[UIBarButtonItem alloc] initWithTitle:@"Tools" style:UIBarButtonItemStylePlain target:self action:@selector(resizingButtonTouched)]];
    
    [_myToolbar setItems:toolBarItems animated:YES];
    [_myToolbar setTranslucent:NO];
    
    [self.view addSubview:_collectionView];
    [self.view addSubview:_myToolbar];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSLog(@"%lu", (unsigned long)[_userImageModel count]);
    return [_userImageModel count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CJPhotoViewCell *photoCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"photoCell"
                                                                           forIndexPath:indexPath];
    [photoCell.layer setBorderWidth:0];
    
    CJUserImageData *cellData = [_userImageModel objectAtIndex:indexPath.row];
    [photoCell.repImageView setImage:cellData.thumbnailPhoto];
    [photoCell setBackgroundColor:[UIColor whiteColor]];
    
    [photoCell.deleteButton addTarget:self action:@selector(deleteTouched:) forControlEvents:UIControlEventTouchUpInside];
    [photoCell.deleteButton setTag:indexPath.row];
    
    return photoCell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(106, 106);
}

#pragma mark -
#pragma mark LXReorderableCollectionViewFlowLayout

- (void) collectionView:(UICollectionView *)collectionView itemAtIndexPath:(NSIndexPath *)fromIndexPath willMoveToIndexPath:(NSIndexPath *)toIndexPath
{
    NSLog(@"%@", fromIndexPath);
    NSLog(@"%@", toIndexPath);
    CJUserImageData *object = [_userImageModel objectAtIndex:fromIndexPath.row];
    [_userImageModel removeObjectAtIndex:fromIndexPath.row];
    [_userImageModel insertObject:object atIndex:toIndexPath.row];
    
}

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout didEndDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
{
    [_collectionView reloadData];
}

- (void)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout willBeginDraggingItemAtIndexPath:(NSIndexPath *)indexPath;
{
    UICollectionViewCell *selectedCell = [_collectionView cellForItemAtIndexPath:indexPath];
    [selectedCell.layer setBorderColor:RGBLeonard.CGColor];
    [selectedCell.layer setBorderWidth:3.0];
}

#pragma mark -
#pragma mark Selectors

- (void)deleteTouched:(id)sender
{
    UIActionSheet *deleteAction = [[UIActionSheet alloc] initWithTitle:@"Delete this photo?"
                                                              delegate:self
                                                     cancelButtonTitle:@"Cancel"
                                                destructiveButtonTitle:@"Delete"
                                                     otherButtonTitles:nil];
    [deleteAction setTag:[sender tag]];
    [deleteAction showFromToolbar:_myToolbar];
}

- (void)addMorePhotos
{
    UINavigationController *imageNavigator = [[UINavigationController alloc] initWithRootViewController:_imagePicker];
    [self.navigationController presentViewController:imageNavigator animated:YES completion:nil];
}


#pragma mark -
#pragma mark ActionSheet
-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    NSString *title = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if ( [title isEqualToString:@"Delete"] )
    {
        NSUInteger fromIndexPathArr[] = {0, [actionSheet tag]};
        NSIndexPath *fromIndexPath = [NSIndexPath indexPathWithIndexes:fromIndexPathArr length:2];
        
        NSLog(@"%@", fromIndexPath);
        [_userImageModel removeObjectAtIndex:[actionSheet tag]];
        [_collectionView deleteItemsAtIndexPaths:@[fromIndexPath]];
        return;
    }
    
    else if ( [title isEqualToString:@"Cancel"] )
    {
        return;
    }

    
}

- (void)actionSheet:(UIActionSheet *)actionSheet didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    [_collectionView reloadData];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark-
#pragma mark ImagePicker
- (void)imagePickerControllerDidCancel:(QBImagePickerController *)picker
{
    [picker.selectedAssetURLs removeAllObjects];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(QBImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    [_userDataModel addPhotos:assets];
    [_collectionView reloadData];
    [_imagePicker.selectedAssetURLs removeAllObjects];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
