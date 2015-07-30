# Objects

Create new objects by **cloning** existing ones. The existing object is then called a **prototype**:

    Product := Object clone
    Product type                                                     // (1) Product
    Product proto type                                               // (2) Object

If we send a `clone` message to `Object`, it returns a new object which we assign to a new object `Product`.
When an object is cloned, its `init` slot will be called if it has one.

### Slots

Objects have a collection of slots. Each slot is referred to with a key. A slot can either have a _value_ or a
_method_.

Use `:=` to assign a value (or an object) to a slot. Get the value from a slot by sending the slots name as a 
message to the object:

    Product description := "something you can buy"
    Product description                                              // (3) something you can buy

Get a list of all slot names of `Product` by sending the `slotNames` method to the object:

    Product slotNames                                                // (4) list(type, description)
    Product getSlot("description")

Every object has a slot called `type`, which gives the kind of object you are dealing with.

Get a sorted list of all slots which all objects have with:

    Object slotNames sort

### Inheritance

Supposed we want to model instances of programming books. The book "the Io language" is an instance of a Book object.

    Book := Product clone
    Book type                                                        // (5) Book
    Book proto type                                                  // (6) Product
    Book proto proto type                                            // (7) Object

    io_book := Book clone
    io_book type                                                     // (8) Book [not io_book]
    io_book description                                              // (9) something you can buy

#### Inheritance in Io

    //                                            +---------------+
    //                                            | Object        |
    //                                            +---------------+
    //                                            |  type         |       // Object
    //                                            +---------------+
    //                                                    ^
    //                               +---------------+    |
    //                               | Product       |    |
    //                               +---------------+    |
    //                               |  proto        |----+
    //                               |  type         |                    // Product
    //                               |  description  |                    // something you can buy
    //                               +---------------+
    //                                       ^
    //                  +---------------+    |
    //                  | Book          |    |
    //                  +---------------+    |
    //                  |  proto        |----+
    //                  |  type         |                                 // Book
    //                  +---------------+
    //                          ^
    //     +---------------+    |
    //     | io_book       |    |
    //     +---------------+    |
    //     |  proto        |----+
    //     +---------------+

### Methods

Methods are objects, hence can be assigned to a slot:

    method type                                                      // (10) Block
    method proto slotNames size                                      // (11) 21

`method` is a instance of the object `Block` and is a slot of `Object`.

    add := method(a, b, a + b)
    add(5, 7)                                                          // (12) 12
    getSlot("add") code                                                // (13) method(a, b, a +(b))

Methods can also be recursive:

    fac := method(n, if(n == 1, return 1, return n * fac(n - 1)))
    fac(5)                                                             // (14) 120

An example of a Singleton:

    MyObj := Object clone
    MyObj clone := method(return self)


