# Objects

### Prototypes

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

If an object receives a message, then it looks for a matching slot. If no match is found, then the lookup
continues recursively in its `protos`.

Supposed we want to model instances of programming books. The book "The Io language" is an instance of a Book object.

    Book := Product clone
    Book type                                                        // (5) Book
    Book proto type                                                  // (6) Product
    Book proto proto type                                            // (7) Object

    io_book := Book clone
    io_book type                                                     // (8) Book [not io_book]
    io_book description                                              // (9) something you can buy

#### Inheritance Model in Io


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

### Multiple Inheritance

You can add any number of prototypes to an object's `protos` list using `appendProto()`:

    CellPhone := Product clone
    CellPhone phone := method(person, "calling " .. person)

    MusicPlayer := Product clone
    MusicPlayer play := method("playing music")

    SmartPhone := CellPhone clone
    SmartPhone appendProto(MusicPlayer)
    SmartPhone protos map(type)                                      // (10) list(CellPhone, MusicPlayer)

    iPhone := SmartPhone clone
    iPhone description                                               // (11) "something you can buy"
    iPhone play()                                                    // (12) "playing music"
    iPhone phone("Steve")                                            // (13) "calling Steve"

If an object inherits the same slot from multiple objects (_"Daimond-Problem"_), then the slot of the first proto will be used:

    Toaster := Object clone
    Toaster on := method("toast a bread")
    Bomb := Object clone
    Bomb on := method("BOOOM!")
    strangeMachine := Toaster clone
    strangeMachine appendProto(Bomb)
    strangeMachine on()                                              // (14) "toast a bread"

