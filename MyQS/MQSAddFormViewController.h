//
//  MQSAddFormViewController.h
//  MyQS
//
//  Created by Adam Menz on 12/31/13.
//  Copyright (c) 2013 Orange Studios. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MQSAddFormViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *name;
@property (weak, nonatomic) IBOutlet UITextField *formURL;
- (IBAction)submit:(id)sender;

@end
