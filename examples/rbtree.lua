local Tree = require('bintrees.rbtree');

-- create a new tree, pass in the compare function
local tree = Tree:new(function(a, b) return a - b end);

-- do some inserts
tree:insert(1);
tree:insert(2);
tree:insert(3);
tree:remove(2);

-- get smallest item
print(tree:min())

-- get largest item
print(tree:max())
