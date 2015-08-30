# Methods

Methods are objects, hence can be assigned to a slot:

    method type                                                      // (10) Block
    method proto slotNames size                                      // (11) 21

`method` is a instance of the object `Block` and is a slot of `Object`.

    add := method(a, b, a + b)
    add(5, 7)                                                          // (12) 12
    getSlot("add") code                                                // (13) method(a, b, a +(b))

The default __return value__ of a block is the result of the last expression.

Example:

    Sequence asList := method(
      ret := list
      foreach(elem, ret append(elem))
      ret
    )

Methods can also be recursive:

    fac := method(n, if(n == 1, return 1, return n * fac(n - 1)))
    fac(5)                                                             // (14) 120

An example of a Singleton:

    MyObj := Object clone
    MyObj clone := method(return self)

