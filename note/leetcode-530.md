### 题目

[[leetcode 530]](https://leetcode-cn.com/problems/minimum-absolute-difference-in-bst/) 二叉搜索树的最小绝对差

### 描述

给定一个所有节点为非负值的二叉搜索树，求树中任意两节点的差的绝对值的最小值。

示例 :

输入:

   1
    \
     3
    /
   2

输出:
1

解释:
最小绝对差为1，其中 2 和 1 的差的绝对值为 1（或者 2 和 3）。
注意: 树中至少有2个节点。

### 解析

本题关键点： 二叉搜索树的升序遍历。

那么从最小值开始，逐个求差值，记录最小差值即可。

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
    TreeNode pre = null;
    int res = Integer.MAX_VALUE;

    public int getMinimumDifference(TreeNode root) {
        if (root == null) return 0;
        helper(root);
        return res;
    }

    private void helper(TreeNode root) {
        if (root == null) return;
        helper(root.left);
        if (pre != null) {
            //求相邻节点的差值
            res = Math.min(res, Math.abs(root.val - pre.val));
        }
        pre = root;
        helper(root.right);
    }
}
````

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
    int min=Integer.MAX_VALUE;
    public int getMinimumDifference(TreeNode root) {
        helper(root,Integer.MIN_VALUE-10);
        return min;
    }
    
    private int helper(TreeNode current,int prev){
        if(current == null) return prev;
        prev = helper(current.left,prev);
        min = Math.min(min,Math.abs(current.val-prev));
        prev = helper(current.right,current.val);
        return prev;
    }
}
```

