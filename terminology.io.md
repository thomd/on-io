# Terminology

### Expression

Everything in Io is an _expression_ composed of _messages_ (each of which is an object). Io has no keywords or statements.

The informal BNF description:

    exp        ::= { message | terminator }
    message    ::= symbol [arguments]
    arguments  ::= "(" [exp [ { "," exp } ]] ")"
    symbol     ::= identifier | number | string
    terminator ::= "\n" | ";"

### Object

Every _thing_ is an object. Strings, Methods and Operators are also objects.

The root-level object is called `Object`.

### Lobby

Master _namespace_ that contains all the named objects. 

    Lobby

Think of the Lobby as the global context.

### Type

By convention, types are _uppercase_:

    Fruit := Object clone
    Fruit type                                                      // Fruit

Types are for organizing code.

### Instance

By convention, instances are _lowercase_:

    apple := Fruit clone
    apple type                                                       // Friut

### Prototype

Objects remember their prototypes. If an object can't respond to an message, it sends that message to its prototype.

### Slot

Objects are a list of key/value pairs called _slots_ (think of slots as a _hash_). A slot's key is a symbol
(a unique immutable sequence), its value is any type of object.

Get slot names of an object with the `slotNames` method:

    Object slotNames                                                 // slots of the root-level object
    slotNames                                                        // slots of the Lobby (global context)

### Message

Every _action_ with an _object_ is a _message_ (including assignments). A message either returns the value of a slot 
or invokes the method of a slot. Io's syntax does not distinguish between accessing a slot containing a variable 
from one containing a method.

Message _arguments_ are passed as _expressions_ and evaluated by the _receiver_.

### Receiver

An object is a receiver of a message:

    Fruite := Object clone
    //          ^      ^
    //          |      |
    //          |      +----- "message"
    //          |
    //          +------------ "receiver"

If an object receives a message to which it can't respond, then it sends this message to its _prototype_.

