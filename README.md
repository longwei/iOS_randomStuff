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

1. To create object send a alloc message to a class, the class create it and return you a pointer to that chunk of memory
   Type *instance = [[Type alloc] init]
2. sending message _AWSOME_ if you want an object to run the code in its method, you send a message. and only one message is sent and result only one method being executed.
3. class can have two method, addAttendee: and addAttendee:WithDish: are two distinct methods (function overload) 
  [instance selector:arg1 withSth:arg2... ]
4. [venue sendConfirmation] don't need do nil-check, as if the venue is nil, this message is ignored.
5. **@autoreleasepool**
3. Formate String
   @ is obj-c only symbol, for hard-coded String
   %@ anyobject's description
4. Array can only hold references.
5. Initializer
   id, void*
   isa, more powerful than typeof (this is how instance be refective), response msg on runtime; Compare it to Qt's signal& slot(preprocess, compiler-time)
   self, this
   super initial chain, similar to Javascript properties chaining
6. designated initilizer








