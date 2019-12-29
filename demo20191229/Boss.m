//
//  Boss.m
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

#import "Boss.h"

@implementation Boss
-(void) travel{
    [self bookHotel];
    [self bookPlane];
    [self takePlane];
    [self liveHotel];
}

-(void) bookHotel{
    [self.delegate bookHotel];
}
-(void) bookPlane{
     [self.delegate bookPlane];
}
-(void) takePlane{
    NSLog(@"boss take plane");
}
-(void) liveHotel{
    NSLog(@"boss live hotel");
}
@end
