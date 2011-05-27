//
//  Equations.m
//
//  Created by Irimasu Densan Planning on 11/03/01.
//

#import "Equations.h"
#include <math.h>

static Equations* equations_ = nil;

@implementation Equations

/*
#define kEasenone @"easenone"
#define kLinear @"linear"
#define kEaseinexpo @"easeinexpo"
#define kEaseoutexpo @"easeoutexpo"
#define kEaseinback @"easeinback"
#define kEaseoutback @"easeoutback"
*/

- (easeblock_t) easyeaseByKey:(NSString*) key
{
	easeblock_t nocopy_block = nil;
	
	if( [key compare:kEasenone] == NSOrderedSame || [key compare:kLinear] == NSOrderedSame ){
		nocopy_block = easenone_;
	}else if([key compare:kEaseinexpo] == NSOrderedSame ){
		nocopy_block = easeinexpo_;
	}else if([key compare:kEaseoutexpo] == NSOrderedSame ){
		nocopy_block = easeoutexpo_;
	}else if([key compare:kEaseinback] == NSOrderedSame ){
		nocopy_block = easeinback_;
	}else if([key compare:kEaseoutback] == NSOrderedSame ){
		nocopy_block = easeoutback_;
	}else if([key compare:kEaseinoutback] == NSOrderedSame ){
        nocopy_block = easeinoutback_;
    }
    
	return nocopy_block;
}

+ (Equations*) defaultEquations
{
	if( equations_ == nil ){
		equations_ = [[Equations alloc] init];
	}	
	return equations_;
}

- (id) init
{	
	if( (self = [super init]) != nil  ){
//		easenone_ = ^NSNumber* (NSNumber* t,NSNumber* b,NSNumber* c,NSNumber* d)
		easenone_ = ^CGFloat (CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params )
		{
			CGFloat value = c * t / d + b;
			return value;
		};

//		easeinquad_;
//		easeoutquad_;
//		easeinoutquad_;
//		easeoutinquad_;
//		easeincubic_;
//		easeoutcubic_;
//		easeinoutcubic_;
//		easeoutincubic_;
//		easeinquart_;
//		easeoutquart_;
//		easeinoutquart_;
//		easeoutinquart_;
//		easeinquint_;
//		easeoutquint_;
//		easeinoutquint_;
//		easeoutinquint_;
//		easeinsine_;
//		easeoutsine_;
//		easeinoutsine_;
//		easeoutinsine_;
//		easeincirc_;
//		easeoutcirc_;
//		easeinoutcirc_;
//		easeoutincirc_;
		
//		easeinexpo_ = ^NSNumber* (NSNumber* t,NSNumber* b,NSNumber* c,NSNumber* d)
		easeinexpo_ = ^CGFloat (CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params)
		{
			return (t==0) ? b : c * pow(2, 10 * (t/d - 1)) + b - c * 0.001;
		};
		
//		easeoutexpo_ = ^NSNumber* (NSNumber* t,NSNumber* b,NSNumber* c,NSNumber* d)
		easeoutexpo_ = ^CGFloat (CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params)
		{
			return (t==d) ? b+c : c * 1.001 * (-pow(2, -10 * t/d) + 1) + b;
		};
		
//		easeinoutexpo_;
//		easeoutinexpo_;
//		easeinelastic_;
//		easeoutelastic_;
//		easeinoutelastic_;
//		easeoutinelastic_;
//		easeinback_ = ^NSNumber* (NSNumber* t,NSNumber* b,NSNumber* c,NSNumber* d)
		easeinback_ = ^CGFloat (CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params)
		{
			NSNumber* overshot = [params objectForKey:@"overshoot"];
			CGFloat s = (overshot == nil ? 1.70158f : [overshot floatValue]);
			return c*(t/=d)*t*((s+1.0f)*t - s) + b;
		};
		
//		easeoutback_ = ^NSNumber* (NSNumber* t,NSNumber* b,NSNumber* c,NSNumber* d)
		easeoutback_ = ^CGFloat (CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params)
		{
			NSNumber* overshot = [params objectForKey:@"overshoot"];
            CGFloat s = (overshot == nil ? 1.70158f : [overshot floatValue]);
			return c*((t=t/d-1)*t*((s+1)*t + s) + 1) + b;
		};
		
        easeinoutback_  = ^CGFloat (CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params)
		{
			NSNumber* overshot = [params objectForKey:@"overshoot"];
            CGFloat s = (overshot == nil ? 1.70158f : [overshot floatValue]);
//			var s:Number = !Boolean(p_params) || isNaN(p_params.overshoot) ? 1.70158 : p_params.overshoot;
			if ((t/=d/2) < 1)
                return c/2*(t*t*(((s*=(1.525f))+1)*t - s)) + b;
			return c/2*((t-=2)*t*(((s*=(1.525f))+1)*t + s) + 2) + b;
		};
        
//		easeinoutback_;
//		easeoutinback_;
//		easeinbounce_;
//		easeoutbounce_;
//		easeinoutbounce_;
//		easeoutinbounce_;
	}
	return self;
}

- (void) dealloc
{
	[super dealloc];
}

@end
