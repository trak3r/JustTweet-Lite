//
//  TweetViewController.m
//  JustTweet Lite
//
//  Created by Ted on 5/6/09.
//  Copyright 2009 Anachromystic. All rights reserved.
//

#import "TweetViewController.h"

@implementation TweetViewController

@synthesize countDown;
@synthesize tweetText;
@synthesize activityView;

- (void)storeTweet {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setValue:[tweetText text] forKey:kLastTweet];
}

- (void)showLastTweet {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[tweetText setText:[defaults objectForKey:kLastTweet]];
}

- (void)clearStoredTweet {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	[defaults setValue:@"" forKey:kLastTweet];
}

- (void)clearScreen {
	[tweetText setText:@""];
}

- (void)textViewDidChange:(UITextView *)textView {
	[countDown setTitle:[NSString stringWithFormat:@"%i",(140-[[tweetText text] length])]];
}

- (IBAction)clearButtonPressed:(id)sender {
	[self clearStoredTweet];
	[self clearScreen];
}

- (BOOL)sendTweet {
	NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
	NSURL *url = [NSURL URLWithString:[NSString 
									   stringWithFormat:@"http://%@:%@@twitter.com/statuses/update.json", 
									   [defaults objectForKey:kTwitterUsername],
									   [defaults objectForKey:kTwitterPassword]]];
	NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
	[request setHTTPMethod:@"POST"];
	[request setValue:@"JustTweet iPhone Client" forHTTPHeaderField:@"X-Twitter-Client"];
	[request setValue:@"0.0.2" forHTTPHeaderField:@"X-Twitter-Client-Version"];
	[request setValue:@"http://anachromystic.com" forHTTPHeaderField:@"X-Twitter-Client-URL"];
	// TODO: Add Twitter client source ID to parameters once one is acquired.
	[request setHTTPBody:[[NSString stringWithFormat:@"status=%@", [tweetText text]] 
						  dataUsingEncoding: NSUTF8StringEncoding]];
	NSHTTPURLResponse *httpResponse;
	NSError *error;
	[NSURLConnection sendSynchronousRequest:request 
						  returningResponse:&httpResponse
									  error:&error];
	if(NULL==error){		
		int statusCode = [httpResponse statusCode];
		if(200 == statusCode){
			return TRUE;
		} else {
			UIAlertView *alert = [[UIAlertView alloc]
								  initWithTitle:@"Unable to Tweet" 
								  message:[NSString stringWithFormat:@"Twitter returned the following message:\n\"%@\"%@", 
										   [NSHTTPURLResponse localizedStringForStatusCode:statusCode], 
										   @"\nPlease try again later.\nYou can change your user name and password from the Settings application if necessary."]
								  delegate:self
								  cancelButtonTitle:@"OK"
								  otherButtonTitles:nil];
			[alert show];
			[alert release];
		}
	} else {
		NSString *msg;
		if(-1012==error.code){
			msg = @"Invalid username or password.  Please review and correct your credentials from the Settings application and try again.\nThank you.";
		}else{
			msg = [NSString stringWithFormat:@"Received error:\n\"%@\"%@", 
				   [error localizedDescription],
				   @"\nPlease verify your connection to the Internet."];
		}
		UIAlertView *alert = [[UIAlertView alloc]
							  initWithTitle:@"Unable to Tweet" 
							  message:msg
							  delegate:self
							  cancelButtonTitle:@"OK"
							  otherButtonTitles:nil];
		[alert show];
//		[alert release];
//		[msg release]; // necessary?
	}
	return FALSE;
}

- (void)startSpinner {
	[activityView startAnimating];
	[tweetText setEditable:NO];
}

- (void)stopSpinner {
	[tweetText setEditable:YES];
	[activityView stopAnimating];
}

- (void)myTimerFireMethod:(NSTimer*)theTimer {
	[self storeTweet];
	if([self sendTweet]){
		[self clearStoredTweet];
		[self clearScreen];
	}
	[self stopSpinner];
}

- (IBAction)tweetButtonPressed:(id)sender {
	[self startSpinner];
	[NSTimer scheduledTimerWithTimeInterval:0.1 
					 				 target:self 
								   selector:@selector(myTimerFireMethod:)
								   userInfo:nil
								    repeats:NO];	
	/*
	 [self myTimerFireMethod:nil];
	 */
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

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad {
    [super viewDidLoad];
	[tweetText becomeFirstResponder];
	[self showLastTweet];
}

// Override to allow orientations other than the default portrait orientation.
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait 
			|| interfaceOrientation == UIInterfaceOrientationLandscapeLeft 
			|| interfaceOrientation == UIInterfaceOrientationLandscapeRight);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning]; // Releases the view if it doesn't have a superview
    // Release anything that's not essential, such as cached data
}

- (void)dealloc {
	[countDown dealloc];
	[tweetText dealloc];
    [super dealloc];
}

@end
