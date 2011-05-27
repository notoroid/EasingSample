//
//  Equations.h
//
//  Created by Irimasu Densan Planning on 11/03/01.
//

#import <Foundation/Foundation.h>
#include <Block.h>

// typedef NSNumber* (^easeblock_t)(NSNumber*t,NSNumber* b,NSNumber* c,NSNumber* d);
typedef CGFloat (^easeblock_t)(CGFloat t,CGFloat b,CGFloat c,CGFloat d,NSDictionary* params);

#define kEasenone @"easenone"
#define kLinear @"linear"
// #define kEaseinquad @"easeinquad"
// #define kEaseoutquad @"easeoutquad"
// #define kEaseinoutquad @"easeinoutquad"
// #define kEaseoutinquad @"easeoutinquad"
// #define kEaseincubic @"easeincubic"
// #define kEaseoutcubic @"easeoutcubic"
// #define kEaseinoutcubic @"easeinoutcubic"
// #define kEaseoutincubic @"easeoutincubic"
// #define kEaseinquart @"easeinquart"
// #define kEaseoutquart @"easeoutquart"
// #define kEaseinoutquart @"easeinoutquart"
// #define kEaseoutinquart @"easeoutinquart"
// #define kEaseinquint @"easeinquint"
// #define kEaseoutquint @"easeoutquint"
// #define kEaseinoutquint @"easeinoutquint"
// #define kEaseoutinquint @"easeoutinquint"
// #define kEaseinsine @"easeinsine"
// #define kEaseoutsine @"easeoutsine"
// #define kEaseinoutsine @"easeinoutsine"
// #define kEaseoutinsine @"easeoutinsine"
// #define kEaseincirc @"easeincirc"
// #define kEaseoutcirc @"easeoutcirc"
// #define kEaseinoutcirc @"easeinoutcirc"
// #define kEaseoutincirc @"easeoutincirc"
#define kEaseinexpo @"easeinexpo"
#define kEaseoutexpo @"easeoutexpo"
// #define kEaseinoutexpo @"easeinoutexpo"
// #define kEaseoutinexpo @"easeoutinexpo"
// #define kEaseinelastic @"easeinelastic"
// #define kEaseoutelastic @"easeoutelastic"
// #define kEaseinoutelastic @"easeinoutelastic"
// #define kEaseoutinelastic @"easeoutinelastic"
#define kEaseinback @"easeinback"
#define kEaseoutback @"easeoutback"

#define kEaseinoutback @"easeinoutback"

// #define kEaseoutinback @"easeoutinback"
// #define kEaseinbounce @"easeinbounce"
// #define kEaseoutbounce @"easeoutbounce"
// #define kEaseinoutbounce @"easeinoutbounce"
// #define kEaseoutinbounce @"easeoutinbounce"

@interface Equations : NSObject
{
	easeblock_t easenone_;
	easeblock_t linear_;
//	easeblock_t easeinquad_;
//	easeblock_t easeoutquad_;
//	easeblock_t easeinoutquad_;
//	easeblock_t easeoutinquad_;
//	easeblock_t easeincubic_;
//	easeblock_t easeoutcubic_;
//	easeblock_t easeinoutcubic_;
//	easeblock_t easeoutincubic_;
//	easeblock_t easeinquart_;
//	easeblock_t easeoutquart_;
//	easeblock_t easeinoutquart_;
//	easeblock_t easeoutinquart_;
//	easeblock_t easeinquint_;
//	easeblock_t easeoutquint_;
//	easeblock_t easeinoutquint_;
//	easeblock_t easeoutinquint_;
//	easeblock_t easeinsine_;
//	easeblock_t easeoutsine_;
//	easeblock_t easeinoutsine_;
//	easeblock_t easeoutinsine_;
//	easeblock_t easeincirc_;
//	easeblock_t easeoutcirc_;
//	easeblock_t easeinoutcirc_;
//	easeblock_t easeoutincirc_;
	easeblock_t easeinexpo_;
	easeblock_t easeoutexpo_;
//	easeblock_t easeinoutexpo_;
//	easeblock_t easeoutinexpo_;
//	easeblock_t easeinelastic_;
//	easeblock_t easeoutelastic_;
//	easeblock_t easeinoutelastic_;
//	easeblock_t easeoutinelastic_;
	easeblock_t easeinback_;
	easeblock_t easeoutback_;
	easeblock_t easeinoutback_;
//	easeblock_t easeoutinback_;
//	easeblock_t easeinbounce_;
//	easeblock_t easeoutbounce_;
//	easeblock_t easeinoutbounce_;
//	easeblock_t easeoutinbounce_;
}

- (id) init;
+ (Equations*) defaultEquations;
- (easeblock_t) easyeaseByKey:(NSString*) key;

@end
