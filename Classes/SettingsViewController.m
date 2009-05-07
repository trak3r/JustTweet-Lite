//
//  SettingsViewController.m
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright 2009 Anachromystic. All rights reserved.
//

#import "SettingsViewController.h"


@implementation SettingsViewController

@synthesize usernameTextField;
@synthesize passwordTextField;

- (void)switchToTweetView {
	[(JustTweetAppDelegate *)[[UIApplication sharedApplication] delegate] showTweetView];
}

- (void)storeUsernameAndPassword {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setValue:usernameTextField.text forKey:kTwitterUsername];
	[defaults setValue:passwordTextField.text forKey:kTwitterPassword];
}

- (BOOL)validated {
	return [(JustTweetAppDelegate *)[[UIApplication sharedApplication] delegate] hasValidAccountSettings];
}

- (void)showInvalidAccountAlert {
	UIAlertView *alert = [[UIAlertView alloc]
						  initWithTitle:@"Oops..." 
						  message:@"Please provide valid Twitter account credentials." 
						  delegate:self
						  cancelButtonTitle:@"OK"
						  otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (IBAction)saveButtonPressed:(id)sender {
	[self storeUsernameAndPassword];
	if([self validated]) {
		[self switchToTweetView];
	} else {
		[self showInvalidAccountAlert];
	}
}

/*
// The designated initializer. Override to perform setup that is required before the view is loaded.
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        // Custom initialization
    }
    return self;
}
*/

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView {
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
}
*/

/*
// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}
*/

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}


- (void)dealloc {
    [super dealloc];
}


@end
