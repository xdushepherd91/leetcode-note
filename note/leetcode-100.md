### 题目

[[leetcode 100]](https://leetcode-cn.com/problems/same-tree/) 相同的树

### 描述

给定两个二叉树，编写一个函数来检验它们是否相同。

如果两个树在结构上相同，并且节点具有相同的值，则认为它们是相同的。

示例 1:

输入:       1         1
          / \       / \
         2   3     2   3

        [1,2,3],   [1,2,3]

输出: true
示例 2:

输入:      1          1
          /           \
         2             2

        [1,2],     [1,null,2]

输出: false
示例 3:

输入:       1         1
          / \       / \
         2   1     1   2

        [1,2,1],   [1,1,2]

输出: false

### 解析

递归调用。

1. 当前深度上，两个节点的值不相等，返回false。
2. 当前深度上，两个节点有一个为null，返回false。
3. 当前深度上，两个节点同时为null，返回true。
4. 当前深度上，左子树或者右子树判断为false，返回false。


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
    public boolean isSameTree(TreeNode p, TreeNode q) {
        if(p==null){
            if(q!=null) return false;
            if(q==null) return true;
        }else{
            if(q==null) return false;
        }
        
        if(p.val!=q.val){
            return false;
        }
        
        if(!isSameTree(p.left,q.left)){
            return false;
        }
        
        if(!isSameTree(p.right,q.right)){
            return false;
        }
        
        return true;
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
    public boolean isSameTree(TreeNode p, TreeNode q) {
        
        if(p==null&&q==null)return true;
        if(p==null||q==null) return false;
        
        
        if(p.val!=q.val){
            return false;
        }
        
        return isSameTree(p.right,q.right) && isSameTree(p.left,q.left);
        
    }
}
```
