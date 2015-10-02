# Data Structures - An exercise exploring classic data structures and algorithms in Ruby

By [Matthew Yang](http://www.matthewgyang.com).

## Description
This is a practice/demonstration repository to explore and create classic data structures.  These include:

* **Insertion-Sort algorithm** - *still in progress*

* **Linked List** - I did this through creation of a singly `LinkedList` class, which is made up of `Node` classes.  A signly linked list knows which `Node` was the last added, called the `head`.  Each `Node` contains a value and knows of the next value in the list.  The final `Node` in the list points to `nil`.  It can be visualized like a train of nodes each pointing to the next in line, starting at the `head`, however in reality it's more that each subsequent `Node` is nested within the previous.  My linked list class contains methods to `insert` a `Node` at the `head`, `search` for and return a specific `Node`, `remove` and return a specific `Node` from the list, and finally a `to_s` method to display the list contents.  There are also tests for these functions in a `spec` directory.

* **Stack** - This data structure was discussed in class and could be created nicely by incorporating the Linked List created above.  A stack data structure could be visualized as a pile of data, one on top of the other, where the last one in is the first one out.  There is no way to iterate the entire stack, only `push` new data to the top, or `pop` the top piece of data out.  As mentioned, I created the `Stack` class structure by requiring the `LinkedList` I created.  On `initialize` of a new `Stack` instance, it creates an instance of `LinkedList`.  I then designed the `push` and `pop` methods of `Stack` around the `insert` and `remove` methods of `LinkedList` which effectively restricts access to the `search` method of `LinkedList` since it is not a feature of a classic stack structure.  I also instituted a `peek` method in order to see what the top value is without actually removing it.

**Credit**
______
Created with input from discussions with classmates/instructors in class as well as referenceing the following:
* [Wikipedia - Linked list](https://en.wikipedia.org/wiki/Linked_list)
* [Wikipedia - Insertion Sort](https://en.wikipedia.org/wiki/Insertion_sort)
* [Visualgo.net](http://visualgo.net/)
