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
    UILabel *welcomeLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 100, 100, 200    )];
    [welcomeLabel setText:@"Jaeeun Test"];
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
