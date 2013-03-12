Play Groud of Object-C
1. Create object
   Type *instance = [[Type alloc] init]
2. sending message (AWSOME)
   [instance selector::arg1 withSth:arg2... ]
3. Formate String
   @ is obj-c only symbol, for hard-coded String
   %@ anyobject's descrption
4. Array can only hold references.
5. Initializer
   id, void*
   isa, more powerful than typeof (this is how instance be refective), response msg on runtime; Compare it to Qt's signal& slot(preprocess, compiler-time)
   self, this
   super initial chain, similiar to Javascript properties chaining
6. designated initilizer
