//
//  JustTweet_LiteAppDelegate.m
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright Anachromystic 2009. All rights reserved.
//

#import "JustTweetAppDelegate.h"
#import "TweetViewController.h"
#import "SettingsViewController.h"
#import "MMTrackingMgr.h"

@implementation JustTweetAppDelegate

@synthesize window;
@synthesize tweetViewController;
@synthesize settingsViewController;

+ (void)initialize {
	//[[MMTrackingMgr sharedInstance] startDefaultTrackingWithoutLocation];
	[[MMTrackingMgr sharedInstance] startDefaultTracking];
}

- (BOOL)isNullOrEmpty:(NSString *)key {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	return ((NULL == [defaults objectForKey:key]) 
			|| ([[defaults objectForKey:key] length] == 0));
}

- (BOOL)hasValidUsername {
	return ![self isNullOrEmpty:kTwitterUsername];
}

- (BOOL)hasValidPassword {
	return ![self isNullOrEmpty:kTwitterPassword];
}

- (BOOL)hasValidAccountSettings {
	return([self hasValidUsername] && [self hasValidPassword]);
}

- (void)showSettingsView {
    [window addSubview:settingsViewController.view];
}

- (void)showTweetView {
	[settingsViewController.view removeFromSuperview];
	[settingsViewController release]; // we won't need it again
    [window addSubview:tweetViewController.view];
}

- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
	if([self hasValidAccountSettings]){
		[self showTweetView];
	} else {
		[self showSettingsView];
	}
    [window makeKeyAndVisible];
}

- (void)applicationWillTerminate:(UIApplication *)application {
	[tweetViewController storeTweet];
}

- (void)dealloc {
    [tweetViewController release];
    [window release];
    [super dealloc];
}


@end
