### 题目

[[leetcode 669]](https://leetcode-cn.com/problems/trim-a-binary-search-tree/submissions/) 修剪二叉搜索树

### 描述

给定一个二叉搜索树，同时给定最小边界L 和最大边界 R。通过修剪二叉搜索树，使得所有节点的值在[L, R]中 (R>=L) 。你可能需要改变树的根节点，所以结果应当返回修剪好的二叉搜索树的新的根节点。

````
示例 1:

输入: 
    1
   / \
  0   2

  L = 1
  R = 2

输出: 
    1
      \
       2

示例 2:

输入: 
    3
   / \
  0   4
   \
    2
   /
  1

  L = 1
  R = 3

输出: 
      3
     / 
   2   
  /
 1
       
````
### 解析

解决了，觉得问题比较简单，回头来想，对于递归，理解还是有偏差。

1. 对于每个遍历的节点，当节点为null的时候，返回。
2. 当节点的值小于L的时候，说明应该递归当前节点的由子树，并返回子树中合适的节点代替当前节点。
3. 当节点的值大于R的时候，说明应该递归当前节点的左子树，并返回子树中合适的节点代替当前节点。
4. 当节点的值介于L和R之间的时候，左右子树都需要被遍历。

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
    public TreeNode trimBST(TreeNode root, int L, int R) {
        if(root == null) {
            return null;
        }
        if(root.val < L){
            return trimBST(root.right,L,R);
        }else if(root.val > R){
            return trimBST(root.left,L,R);
        }else {
            root.left = trimBST(root.left,L,R);
            root.right = trimBST(root.right,L,R);
        }
        return root;
    }
}

```


