//
//  EasyEaseAnimation.h
//
//  Created by Irimasu Densan Planning on 11/03/01.
//

#import <QuartzCore/CoreAnimation.h>

#import "Equations.h"

@interface EasyEaseAnimation : CAKeyframeAnimation
{

}

+ (id)animationWithKeyPath:(NSString *)keyPath
				startValue:(CGFloat)startValue
				  endValue:(CGFloat)endValue
					 block:(easeblock_t)easyease
					params:(NSDictionary*)params
		interstitialSteps:(NSUInteger)steps;

+ (id)animationWithKeyPath:(NSString *)keyPath
				startValue:(CGFloat)startValue
				  endValue:(CGFloat)endValue
					 block:(easeblock_t)easyease
					params:(NSDictionary*)params
		 interstitialSteps:(NSUInteger)steps
			beginSteps:(NSUInteger)beginSteps;

- (id)initWithKeyPath:(NSString *)keyPath
				startValue:(CGFloat)startValue
				  endValue:(CGFloat)endValue
					 block:(easeblock_t)easyease
					params:(NSDictionary*)params
         interstitialSteps:(NSUInteger)steps;

- (id) initWithKeyPath:(NSString *)keyPath
            startValue:(CGFloat)startValue
              endValue:(CGFloat)endValue
                 block:(easeblock_t)easyease
                params:(NSDictionary*)params
     interstitialSteps:(NSUInteger)steps
			beginSteps:(NSUInteger)beginSteps;

@end
