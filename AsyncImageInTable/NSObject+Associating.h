//
//  NSObject+Associating.h
//  AsyncImageInTable
//
//  Created by qingjie on 12/15/15.
//  Copyright © 2015 Retrieve LLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

@interface NSObject (Associating)
@property (nonatomic, retain) id associatedObject;
@end
