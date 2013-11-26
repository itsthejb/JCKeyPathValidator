JCKeyPathValidator
==================

*Stop using constant NSStrings to represent your keypaths: use compiler symbols instead.*

##Intro

Super simple extension to Justin Spahr-Summers' [object key path validation macro](https://gist.github.com/jspahrsummers/1670404) that adds a macro for validating key paths without requiring an instance of the class.

Particularly useful for removing constant `NSStrings` from your API mappings.

##Usage

* `JCValidateKeyPath(anObject, aKeyPath)`
	* The original macro. Validates the specified key path as a compiler symbol and returns an equivalent `NSString` representation.
* `JCValidateKeyPathWithClass(aClass, aKeyPath)`
	* As an extension of the above, does not require an object instance, and can use a `Class` directly.
	
##Technical considerations

`JCValidateKeyPathWithClass` maintains an `NSCache` of instances for the classes queried. This could certainly causes issues with high memory footprint classes, even when using the default initialiser. Furthermore, it is incompatible with classes that do not support permit a plain `[[class alloc] init]`, by throwing exceptions or so forth.

Have fun!
---------

[MIT Licensed](http://jc.mit-license.org/) >> [jon.crooke@gmail.com](mailto:jon.crooke@gmail.com)