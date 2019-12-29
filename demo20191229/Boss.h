//
//  Boss.h
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PAssistant.h"

NS_ASSUME_NONNULL_BEGIN

@interface Boss : NSObject
@property id<PAssistant> delegate;
-(void) travel;
-(void) bookPlane;
-(void) bookHotel;
-(void) takePlane;
-(void) liveHotel;
@end

NS_ASSUME_NONNULL_END
