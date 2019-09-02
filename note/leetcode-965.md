### 题目

[[leetcode 965]](https://leetcode-cn.com/problems/univalued-binary-tree/) 单值二叉树

### 描述

如果二叉树每个节点都具有相同的值，那么该二叉树就是单值二叉树。

只有给定的树是单值二叉树时，才返回 true；否则返回 false。

### 解析

1. 我们需要一个辅助方法，将根节点的值传入。
2. 对每个节点进行迭代的时候，首先判断节点是否存在，不存在直接返回true
3. 如果节点的值和根节点不一致，直接返回false
4. 判断左子树，判断右子树。

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
    public boolean isUnivalTree(TreeNode root) {
         if(root == null ) return true;
         int value = root.val;
         return isUnivalTree(root,value);
    }
    
    public boolean isUnivalTree(TreeNode node, int value){
        if(node==null) return true;
        if(node.val != value) return false;
        if(isUnivalTree(node.left,value)!=true ){
            return false;
        }
        if(isUnivalTree(node.right,value)!=true){
            return false;
        }
        return true;
    }
}
```