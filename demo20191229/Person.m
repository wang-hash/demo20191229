//
//  Person.m
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "Person.h"

@implementation Person
-(instancetype) initWithName:(NSString*)n andAge:(int)a andGender:(char)g{
    if(self = [super init]){
        _name = n;
        _age = a;
        _gender = g;
    }
    return self;
}
-(void) show{
    NSLog(@"name is %@, age is %d, gender is %c", _name, _age, _gender);
}
@end
