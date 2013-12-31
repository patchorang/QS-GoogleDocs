//
//  MQSAddFormViewController.m
//  MyQS
//
//  Created by Adam Menz on 12/31/13.
//  Copyright (c) 2013 Orange Studios. All rights reserved.
//

#import "MQSAddFormViewController.h"

@interface MQSAddFormViewController ()

@end

@implementation MQSAddFormViewController

@synthesize name, formURL;

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
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)submit:(id)sender {
    NSString *content = [NSString stringWithFormat:@"\n%@ %@", name.text, formURL.text];
    
    //get the documents directory:
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName = [NSString stringWithFormat:@"%@/forms.txt", documentsDirectory];
    
    NSFileHandle *fileHandle = [NSFileHandle fileHandleForWritingAtPath:fileName];
    if (fileHandle){
        [fileHandle seekToEndOfFile];
        [fileHandle writeData:[content dataUsingEncoding:NSUTF8StringEncoding]];
        [fileHandle closeFile];
    }
    else{
        [content writeToFile:fileName
                  atomically:NO
                    encoding:NSStringEncodingConversionAllowLossy
                       error:nil];
    }
    [self.navigationController popViewControllerAnimated:YES];
}

@end
