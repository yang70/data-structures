# Data Structures - An exercise exploring classic data structures and algorithms in Ruby and JavaScript

[![Build Status](https://travis-ci.org/yang70/data-structures-and-algorithms.svg?branch=queue)](https://travis-ci.org/yang70/data-structures-and-algorithms)

By [Matthew Yang](http://www.matthewgyang.com).

##Description##
This is a practice/demonstration repository to explore and create classic data structures and sorting algorithms.  These include:

##Binary Search Tree - JavaScript##
[github.com/yang70/binary-search-tree_javascript](https://github.com/yang70/binary-search-tree_javascript)

##Doubly Linked List - JavaScript##
[github.com/yang70/doubly-linked-list-javascript](https://github.com/yang70/doubly-linked-list-javascript)

##Insertion-Sort algorithm##
This sorting algorithm takes an array of numbers and sorts them from low to high.  It works by starting from the left side of the array and moving right, assuming the left side of the array is already sorted.

I created an `Insertion` class which has one method `#sort`.  This method takes an array as an argument.

The algorithm then iterates through the array by starting at the second index of the array (`array[1]`).   The value is stored as `current` and is compared to the index directly to the left.  If the value to the left is a greater value, that value gets shifted one index to the right, and the `current` value gets set to the index it was compared to.  `current` then gets set at the next index and is compared to the left again until either it is greater/equal or reaches the end of the array.  This continues for the entire length of the array.

Theoretically, this algorithm has a worst case O(n^2) for an array that is in reverse order, and is adaptive to a best case of an already sorted array O(n).  I benchmarked my algorithm against three 20 digit arrays; sorted, reversed and random.  After iterating each sort 100,000 times, the time difference was 1 tenth of a second or less (all just about 3 seconds), so close almost statistically insiginificant in my opinion.  Even after bumpint it to 1 million iterations, the time difference between the 3 sorts was + or - 1 tenth of a second (this time just under 30 seconds per array).  I can only conclude that my algorithm must not be a true, adaptive, insertion sort.

![insertion benchmark](https://s3.amazonaws.com/mystufftoshare/ll-benchmark.png)

##Linked List##
A signly linked list is a data structure composed of `Nodes` that contain a value and also a pointer to the next `Node` in the list or to `nil` if it is the end of the list. The list itself keeps track of only one node which is designated the `head`, but can find any node by starting at the `head` and moving down the chain.  It can be conceptualized like a train of nodes each pointing to the next in line, starting at the `head`, however in reality it is more that each subsequent `Node` is nested *within* the previous.

I first created a `Node` class that takes a value as an argument and a `nexxt` node (next is a reserved keyword so I added an `x`).  If no `nexxt` is entered, it is set to `nil` by default.

I then created a `LinkedList` class.  My linked list class contains methods to `insert` a `Node` at the `head`, `search` for and return a specific `Node`, `remove` and return a specific `Node` from the list, and finally a `to_s` method to display the list contents.

##Stack##
This data structure was discussed in class and could be created nicely by incorporating the Linked List created above.  A stack data structure could be visualized as a pile of data, one on top of the other, where the last one in is the first one out (LIFO).  There is no way to iterate the entire stack, only `push` new data to the top, or `pop` the top piece of data out.

As mentioned, I created the `Stack` class structure by requiring the `LinkedList` I created.  On `initialize` of a new `Stack` instance, it creates an instance of `LinkedList`.  I then designed the `push` and `pop` methods of `Stack` around the `insert` and `remove` methods of `LinkedList` which effectively restricts access to the `search` method of `LinkedList` since it is not a feature of a classic stack structure.  I also instituted a `peek` method in order to see what the top value is without actually removing it.

##Queue##
I created this data-structure similarly to the `Stack` class listed above, in that I built off of my previous `LinkedList` class.  The idea of a `Queue` is the classic first-in-first-out (FIFO) or 'checkout-line' type of linear structure, where the first node placed in line is the first one out.  It's basically an inverse of the `Stack`, which is last-in-first-out (LIFO) linear structure.

The three methods available are `enqueue`, `dequeue` and `size`.  I decided that I would consider the `@head` of the `LinkedList` would be considered the front of the line and designed the `dequeue` method from there, making sure to check if `@head` was `nil`.  For `enqueue` I wrote a private method that traverses the `LinkedList` and returns the final node, or `nil` if the list is empty.  I can then set `nexxt` of that last node to be a new node with the desired value.  `size` was solved similarly, by traversing the `LinkedList` and counting each iteration or returning `nil` if the list is empty.

##Binary Tree##
This data structure is a simple Binary tree, meaning it begins at a single `root` element.  Each element has a `value`, a `left` branch and a `right` branch.  If the element is a 'leaf' (final element) it's `left` and `right` branches are set to `nil`.

I designed this structure to have only a single class `Binary_tree` which builds off of itself and where a binary tree structure is made up of `Binary_tree`'s, or in other words there is no `node` class.

I created this structure after creating a [Binary Search Tree in JavaScript](https://github.com/yang70/binary-search-tree_javascript), and therefore it borrows heavily from the methods I had previously created.  These are the three depth-first traversals, which incorporate a recursive algorithm to return values in a specific order. These are:

* Pre-order - self, left, right
* In-order - left, self, right
* Post-order - left, right, self

Here is an example of the `in_order` algorithm:
```ruby
def in_order
  leftValues = []
  rightValues = []

  leftValues = @left.in_order if @left
  rightValues = @right.in_order if @right

  leftValues.concat([@value]).concat(rightValues)
end
```
After creating a good recursive algorithm, it's just a matter of concatenating the results correctly and then returning them in the desired format (I chose an array).

##Hash Table##
The hash is a data structure that is widely used in Ruby programs and all across Rails applications.  On the surface it seems simple, it's just a `key:value` pair.  But digging deeper the question arises, how does the computer store and retrieve these references in relation to other items in the same hash?

In order to better understand the structure we were instructed to implement our own.  The basic idea is the hash table itself will be an array of linked lists with a size determined on creation.  The `Key` will be restricted to a string, and when data is inserted a `Hash` method is run on the strings name to determine which index in the array it will be added to.  The `key:value` pair will then be inserted into the linked list at the designated index.  On retrieval or deletion, the `key` that is provided will run through the same hashing algorithm that will point to the same index then retrieved from the specific linked list via matching to the exact `key` given.

I decided to build upon my previous `LinkedList` class, however modified it slightly to allow a node to store a `key` and `value`.  This file was renamed to `hash_linked_list`.

For the `HashTable` class, I set the `initialize` method to take an integer that will be the size of the hash array and then create a `HashLinkedList` instance and push it into the array `size` times.

I then added 3 public and one private methods to the class:

###Private###
* `#hash` This method is what determines which index in the array the `key:value` will be stored.  It takes the `key` and first checks to see if it is a string, if not it raises an exception.

  Next it iterates through each letter in the string and and finds the sum of the ordinal value of each letter.  This is then divided by the size of the array which is stored in an instance variable `@size` and returns that value.

  This method is only used within the instance of the class itself and therefore was set as a private method.

###Public###

* `#set` Takes a `key:value` pair and initially checks to see if the key has been used already by calling `#get` on it and raising an exceptiong if it returns a value.  If the key has not been used it then calls `#hash` on the key, then sets the return value as the index of the `@table` which is the hash table itself.  That returns the appropriate `HashLinkedList` and using it's `#insert` method the `key:value` is stored.

* `#get` Takes a `key` as an argument and, like `#set`, calls `#hash` in order to find it's storage location.  It then uses the `#search` method of `HashLinkedList` in order to find the appropriate node and then returns the value.  It returns `nil` if nothing is found.

* `#delete` This also takes a key and find the target using the same methods as `#get` and `#set`.  It then calls the `#remove` method of `HashLinkedList` and per the specs returns the value of the deleted pair, or `nil` if nothing is found.

###Benchmarks###

I have done some initial benchmarking using Ruby's built in [Benchmark](http://ruby-doc.org/stdlib-2.2.3/libdoc/benchmark/rdoc/Benchmark.html) and the conclusions (maybe obviously) are that the efficiency is proportional to the number of items being inserted and the size of the original `HashTable`.

In testing I have 4 different sized hash's with different array lengths:


* Extra Small - 10
* Small - 100
* Medium - 500
* Large - 1,000
* Extra Large - 5,000

Using the OS X built in dictionary of about 230,000 words as the `key` and the reverse as the value, it became apparent that storing data in the smaller hash's became exponentially slower, as each linked list within is used much more.  In the graph below you can see how 5,000 words is handled pretty well but grows exponentially as the number of words increases.

![graph](https://s3.amazonaws.com/mystufftoshare/HashTableGraph.jpg)

Ideally for insertion/retrieval, there would be one slot in the array for each value, therefore hashing the key would lead you to the exact location of the node without having to traverse a linked list as well.  However this depends on each `key` being hashed uniquely and the array being large enough to handle every item being stored which may not be known at hash creation and does not handle memory usage well as there could be a lot of unused space reserved.

Results of hashing and retrieving the entire library of words for Large and Extra Large hash's can be seen below.  Interestingly, a `HashTable` of size 1,000 is only slightly slower than one of 5,000.  Therefore 1,000 would be a nice compromise of speed and unneeded memory usage.

![benchmark](https://s3.amazonaws.com/mystufftoshare/hash-benchmark.png)

#Testing/Continuous Integration#
##Travis CI##
There is a test suite for all structures/algorigthms and continuous integration was implemented with [Travis CI](https://travis-ci.org/).

##Tests##
Testing is accomplished using `minitest-spec` that is built into the Ruby language.  A `_spec.rb` file has been created for each program which runs via a `rake test` command.

#Credit#
Created with input from discussions with classmates/instructors in class as well as referenceing the following:

* [Wikipedia - Linked list](https://en.wikipedia.org/wiki/Linked_list)
* [Wikipedia - Insertion Sort](https://en.wikipedia.org/wiki/Insertion_sort)
* [Princeton.edu](http://www.princeton.edu/~achaney/tmve/wiki100k/docs/Queue_(data_structure).html)
* [Visualgo.net](http://visualgo.net/)
