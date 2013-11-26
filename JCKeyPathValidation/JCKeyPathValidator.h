//
//  RGObjectKeyPath.h
//  Ragoo
//
//  Created by Jon Crooke on 27/02/2013.
//  Copyright (c) 2013 jc. All rights reserved.
//

#import <Foundation/Foundation.h>

// https://gist.github.com/jspahrsummers/1670404

#define RGObjectKeyPath(anObject, aKeyPath) \
((void)(NO && ((void)anObject.aKeyPath, NO)), @ # aKeyPath )

#define RGObjectClassKeyPath(aClass, aKeyPath) \
((void)(NO && ((void)[[JCKeyPathValidator cachedInstanceForClass:[aClass class]] aKeyPath], NO)), @ # aKeyPath )

@interface JCKeyPathValidator : NSObject
+ (id)cachedInstanceForClass:(Class) k;
@end

