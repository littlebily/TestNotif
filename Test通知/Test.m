//
//  Test.m
//  Test通知
//
//  Created by Bolu on 15/12/31.
//  Copyright © 2015年 Bolu. All rights reserved.
//

#import "Test.h"
#import "bb.h"
#import "aa.h"
#import <objc/runtime.h>

@implementation Test

- (instancetype)init
{
    [super init];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(testNotiMethod) name:@"11111" object:nil];
    
    if (NSClassFromString(@"aa")) {
        NSLog(@"test");
    }
    
    id objet = NSClassFromString(@"bb");
    if ([objet respondsToSelector:@selector(bbtt:)]) {
        NSLog(@"test");
    }
    if (NSClassFromString(@"aa"))
    {
//        NSArray *dd = [self classPropertiesArray:[aa class]];

    }
    
    bb *b = [[NSClassFromString(@"bb") alloc] init];
//    [bb bbtt:nil];
    [b bbtest:nil];
    return self;
}

- (NSArray *)classPropertiesArray:(Class )className
{
    u_int            count;
    objc_property_t *properties     = class_copyPropertyList(className, &count);
    NSMutableArray *propertiesArray = [NSMutableArray arrayWithCapacity:count];
    
    for (int i = 0; i < count; i++)
    {
        const char *propertyName = property_getName(properties[i]);
        [propertiesArray addObject: [NSString stringWithUTF8String: propertyName]];
    }
    
    free(properties);
    return propertiesArray;
}

- (void)testNotiMethod
{
    NSLog(@"Test testNotiMethod");
    NSLog(@"Test testNotiMethod::self-retainCount--%lu",(unsigned long)[self retainCount]);
}

- (void)dealloc
{
    [super dealloc];
    
    NSLog(@"Test dealloc");
}

@end
