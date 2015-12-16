//
//  NSObject+Associating.m
//  AsyncImageInTable
//
//  Created by qingjie on 12/15/15.
//  Copyright © 2015 Retrieve LLC. All rights reserved.
//

#import "NSObject+Associating.h"

@implementation NSObject (Associating)

- (id)associatedObject
{
    return objc_getAssociatedObject(self, @selector(associatedObject));
}

- (void)setAssociatedObject:(id)associatedObject
{
    objc_setAssociatedObject(self,
                             @selector(associatedObject),
                             associatedObject,
                             OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

@end
