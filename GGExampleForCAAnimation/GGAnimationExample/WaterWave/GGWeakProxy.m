//
//  GGWeakProxy.m
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/20.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import "GGWeakProxy.h"

@implementation GGWeakProxy

+ (instancetype)proxyWithTarget:(id)target {
    return [[self alloc] initWithTarget:target];
}

- (instancetype)initWithTarget:(id)target {
    _target = target;
    return self;
}

- (void)forwardInvocation:(NSInvocation *)invocation{
    SEL sel = [invocation selector];
    if ([self.target respondsToSelector:sel]) {
        [invocation invokeWithTarget:self.target];
    }
}

- (NSMethodSignature *)methodSignatureForSelector:(SEL)aSelector{
    return [self.target methodSignatureForSelector:aSelector];
}

- (BOOL)respondsToSelector:(SEL)aSelector{
    return [self.target respondsToSelector:aSelector];
}

@end

