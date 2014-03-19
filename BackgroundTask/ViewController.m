//
//  ViewController.m
//  BackgroundTask
//
//  Created by Vishnu on 02/04/13.
//  Copyright (c) 2013 Vishnu. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //background task code
    UIApplication *app = [UIApplication sharedApplication];
    
    bgTask = [app beginBackgroundTaskWithExpirationHandler:^{ [app endBackgroundTask:bgTask];
        bgTask = UIBackgroundTaskInvalid;
    }];

    [NSTimer scheduledTimerWithTimeInterval:5 target:self selector:@selector(doSomeFunction) userInfo:nil repeats:YES];
}

-(void)doSomeFunction{
    
    NSLog(@"will log even if in background or foreground");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
