//
//  MQSFormViewController.h
//  MyQS
//
//  Created by Adam Menz on 12/30/13.
//  Copyright (c) 2013 Orange Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MQSFormViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (strong, nonatomic) NSString *url;

@end
