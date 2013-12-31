//
//  MQSFormViewController.m
//  MyQS
//
//  Created by Adam Menz on 12/30/13.
//  Copyright (c) 2013 Orange Studios. All rights reserved.
//

#import "MQSFormViewController.h"

@interface MQSFormViewController ()

@end

@implementation MQSFormViewController

@synthesize webView, url;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    NSURLRequest *requestObj = [NSURLRequest requestWithURL:[NSURL URLWithString:url]];
    [webView loadRequest:requestObj];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
