//
//  CJMainViewController.m
//  collageJam
//
//  Created by April Choi on 4/7/14.
//  Copyright (c) 2014 LEONARD. All rights reserved.
//

#import "CJMainViewController.h"

#ifdef DEBUG
#   define NSLog(...) NSLog(__VA_ARGS__)
#   define NSLogFrame(obj) NSLog(@"X:%f Y:%f W:%f H:%f", obj.origin.x, obj.origin.y, obj.size.width, obj.size.height)
#   define NSLogSize(obj) NSLog(@"Width:%f  Height:%f", obj.size.width, obj.size.height)
#   define NSLogString(obj) NSLog(@"%@", obj)
#   define NSLogObj(obj) NSLog(@"%@", obj)
#else
#   define NSLog(...)
#   define NSLogFrame(obj)
#   define NSLogSize(obj)
#   define NSLogString(obj)
#   define NSLogObj(obj)
#endif

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
    UIImage *helloLeonard = [UIImage imageNamed:@"helloLeonard.png"];
    UIImageView *helloLeonardView = [[UIImageView alloc] initWithImage:helloLeonard];
    [helloLeonardView setFrame:CGRectMake(98.5, (self.view.frame.size.height - helloLeonard.size.height) / 2, helloLeonard.size.width, helloLeonard.size.height)];
    
    UIBarButtonItem *settingButton = [[UIBarButtonItem alloc] initWithTitle:@"\u2699" style:UIBarButtonItemStylePlain target:self action:nil];
    UIFont *settingFont = [UIFont systemFontOfSize:28.0];
    NSDictionary *settingDict = [[NSDictionary alloc] initWithObjectsAndKeys:settingFont, NSFontAttributeName, nil];
    [settingButton setTitleTextAttributes:settingDict forState:UIControlStateNormal];
    [self.navigationItem setLeftBarButtonItem:settingButton];
    
    UIBarButtonItem *createButton = [[UIBarButtonItem alloc] initWithTitle:@"Create" style:UIBarButtonItemStylePlain target:self action:@selector(createButtonTapped)];
//    UIFont *settingFont = [UIFont systemFontOfSize:28.0];
//    NSDictionary *settingDict = [[NSDictionary alloc] initWithObjectsAndKeys:settingFont, NSFontAttributeName, nil];
//    [settingButton setTitleTextAttributes:settingDict forState:UIControlStateNormal];
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
    
}

@end
