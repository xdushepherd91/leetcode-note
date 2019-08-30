### 题目

[[leetcode 144]](https://leetcode-cn.com/problems/binary-tree-preorder-traversal/submissions/) 二叉树的前序遍历

### 描述

给定一个二叉树，返回它的 前序 遍历。

 示例:

 ````
    输入: [1,null,2,3]  
    1
        \
        2
        /
    3 

    输出: [1,2,3]
 ````


### 解析

递归可以实现

### 实现

#### 实现1

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
    private List<Integer> result = new ArrayList();
    public List<Integer> preorderTraversal(TreeNode root) {
        if(root == null) return result;
        result.add(root.val);
        preorderTraversal(root.left);
        preorderTraversal(root.right);
        return result;
        
    }
}   
```

#### 实现2

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
    public List<Integer> preorderTraversal(TreeNode root) {
        if(root == null) return new ArrayList();
        List<Integer> result = new ArrayList();
        Deque<TreeNode> queue = new ArrayDeque();
        TreeNode current=null;
        queue.add(root);
        while(!queue.isEmpty()){
            current = queue.removeFirst();
            result.add(current.val);
            if (current.right !=null) queue.addFirst(current.right);
            if (current.left !=null) queue.addFirst(current.left);
        }
        return result;
    }
}
```