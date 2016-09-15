//
//  ViewController.m
//  Test通知
//
//  Created by Bolu on 15/12/29.
//  Copyright © 2015年 Bolu. All rights reserved.
//

#import "ViewController.h"
#import "Test.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSLog(@"viewDidLoad::self-retainCount--%lu",(unsigned long)[self retainCount]);
    
    Test *test = [[Test alloc] init];
    [test release];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"11111" object:nil];
    
    id myObj = NSClassFromString(@"test");
    if (myObj) {
        NSLog(@"test");
    }
}



- (void)dealloc
{
    [super dealloc];

    NSLog(@"ViewController dealloc");
}

@end
