//
//  CJMainViewController.m
//  collageJam
//
//  Created by April Choi on 4/7/14.
//  Copyright (c) 2014 LEONARD. All rights reserved.
//

#import "CJMainViewController.h"

@interface CJMainViewController ()

@end

@implementation CJMainViewController

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
    [self setTitle:@"News Feed"];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    UIImage *helloLeonard = [UIImage imageNamed:@"helloLeonard.png"];
    UIImageView *helloLeonardView = [[UIImageView alloc] initWithImage:helloLeonard];
    [helloLeonardView setFrame:CGRectMake(98.5, (self.view.frame.size.height - helloLeonard.size.height) / 2, helloLeonard.size.width, helloLeonard.size.height)];
    
    UIBarButtonItem *settingButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699" style:UIBarButtonItemStylePlain target:self action:nil];
    UIFont *settingFont = [UIFont systemFontOfSize:28.0];
    NSDictionary *settingDict = [[NSDictionary alloc] initWithObjectsAndKeys:settingFont, NSFontAttributeName, nil];
    [settingButton setTitleTextAttributes:settingDict forState:UIControlStateNormal];
    [self.navigationItem setLeftBarButtonItem:settingButton];
    
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStylePlain target:self action:@selector(createButtonTapped)];
    [self.navigationItem setRightBarButtonItem:createButton];
    
    
    
    [self.view addSubview:helloLeonardView];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void) createButtonTapped
{
    QBImagePickerController *imagePicker = [[QBImagePickerController alloc] init];
    [imagePicker setDelegate:self];
    [imagePicker setAllowsMultipleSelection:YES];
    [imagePicker setFilterType:QBImagePickerControllerFilterTypePhotos];
    [imagePicker setGroupTypes:@[
                                 @(ALAssetsGroupAll)
                                 ]];
    
    // Since QBImagePicker is not subclass of NavigationController,
    // it is required to use another NavigationController initalized with QBImagePicker
    // to push into the self.navigationController.
    UINavigationController *imageNavigator = [[UINavigationController alloc] initWithRootViewController:imagePicker];
    [self presentViewController:imageNavigator animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(QBImagePickerController *)picker
{
    [picker.selectedAssetURLs removeAllObjects];
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(QBImagePickerController *)imagePickerController didSelectAssets:(NSArray *)assets
{
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    CJUserDataModel *userDataModel = [CJUserDataModel sharedInstance];
    [userDataModel addPhotos:assets];
    
    UIViewController *managingPhotoViewController = [[CJManagingPhotoViewController alloc] init];
    [self.navigationController pushViewController:managingPhotoViewController animated:YES];
}

@end
