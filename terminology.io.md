# Terminology

### Object

Every _thing_ is an object. Strings, Methods and Operators are also objects.

The root-level object is called `Object`.

### Type

By convention, types are _uppercase_:

    Fruit := Object clone
    Fruit type                                               // Fruit

Types are for organizing code.

### Instance

By convention, instances are _lowercase_:

    apple := Fruit clone
    apple type                                               // Friut

### Prototype

Objects remember their prototypes. If an object can't respond to an message, it sends that message to its prototype.

### Slot

Objects have slots. Slots contain objects. Think of slots as a _hash_

Get slot names of an object with the `slotNames` method:

    Object slotNames                                                // slots of the root-level object
    slotNames                                                       // slots of the Lobby (global context)

### Message

Every _interaction_ with an object is a message. A message either returns the value in a slot or invokes
the method in a slot.

### Receiver

An object is a receiver of a message:

    //         "receiver" --+     +-- "message"
    //                      |     |
    //                      v     v
    //                   Object clone

### Lobby

Master _namespace_ that contains all the named objects. 

    Lobby

Think of the Lobby as the global context.


