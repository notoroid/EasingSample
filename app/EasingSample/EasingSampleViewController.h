//
//  EasingSampleViewController.h
//  EasingSample
//
//  Created by Irimasu Densan Planning on 11/05/27.
//  Copyright 2011 いります電算企画. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../EasyeaseTouch/Equations.h"
#import "../EasyeaseTouch/EasyEaseAnimation.h"

@interface EasingSampleViewController : UIViewController<UIPickerViewDataSource,UIPickerViewDataSource> {
    CALayer* packageLayer_;
    CALayer* package2Layer_;
}

@property(nonatomic,retain) IBOutlet UIView* placeHolderView;
@property(nonatomic,retain) IBOutlet UIView* placeHolder2View;
@property(nonatomic,retain) IBOutlet UISegmentedControl* easingSegment;
@property(nonatomic,retain) IBOutlet UIDatePicker* customEasingDataPickerView;
@property(nonatomic,retain) IBOutlet UISwitch* opacitySwitch;
@property(nonatomic,retain) NSArray* easingNames;
@property(nonatomic,retain) NSString* currentCustomEasing;
@property(nonatomic,assign) NSString* currentEasing;

- (IBAction) firedEasing:(id)sender;
- (IBAction) firedStart:(id)sender;
- (IBAction) firedOpacity:(id)sender;
- (IBAction) firedEagigLayerHidden:(id)sender;
- (IBAction) firedCustomEasingLayerHidden:(id)sender;

@end
