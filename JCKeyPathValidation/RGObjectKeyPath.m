//
//  RGObjectKeyPath.m
//  Ragoo
//
//  Created by Jon Crooke on 27/02/2013.
//  Copyright (c) 2013 jc. All rights reserved.
//

#import "RGObjectKeyPath.h"

@interface RGObjectKeyPathCache ()
@property (strong) NSSet *cache;
@end

@implementation RGObjectKeyPathCache

+ (RGObjectKeyPathCache*)objectCache
{
  static RGObjectKeyPathCache *cache = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    cache = [[RGObjectKeyPathCache alloc] init];
  });
  return cache;
}

- (id)cachedInstanceForClass:(Class)k {
  NSString *key = NSStringFromClass(k);
  id ret = [self.cache member:key];
  if (!ret) {
    ret = [[k alloc] init];
    self.cache = [[NSSet setWithObject:ret] setByAddingObjectsFromSet:self.cache];
  }
  return ret;
}

@end
