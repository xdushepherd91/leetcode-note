### 题目

[[leetcode 700.]](https://leetcode-cn.com/problems/search-in-a-binary-search-tree/submissions/) 二叉搜索树中的搜索

### 描述

给定二叉搜索树（BST）的根节点和一个值。 你需要在BST中找到节点值等于给定值的节点。 返回以该节点为根的子树。 如果节点不存在，则返回 NULL。

例如，

```
给定二叉搜索树:

        4
       / \
      2   7
     / \
    1   3

和值: 2

你应该返回如下子树:

      2     
     / \   
    1   3
``` 

### 解析

<<<<<<< HEAD
比较简单的二叉树搜索，可以通过递归和循环实现


### 实现

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
    public TreeNode searchBST(TreeNode root, int val) {
        return search(root,val);
    }
    
    public TreeNode searchit(TreeNode root, int val){
        if(root == null) return null;
        TreeNode result=null;
        if(val > root.val){
            result = searchBST(root.right,val);
        }else if(val < root.val){
            result = searchBST(root.left,val);
        }else{
            result = root;
        }
        
        return result;
    }
    
    public TreeNode search(TreeNode root,int val){
        Queue<TreeNode> stack = new LinkedList<TreeNode>();
        stack.add(root);
        
        while(!stack.isEmpty()){
            TreeNode current = stack.poll();
            if(current==null) return null;
            if(current.val == val) return current;
            if(val > current.val ){
                stack.add(current.right);
            }else{
                stack.add(current.left);
            }
            
        }
        return null;
        
    }
}
```
=======
### 实现

>>>>>>> 053a8f565dda737b30e443eca4e49031e01d2b3a
