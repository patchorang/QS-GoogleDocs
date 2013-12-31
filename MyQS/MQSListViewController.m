//
//  MQSListViewController.m
//  MyQS
//
//  Created by Adam Menz on 12/30/13.
//  Copyright (c) 2013 Orange Studios. All rights reserved.
//

#import "MQSListViewController.h"
#import "MQSFormViewController.h"

@interface MQSListViewController ()

@end

@implementation MQSListViewController

NSArray *formURLS;
NSArray *formNames;

NSMutableDictionary *formItems;

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
        formItems = [NSMutableDictionary dictionary];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)viewDidAppear:(BOOL)animated
{
    [self refreshData];
}

- (void)refreshData
{
    
    NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
    NSString *fileName = [NSString stringWithFormat:@"%@/forms.txt", documentsDirectory];
    NSString* content = [NSString stringWithContentsOfFile:fileName encoding:NSUTF8StringEncoding error:NULL];
    
    NSArray* lines = [content componentsSeparatedByCharactersInSet: [NSCharacterSet newlineCharacterSet]];
    
    for(int i = 0; i < lines.count; i++) {
        NSArray* line = [[lines objectAtIndex:i] componentsSeparatedByCharactersInSet:[NSCharacterSet characterSetWithCharactersInString:@" "]];
        if (line.count >= 2) {
            NSRange range = NSMakeRange(0, [line count] - 1);
            NSArray *nameArray = [line subarrayWithRange:range];
            [formItems setObject:[line objectAtIndex:1] forKey:[nameArray componentsJoinedByString:@" "]];
        }
    }
    
    [self.tableView reloadData];
    NSLog(@"%@", content);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [formItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }

    cell.textLabel.text = [[formItems allKeys] objectAtIndex:[indexPath row]];
    return cell;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([[segue identifier] isEqualToString:@"goToForm"]) {
        NSString *formKey = [[formItems allKeys] objectAtIndex:[[self.tableView indexPathForSelectedRow] row]];
        MQSFormViewController *formViewController = [segue destinationViewController];
        formViewController.url = [formItems objectForKey:formKey];
    }
}

@end
