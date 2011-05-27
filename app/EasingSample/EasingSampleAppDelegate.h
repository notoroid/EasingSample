//
//  EasingSampleAppDelegate.h
//  EasingSample
//
//  Created by Irimasu Densan Planning on 11/05/27.
//  Copyright 2011 いります電算企画. All rights reserved.
//

#import <UIKit/UIKit.h>

@class EasingSampleViewController;

@interface EasingSampleAppDelegate : NSObject <UIApplicationDelegate> {

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet EasingSampleViewController *viewController;

@end
