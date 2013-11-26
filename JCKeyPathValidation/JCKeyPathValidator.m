//
//  JCValidateKeyPath.m
//
//  Created by Jon Crooke on 27/02/2013.
//  Copyright (c) 2013 jc. All rights reserved.
//

#import "JCKeyPathValidator.h"

@implementation JCKeyPathValidator

+ (id)cachedInstanceForClass:(Class) klass
{
  static NSCache *cache = nil;
  static dispatch_once_t onceToken;
  dispatch_once(&onceToken, ^{
    cache = [[NSCache alloc] init];
  });
  
  NSString *key = NSStringFromClass(klass);
  id ret = [cache objectForKey:key];
  if (!ret) {
    ret = [[klass alloc] init];
    [cache setObject:ret forKey:key];
  }
  return ret;
}

@end
