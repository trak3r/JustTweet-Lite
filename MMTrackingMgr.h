//
//  MMTrackingMgr.h
//  Medialets iPhone Ad Client
//  
//  Copyright 2008, 2009 Medialets, Inc.. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@class MMTrackedEventDatabase;

@interface MMTrackingMgr : NSObject <CLLocationManagerDelegate> {
	NSTimer					*broadcastTimer;
	NSTimeInterval			broadcastInterval;

	NSTimer					*connStatusTimer;
    NSTimeInterval			connStatusRefreshInterval;

	NSTimer					*_locationTimer;
	CLLocation				*_currentLocation;
    CLLocationManager		*_locationManager;
	id						_locationManagerDelegate;
    NSTimeInterval			locRefreshInterval;

	MMTrackedEventDatabase	*trackedEventDB;
	NSMutableDictionary		*eventKeyUserDict;
	
	BOOL					_tracking;
}

@property (nonatomic, retain) NSTimer					*locationTimer;
@property (nonatomic, retain) CLLocation				*currentLocation;
@property (nonatomic, retain) CLLocationManager			*locationManager;
@property (nonatomic, assign) id						locationManagerDelegate;
@property (nonatomic, assign) NSTimeInterval			locRefreshInterval;

@property (nonatomic, assign) NSTimeInterval			broadcastInterval;
@property (nonatomic, assign) NSTimeInterval			connStatusRefreshInterval;
@property (nonatomic, getter=isTracking, assign) BOOL	tracking;  // YES if tracking is enabled.


+ (NSString *)version;
+ (id)sharedInstance;

// Returns one of "NotConnected", "CDNConnected", "WiFiConnected" or "InvalidNetworkStatus"
// Note: "CDN" stands for Carrier Data Network - EDGE or 3G
- (NSString *)internetConnectionStatus;

- (void)trackEvent:(id)event;
- (void)trackEvent:(NSString *)eventKey withUserDict:(NSDictionary *)dict;

- (void)startDefaultTracking;
- (void)startDefaultTrackingWithoutLocation;
- (void)startDefaultTrackingWithLocationManager:(CLLocationManager *)locManager;
- (void)startDefaultTrackingWithAppID:(NSString *)anAppID appVersion:(NSString *)version locationTracking:(BOOL)locationAccessEnabled;

- (void)stopLocationTracking;
- (void)startLocationTracking;

- (void)observeNotifications:(NSArray *)names fromObject:(id)obj;
- (void)observeNotification:(NSString *)notificationName fromObject:(id)obj;

- (void)stopObservingNotifications:(NSArray *)names fromObject:(id)obj;
- (void)stopObservingNotification:(NSString *)notificationName fromObject:(id)obj;

@end


	// Create an informal protocol for the location manager delegate.
@interface NSObject (MMTrackingMgrProtocol)
- (BOOL)locationManagerShouldStopUpdatingLocation:(CLLocationManager *)cllMgr;
@end

