# BookNote on Big Nerd Ranch 
---
## Sample iOS app
- How do i get my object created and configured properly
- How do I deal with user Interaction?
- XIB is xml representation of the archived objects, it will compiled into a NIB file, which is easier to parse.
	- _file'owner_: which controller has the access to the objects
	- _first responder_: ignore it for right now
	- _View_: an instance of UIView that represent the application interface
- bundle is directory containing executable and resources
- MVC, very similar to Qt's MVC.
	- Model typically NSArray, NSDictionary, NSSet.
	- Most application need more than one controller object
	- delegate object is the primary controller of the app
- IBOutlet and IBAction do? connect controller and view object in the XIB files.
- use file's owner to setup connections.
- don't blindly accept the suggestion
- interesting and powerful syntax.

## Play Ground of Object-C
Cocoa Touch library

- To create object send a alloc message to a class, the class create it and return you a pointer to that chunk of memory
   Type *instance = [[Type alloc] init]
- sending message _AWSOME_ if you want an object to run the code in its method, you send a message. and only one message is sent and result only one method being executed.
- class can have two method, addAttendee: and addAttendee:WithDish: are two distinct methods (function overload) 
  [instance selector:arg1 withSth:arg2... ]
- [venue sendConfirmation] don't need do nil-check, as if the venue is nil, this message is ignored.
- **@autoreleasepool**
- Formate String
   @ is obj-c only symbol, for hard-coded String
   %@ anyobject's description method
- Array can only hold references. This means primitives and C structures cannot added to a array. NSNull to hold the "hole" in the array
- extended keyword @interface @prefix.  accessor, or getters and setters. **setItemName, itemName**
- override description don't need header, as it already declare someplace else .
- Initializer, there could be the multi initXXX method, only one will be _designated initializer_, which all super class's designated initializer
   **(id)** is defined as "a pointer to any object" ~= void*
   why return (id) rather then Item*? the problem here is that when Item is subclassed, the subclass would inherit all the method, including this initializer and its return type. however, return instance as (id) is much more easy. The obj-c can't have two methods with same selector and different return types.
   isa, is a instance variable that pointer back to the class when alloc.more powerful than typeof (this is how instance be reflective), response msg on runtime; Compare it to Qt's signal& slot(preprocess, compiler-time)
   _I was sent this message, run the code for the matching method._ while in Qt the method to be executed is determined in qmake precompile.
- self, this
   [super init] super initial chain, similar to Javascript properties chaining 
- for instance method, + for class method
- exception: 








