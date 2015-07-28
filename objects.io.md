# Objects

Create new objects by **cloning** existing ones. The existing object is then called a **prototype**:

    Product := Object clone
    Product type                                                               // (1) Product
    Product proto type                                                         // (2) Object

`Object` is the root-level object. 

If we send a `clone` message to this object, the message invoces the clone method of the Object slot `clone`. 
This method returns a new object which we can assign to `Product`.

### Slots

Objects have a collection of **slots** (a slot is basically a hash). Each slot is referred to with a key. 
Use `:=` to assign a value (or an object) to a slot. Get the value from a slot by sending the slots name as a 
message to the object:

    Product description := "something you can buy"
    Product description                                                        // (3) something you can buy

Get a list of all slot names of `Product` by sending the `slotNames` method to the object:

    Product slotNames                                                          // (4) list(type, description)

Every object has a slot called `type`, which gives the kind of object you are dealing with.

Get a list of all slots which all objects have with:

    Object slotNames

### Inheritance

Supposed we want to model instances of programming books. The book "the Io language" is an instance of a Book object.

    Book := Product clone
    Book type                                                                  // (5) Book
    Book proto type                                                            // (6) Product
    Book proto proto type                                                      // (7) Object

    io_book := Book clone
    io_book type                                                               // (8) Book [not io_book]
    io_book description                                                        // (9) something you can buy

### Inheritance in Io

    //                                            +---------------+
    //                                            | Object        |
    //                                            +---------------+
    //                                            |  type         |            // Object
    //                                            +---------------+
    //                                                    ^
    //                               +---------------+    |
    //                               | Product       |    |
    //                               +---------------+    |
    //                               |  proto        |----+
    //                               |  type         |                         // Product
    //                               |  description  |                         // something you can buy
    //                               +---------------+
    //                                       ^
    //                  +---------------+    |
    //                  | Book          |    |
    //                  +---------------+    |
    //                  |  proto        |----+
    //                  |  type         |                                      // Book
    //                  +---------------+
    //                          ^
    //     +---------------+    |
    //     | io_book       |    |
    //     +---------------+    |
    //     |  proto        |----+
    //     +---------------+


