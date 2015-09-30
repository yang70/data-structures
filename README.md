# Data Structures - An exercise exploring basic data structure types in Ruby

By [Matthew Yang](http://www.matthewgyang.com).

## Description
This is a practice/demonstration repository to explore and create classic data structures.  These include:

*Insertion-Sort algorithm - still in progress

*Linked List - creation of a singly linked list class, which is made up of `Node` classes.  A signly linked list knows which `Node` was the last added, called the `head`.  Each `Node` contains a value and knows of the next value in the list.  The final `Node` in the list points to `nil`.  It can be visualized like a train of nodes each pointing to the next in line, starting at the `head`, however in reality it's more that each subsequent `Node` is nested within the previous.  My linked list class contains methods to `insert` a `Node` at the `head`, `search` for and return a specific `Node`, `remove` and return a specific `Node` from the list, and finally a `to_s` method to display the list contents.  There are also tests for these functions in a `spec` directory.
