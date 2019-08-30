### 题目

[[leetcode 589]](https://leetcode-cn.com/problems/n-ary-tree-preorder-traversal/submissions/) N叉树的前序遍历

### 描述

给定一个 N 叉树，返回其节点值的后序遍历。

例如，给定一个 3叉树 :
![](../narytreeexample.png)

### 解析


递归


### 实现

```java
/*
// Definition for a Node.
class Node {
    public int val;
    public List<Node> children;

    public Node() {}

    public Node(int _val,List<Node> _children) {
        val = _val;
        children = _children;
    }
};
*/
class Solution {
    List<Integer> result = new ArrayList();
    public List<Integer> preorder(Node root) {
        if(root==null) return result;
        result.add(root.val);
        for(Node node: root.children){
            preorder(node);
        }
        
        return result;
    }
}
```