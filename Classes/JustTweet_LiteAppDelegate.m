//
//  JustTweet_LiteAppDelegate.m
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright Anachromystic 2009. All rights reserved.
//

#import "JustTweet_LiteAppDelegate.h"

@implementation JustTweet_LiteAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
