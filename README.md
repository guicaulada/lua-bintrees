Binary Trees
============

This package provides Binary and Red-Black Search Trees written in Lua. It is released under the MIT License.

Binary Search Trees are a good way to store data in sorted order. A Red-Black tree is a variation of a Binary Tree that balances itself.

Algorithms were taken from Julienne Walker: http://eternallyconfuzzled.com/jsw_home.aspx

This is an adaptation of the JavaScript version created by [Vadim Graboys](https://github.com/vadimg/js_bintrees).

Trees
------------

* BinTree - Binary Search Tree
* RBTree - Red-Black Tree

Quickstart
------------

```
luarocks install bintrees
```

```lua
local RBTree = require('bintrees').RBTree;
local tree = RBTree:new(function(a, b) return a - b end);

tree:insert(2);
tree:insert(-3);
```

see examples/node.js for more info

Constructor
------------

Requires 1 argument: a comparator function f(a,b) which returns:
* 0 if a == b
* >0 if a > b
* <0 if a < b

Methods
------------

### insert(item)
> Inserts the item into the tree. Returns true if inserted, false if duplicate.

### remove(item)
> Removes the item from the tree. Returns true if removed, false if not found.

### size
> Number of nodes in the tree.

### clear()
> Removes all nodes from the tree.

### find(item)
> Returns node data if found, null otherwise.

### findIter(item)
> Returns an iterator to the node if found, null otherwise.

### lowerBound(item)
> Returns an iterator to the tree node at or immediately after the item. Returns null-iterator if tree is empty.

### upperBound(item)
> Returns an iterator to the tree node immediately after the item. Returns null-iterator if tree is empty.

### min()
> Returns the min node data in the tree, or null if the tree is empty.

### max()
> Returns the max node data in the tree, or null if the tree is empty.

### each(f)
> Calls f on each node's data, in order.

### reach(f)
> Calls f on each node's data, in reverse order.

### iterator()
> Returns a null-iterator. See __Iterators__ section below.

Iterators
------------

tree:iterator() will return a null-iterator. On a null iterator,
* next() will return the first element in the tree
* prev() will return the last element in the tree

Otherwise,
* next() will return the next element
* prev() will return the previous element
* data() will return the node the iterator is pointing to

When iteration reaches the end, the iterator becomes a null-iterator again.

Forward iteration example:

```lua
local it=tree:iterator()
local item = it:next()
while item ~= nil do
  -- do stuff with item
  item = it:next()
end
```

If you are iterating forward through the tree, you can always call prev() to go back, and vice versa.

__NOTE:__ iterators become invalid when you add or remove elements from the tree.
