### 题目

[[leetcode 107]](https://leetcode-cn.com/problems/binary-tree-level-order-traversal-ii/) 二叉树的层次遍历

### 描述

给定一个二叉树，返回其节点值自底向上的层次遍历。 （即按从叶子节点所在层到根节点所在的层，逐层从左向右遍历）

````
例如：
给定二叉树 [3,9,20,null,null,15,7],

    3
   / \
  9  20
    /  \
   15   7
返回其自底向上的层次遍历为：

[
  [15,7],
  [9,20],
  [3]
]
````

### 解析

1. 递归方法，需要向辅助方法，向辅助方法传递状态。

2. 循环方法，需要每次处理一个层次的，并将其放出栈中。

### 实现


#### 实现1 循环方法
```java
 /**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        if(root==null) return new ArrayList();
        Stack<List<Integer>> stack = new Stack();
        Deque<TreeNode> queue = new ArrayDeque();
        queue.addLast(root);
        while(!queue.isEmpty()){
            int count = queue.size();
            List<Integer> temp = new ArrayList();
            while(count-->0){
               TreeNode current = queue.removeFirst();
                temp.add(current.val);
                if(current.left !=null){
                    queue.add(current.left);
                }
                if(current.right  != null){
                    queue.add(current.right); 
                }
            }
            stack.add(temp);
        }
        List<List<Integer>> result = new ArrayList();
        while(stack.size()>0){
            result.add(stack.pop());
        }
        return result;
    }
}   
```

#### 实现2 递归

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public List<List<Integer>> levelOrderBottom(TreeNode root) {
        if(root==null) return new ArrayList();
        List<List<Integer>> result = new ArrayList(),r = new ArrayList();
        levelOrderBottom(root,result,0);
        int i = result.size() -1;
        while(i>=0){
            r.add(result.get(i--));
        }
        return r;
    }
    
    public void levelOrderBottom(TreeNode node,List<List<Integer>> result,int depth){
        if(node == null){
            return;
        }
        if(result.size()==depth){
            result.add(new ArrayList<Integer>());
        }
        List<Integer> temp = result.get(depth);
        temp.add(node.val);
        levelOrderBottom(node.left,result,depth+1);
        levelOrderBottom(node.right,result,depth+1);
    }
}
```
