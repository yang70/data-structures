# Data Structures - An exercise exploring classic data structures and algorithms in Ruby

[![Build Status](https://travis-ci.org/yang70/data-structures-and-algorithms.svg?branch=queue)](https://travis-ci.org/yang70/data-structures-and-algorithms)

By [Matthew Yang](http://www.matthewgyang.com).

## Description
This is a practice/demonstration repository to explore and create classic data structures and sorting algorithms.  These include:

* **Insertion-Sort algorithm** - This sorting algorithm takes an array of numbers and sorts them from low to high.  It works by starting from the left side of the array and moving right, assuming the left side of the array is already sorted.  It stores the current value of the index that will be compared to indices to the left.  If the value to the left is a greater value, that value gets shifted one index to the right, and the current value gets set to the index it was compared to and the comparison moves one more to the left. If the value being compared is greater than or equal to the value to it's left, it is held in place and the search moves on to the next index in the array.

Theoretically, this algorithm has a worst case O(n^2) for an array that is in reverse order, and is adaptive to a best case of an already sorted array O(n).  I benchmarked my algorithm against three 20 digit arrays; sorted, reversed and random.  After iterating each sort 100,000 times, the time difference was 1 tenth of a second or less (all just under 3 seconds), so close almost statistically insiginificant in my opinion.  Even after bumpint it to 1 million iterations, the time difference between the 3 sorts was + or - 1 tenth of a second (this time just under 30 seconds per array).  I can only conclude that my algorithm must not be a true, adaptive, insertion sort.

* **Linked List** - I did this through creation of a singly `LinkedList` class, which is made up of `Node` classes.  A signly linked list knows which `Node` was the last added, called the `head`.  Each `Node` contains a value and knows of the next value in the list.  The final `Node` in the list points to `nil`.  It can be visualized like a train of nodes each pointing to the next in line, starting at the `head`, however in reality it's more that each subsequent `Node` is nested within the previous.  My linked list class contains methods to `insert` a `Node` at the `head`, `search` for and return a specific `Node`, `remove` and return a specific `Node` from the list, and finally a `to_s` method to display the list contents.  There are also tests for these functions in a `spec` directory.

* **Stack** - This data structure was discussed in class and could be created nicely by incorporating the Linked List created above.  A stack data structure could be visualized as a pile of data, one on top of the other, where the last one in is the first one out (LIFO).  There is no way to iterate the entire stack, only `push` new data to the top, or `pop` the top piece of data out.  As mentioned, I created the `Stack` class structure by requiring the `LinkedList` I created.  On `initialize` of a new `Stack` instance, it creates an instance of `LinkedList`.  I then designed the `push` and `pop` methods of `Stack` around the `insert` and `remove` methods of `LinkedList` which effectively restricts access to the `search` method of `LinkedList` since it is not a feature of a classic stack structure.  I also instituted a `peek` method in order to see what the top value is without actually removing it.

* **Queue** - I created this data-structure similarly to the `Stack` class listed above, in that I built off of my previous `LinkedList` class.  The idea of a `Queue` is the classic first-in-first-out (FIFO) or 'checkout-line' type of linear structure, where the first node placed in line is the first one out.  It's basically an inverse of the `Stack`, which is last-in-first-out (LIFO) linear structure.  The three methods available are `enqueue`, `dequeue` and `size`.  I decided that I would consider the `@head` of the `LinkedList` would be considered the front of the line and designed the `dequeue` method from there, making sure to check if `@head` was `nil`.  For `enqueue` I wrote a private method that traverses the `LinkedList` and returns the final node, or `nil` if the list is empty.  I can then set `nexxt` of that last node to be a new node with the desired value.  `size` was solved similarly, by traversing the `LinkedList` and counting each iteration or returning `nil` if the list is empty.

## Testing/Continuous Integration
There is a test suite for all structures/algorigthms and continuous integration was implemented with [Travis CI](https://travis-ci.org/).

Insertion Sort has benchmarks built into it's test that compare the different times needed to sort an array of 20 integers starting sorted, reversed or randomized.  The sort is run 100,000 times for each different array.

## Credit
______
Created with input from discussions with classmates/instructors in class as well as referenceing the following:
* [Wikipedia - Linked list](https://en.wikipedia.org/wiki/Linked_list)
* [Wikipedia - Insertion Sort](https://en.wikipedia.org/wiki/Insertion_sort)
* [Princeton.edu](http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Queue_(data_structure).html)
* [Visualgo.net](http://visualgo.net/)
