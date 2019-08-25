//
//  JDViewController.m
//  JDPopupAnimationView
//
//  Created by 13432414304@163.com on 08/25/2019.
//  Copyright (c) 2019 13432414304@163.com. All rights reserved.
//

#import "JDViewController.h"
#import "PopupRiseView.h"
@interface JDViewController ()

@end

@implementation JDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)clickButton:(id)sender {
    
    PopupRiseView *popupView = [[PopupRiseView alloc] initWithFrame:CGRectMake(30, 100, self.view.frame.size.width-60, 500)];
    [popupView show];
}

@end
