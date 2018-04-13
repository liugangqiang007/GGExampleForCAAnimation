//
//  GGWeakProxy.h
//  GGExampleForCAAnimation
//
//  Created by LGQ on 2018/3/20.
//  Copyright © 2018年 LGQ. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GGWeakProxy : NSProxy

@property (nonatomic, weak, readonly) id target;

+ (instancetype)proxyWithTarget:(id)target;
- (instancetype)initWithTarget:(id)target;

@end
