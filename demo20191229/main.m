//
//  main.m
//  demo20191229
//
//  Created by wangjingru on 2019/12/29.
//  Copyright © 2019 wangjingru. All rights reserved.
//

/*

// block
 
int arg1 = 10;
static int arg4 = 40;
#import <Foundation/Foundation.h>


@interface Person: NSObject{
    NSString* name;
    NSString* age;
}
@end
 

@implementation Person: NSObject
-(id) init{
    if(self = [super init]){
        NSLog(@"Person init");
    }
    return self;
}

-(void) dealloc{
    NSLog(@"Person dealloc");
    [super dealloc];
}

@end

void test(){
    
    //block是“带有自动变量的匿名函数”；
    typedef int(^Func)(int,int);
    
    Func add = ^(int a,int b){
        return a+b;
    };
    
    int (^sub)(int, int) = ^(int a, int b){
        return a-b;
    };
    int result = add(1,2);
    NSLog(@"add result is %d\n", result);
    result = sub(3,2);
    NSLog(@"sub result is %d\n", result);
    
    
    int __block dmy = 122;
    int val = 5;
    const char* fmt = "val = %d\n";
    void(^blk)(void) = ^{
        printf(fmt, val);
    };
    
    val = 2;
    fmt = "val value changed, now is %d";
    blk(); // Blocks中保存自动变量的瞬间值。
    
    printf("dmy now is %d\n", dmy);
    void(^blk1)(void) = ^{
        //val = 100; //若val为普通的自动变量，则不可以改写改值。
        dmy = 100; //若在自动变量附加__block说明符，就能是现在Block内赋值。
    };
    
    blk1();
    
    printf("dmy now is %d\n", dmy);
    
    //直接赋值给block中截获的自动变量，会产生编译错误。而调用更改该对象的方法不会产生编译错误。
    id array = [[NSMutableArray alloc] init];
    
    void(^blk2)(void) = ^{
        id obj = [[NSObject alloc] init];
        [array addObject: obj];
    };
    
    blk2();
    
    
    //在blocks中截获自动变量的方法并没有实现对C语言数组的截获
    //const char text[] = "hello";会出现编译错误
    const char *text = "hello";
    void(^blk3)(void) = ^{
        printf("%c\n", text[2]);
    };
    blk3();
    
    
    {
        //global
        void(^blockA)(void)=^{
            NSLog(@"just a blockA");
        };
        NSLog(@"%@",blockA);
        
        
        //malloc
        //arc下默认block创建在堆上,但可以通过__weak声明让其分配在栈上。
        //mrc下默认block创建在栈上
        int value = 10;
        void(^blockB)(void) = ^{
            NSLog(@"just a blockB == %d", value);
        };
        NSLog(@"%@",blockB);
        
        //stack
        //void(^ __weak blockC)(void)= ^{//
         //   NSLog(@"just a block == %d", value);
        //};
        //NSLog(@"%@",blockC);
    }
    
    {
        //block捕获变量
        //局部变量：捕获到block内部，值传递
        //静态局部变量： 捕获到block内部，指针传递
        //全部变量、静态全局变量：不捕获，直接访问
        @autoreleasepool{
            int arg2 = 20;
            static int arg3 = 30;
            void(^blockA)(void) = ^{
                NSLog(@"arg = %d", arg2);
            };
            
            NSLog(@"%@", blockA);
            arg2 *= 2;
            blockA();
            void(^blockB)(void) = ^{
                NSLog(@"arg = %d", arg3);
            };
            
            NSLog(@"%@", blockB);
            arg3 *= 2;
            blockB();
            
            void(^blockC)(void) = ^{
                NSLog(@"arg = %d", arg1);
            };
            NSLog(@"%@", blockC);
            arg1 *= 2;
            blockC();
            
            void(^blockD)(void) = ^{
                NSLog(@"arg = %d", arg4);
            };
            NSLog(@"%@", blockD);
            arg4 *= 2;
            blockD();
        }
    }
}

*/


//协议
#import <Foundation/Foundation.h>
#import "IOSProgrammer.h"

void test2(){
    IOSProgrammer* person = [[IOSProgrammer alloc] initWithName:@"wang" andAge:18 andGender: 'F'];
    
    [person setYear1 : 1];
    [person setYear2 : 2];
    [person setYear3 : 3];
    [person show];
    
    [person knowC];
    [person knowOC];
    [person IOSdeveloped];
    
}

//委托
#import "Boss.h"
#import "Assistant.h"

void test3(){
    @autoreleasepool{
        Boss* boss = [[Boss alloc] init];
        Assistant* ass = [[Assistant alloc] init];
        [boss setDelegate:ass];
        [boss travel];
    }
    
}

void test4(){
    
    //字符串
    NSString *str = @"hello";
    [str length];
    NSString *str1 = [NSString new];
    NSString* str2 = [[NSString alloc] initWithString: str];
    NSString *str3 = [NSString stringWithFormat: @" world %d", 2020];
    NSString * str4 = [NSString stringWithFormat: @"%@%@", str, str3];
    NSLog(@"%@", str4);
    
    //可变数组
    NSMutableArray *array = [NSMutableArray array];
    [array addObject: @"name"];
    [array addObject: @"age"];
    //四种遍历
    for(int i=0; i<2; i++){
        NSLog(@"%d ---> %@",i,[array objectAtIndex: i]);
    }
    
    int i = 0;
    for(id obj in array){
        NSLog(@"%d ---> %@", i,obj);
        i++;
    }
    
    [array enumerateObjectsUsingBlock: ^(id obj, NSUInteger idx, BOOL *stop){
        NSLog(@"%lu ---> %@", idx, obj);
    }];
    
    [array enumerateObjectsWithOptions: NSEnumerationReverse usingBlock: ^(id obj,  NSUInteger idx, BOOL* stop){
        NSLog(@"%lu ---> %@", idx, obj);
    }];
    [array removeObject: @"name"];
    
    NSInteger size = [array count];
    for(int i=0; i<size; i++){
        NSLog(@"%d ---> %@", i, [array objectAtIndex:i]);
    }
    [array removeAllObjects];
    NSLog(@"array count is %lu", [array count]);
    
    //字典
    NSDictionary *dic1 = @{@"hello":@"world"};
    NSDictionary* dic2 = [[NSDictionary alloc] initWithObjectsAndKeys:
                          @"hello",@"world",nil];
    NSUInteger size1 = [dic1 count];
    for(NSString *ret in [dic1 allKeys]){
        NSLog(@"%@", ret);
    }
    
    NSArray* arr = [dic2 allKeys];
    NSLog(@"%@", arr);
    NSString *value = [dic1 objectForKey: @"hello"];
    NSLog(@"%@", value);
    
}
#import "SelectorDemo.h"
#import "SelectorSub.h"
void test5(){
    @autoreleasepool{
        SelectorSub* ss = [[SelectorSub alloc] init];
        ss.methodTest = @selector(parentMethod);//获得方法编号
        [ss TestParentMethod];
        ss.methodTest = @selector(SubMethod);
        [ss TestParentMethod];
        NSString *methodName = NSStringFromSelector(ss.methodTest);//通过编号获方法
        NSLog(@"method name is %@", methodName);
        IMP methodPoint = [ss methodForSelector:ss.methodTest];//IMP的获得与使用
        methodPoint();
        BOOL flag = [ss respondsToSelector: ss.methodTest];
        NSLog(@"%hhd",flag);
        ss.methodTest = @selector(parent);
        flag = [ss respondsToSelector: ss.methodTest];
        NSLog(@"%hhd",flag);
    }
    
}



int main(int argv, const char* argc[]){
    test5();
    return 0;
}


