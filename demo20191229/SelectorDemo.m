//
//  SelectorDemo.m
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "SelectorDemo.h"

@implementation SelectorDemo

@synthesize methodTest = _methodTest;

-(void) parentMethod{
    NSLog(@"parent method Call Success!!");
}

-(void) TestParentMethod{
    if(_methodTest){
        [self performSelector:_methodTest withObject:nil];
        //编号获取后执行对应方法
    }
}

-(void) TestSubMethod{
    if(_methodTest){
        [self performSelector:_methodTest withObject:nil];
    }
}

-(void) dealloc{
    NSLog(@"SelectorDemo dealloc");
}

@end
