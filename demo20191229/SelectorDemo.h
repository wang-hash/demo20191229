//
//  SelectorDemo.h
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SelectorDemo : NSObject{
    SEL _methodTest;
}

@property(nonatomic, assign) SEL methodTest;
-(void) TestParentMethod;
-(void) TestSubMethod;

@end

NS_ASSUME_NONNULL_END
