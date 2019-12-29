//
//  Person.h
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject
@property(strong) NSString* name;
@property int age;
@property char gender;
-(instancetype) initWithName: (NSString*) n andAge: (int)a andGender: (char)g;
-(void) show;
@end

NS_ASSUME_NONNULL_END
