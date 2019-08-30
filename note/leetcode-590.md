### 题目

[[leetcode 590]](https://leetcode-cn.com/problems/n-ary-tree-postorder-traversal/submissions/) N叉树的后序遍历

### 描述

给定一个 N 叉树，返回其节点值的后序遍历。

例如，给定一个 3叉树 :
![](../narytreeexample.png)

返回其后序遍历: [5,6,3,2,4,1].
### 解析

可以使用递归，也可以使用循环。

注意：

对于每个子节点列表，都应该使用栈，使得最后的子节点首先入栈。

### 实现

#### 实现1
``` java
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
    
    private List<Integer> result = new ArrayList();
    public List<Integer> postorder(Node root) {
        if(root == null){
            return new ArrayList();
        }
        
        for(Node node : root.children){
            postorder(node);
        }
        result.add(root.val);
        
        return result;
    }
}
```

### 实现2

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
    public List<Integer> postorder(Node root) {
        if(root==null) return new ArrayList();
        List<Integer> result = new ArrayList();
        Stack<Node> current = new Stack();
        current.push(root);
        
        while(!current.isEmpty()){
            Node temp = current.pop();
            result.add(temp.val);
            if(temp.children!=null){
                for(Node node : temp.children){
                   current.push(node);
                }
            }
        }
        
       Collections.reverse(result);
        return result;
    }
}
``` 

#### 实现3

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
    public List<Integer> postorder(Node root) {
        if(root==null) return new ArrayList();
        List<Integer> result = new ArrayList();
        Stack<Node> stack = new Stack();
        Stack<Node> current = new Stack();
        current.push(root);
        
        while(!current.isEmpty()){
            Node temp = current.pop();
            stack.push(temp);
            if(temp.children!=null){
                for(Node node : temp.children){
                   current.push(node);
                }
            }
        }
        
        while(!stack.isEmpty()){
            Node temp = stack.pop();
            result.add(temp.val);
        }
        
        return result;
    }
}
```