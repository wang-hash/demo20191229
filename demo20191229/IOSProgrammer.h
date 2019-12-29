//
//  IOSProgrammer.h
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "IOSBasic.h"
NS_ASSUME_NONNULL_BEGIN

@interface IOSProgrammer : Person <IOSBasic>
@property int year1;
@property int year2;
@property int year3;
@end

NS_ASSUME_NONNULL_END
