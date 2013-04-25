# BookNote on Big Nerd Ranch 
---
## Sample iOS app
How do i get my object created and configured properly?
How do I deal with user Interaction?

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
Cocoa Touch library and message passing 

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

## ARC
Smart Pointer

- all obj-c object are in heap, same as Java, however, object never inside others.
- method and function create stacks. retired retain and release.
- pointer convey _ownership_ of the objects that they pointer to
- memory leak and premature deallocation. parent destroy chain.
- weak reference: a variable that not take the ownership of pointer object. break retain cycle to parent and child relationship.
- @property for declaration @synthesize for implementation, and declaration of the instance variable
- copy annotation

##delegation and core location
- Project, target, framework
- in the controller, the handler for message need to be exactly match, and xcoder won't give you a hint about what is the signature.
- delegate is oo approach to callbacks. callback is a function that is supplied in advance of an event and is called everything the event occurs. delegate is the single one that receive all the event message for a particular object.
- with target-action pair the message can be any message, in delegation, once the delegate is set, then you can send an object messages from protocol. the delegate will **implement** the method that correspond to the events it care about.
- protocol CLLocationManagerDelegate <NSObject>. protocol is not a class. and implementation is left to each class that conforms to the protocol
- optional protocol, before sending an optional message, the object first ask its delegate if it is okay to send that message by sending **respondsToSelector**. Every object has this method, which checks at runtime whether i have this given method. HOW? turn method selector into SEL updateMethod = @selector(Arg1:Arg2), then ask by respondsToSelector:updateMethod.
- compiler will insist that a class implement all the required method in the protocol(or crash), but which protocol? declared in the header in _< xxDelegate>_

## MapKit and TextInput

- how to zoom in the current location? "zoom-in-on-location"? good, but when do the controller send that message? I can't send it on initialization, nor I want to poll to force view to zoom-in. how about make the controller conforms to the MKView protocol. Now MkView can send controller when some interesting event happens. after I know the user location is updated? what message I should send to mapview? a region? but there is data type mismatch, np, we can have some function to do it.
- MKAnnotation, as long as those location information conform the MKAnnotation protocol, they can be shown on MKView
- create a pointer class that conforms the protocol, we don't have to declare the property exactly same as API reference, as it only dictate on method signature.
- tagging location, text editing and first responder. UIView is a subclass of UIResponse.first responder handle events that don't associate with a position on the screen. then UITextField become become the first responder, virtual keyboard show up(like active focus?). UITextView is like UITextfield.

##Subclassing UIView and UIScrollView
What exactly is a view?
a view know how to draw itself on the UIWindow, and exists within a hierarchy of views. the root of this hierarchy is the application window. a view handles events, like touches.
- each view maintains an **image** that represents it. even it is a text.
- every application has exactly one instance of UIWindow that servers as the container for all the views. Create each view's image and add each view to the hierarchy. how about create a view that draw something on your choice?
- in the XIB files, when dragged a view from the library onto the canvas, you created a view instance. 
- view's frame: each view has a frame rectangle. view is similar to QWidget
- drawRect: Method, UIView subclass override this method to perform custom drawing. the first thing to do is grab a pointer to drawing context. drawing context maintains the state of drawing and performs drawing operations. at the end of drawRect: the image produced by the context becomes that view's image.
- Core Graphic is a C API for 2D drawing, the hub of CG is CGContextRef: context creates an image.
- 1. Path: a collection of points form shapes; 2 drawing operations: stroke, fillpath, clip 3: after drawing operation the path is removed from the context. 

- Redrawing View: the run loop's job is to listen for input (touch, update, network data coming), and then find the appropriate handlers for that event(action | delegate method for an object). once all the methods completed, control return to the run loop, and at that point the views are redrawn. when control returns to the run loop "well, a bunch of code was just executed, i and going to check if any views need to be redrawn" then prepare the drawing context and sends the message drawRect: to all the views that have been sent setNeeedsDisplay in the last iteration of loop. other views don't need to redraw themselves.
- **Motion Events** most views only care about events connected with themselves, so the responder object need to stand out and state that it willing to become the first responder.
- UIScrollView and contentSize.  Panning: swap and only show one view from the list, zooming, the scrollview needs to know the minimum and maximum zooom levels, and it needs to know the view to zoom in on.
- TODO review ZOMMING and Delegate
- Hide status bar, sharedApplication and info.plist 

