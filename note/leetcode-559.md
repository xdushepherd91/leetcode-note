### 题目

[[leetcode 559]](https://leetcode-cn.com/problems/maximum-depth-of-n-ary-tree/submissions/) N叉树的最大深度

### 描述

给定一个 N 叉树，找到其最大深度。

最大深度是指从根节点到最远叶子节点的最长路径上的节点总数。

例如，给定一个 3叉树 :

![N叉树](../narytreeexample.png)

我们应返回其最大深度，3。

### 解析

我们使用递归来解决问题，因为每个子节点的深度值等于父节点的深度值加一，需要拿到父节点的深度值信息，我们需要写一个helpler方法完成参数传入。

### 实现

#### 实现1

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
    public int maxDepth(Node root) {
        int depth = 0;
        depth = helper(root,depth);
        return depth;
    }
    
    
    public int helper(Node current,int depth){
        if(current==null){
            return depth;
        }else if(current.children.isEmpty()){
            return depth+1;
        }else{
            depth++;
            int max=depth,temp=0;
            for(Node node : current.children){
                temp = helper(node,depth);
                max = Math.max(temp,max);
            }
            return max;
        }
    }
}
```

#### 实现2

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
    public int maxDepth(Node root) {
        if(root==null) return 0;
        int depth = 1;
        depth = helper(root.children,depth);
        return depth;
    }
    
    
    public int helper(List<Node> children,int depth){
        if(children==null||children.size()==0){
            return depth;
        }
        depth++;
        int max=depth,temp=0;
        for(Node node : children){
            temp =  helper(node.children,depth);
            max = Math.max(temp,max);
        }
        
        
        return max;
    }
}
```