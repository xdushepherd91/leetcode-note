### 题目

[[leetcode 538]](https://leetcode-cn.com/problems/convert-bst-to-greater-tree/) 把二叉搜索树转化为累加树

### 描述

给定一个二叉搜索树（Binary Search Tree），把它转换成为累加树（Greater Tree)，使得每个节点的值是原来的节点值加上所有大于它的节点值之和。

例如：

输入: 二叉搜索树:
              5
            /   \
           2     13

输出: 转换为累加树:
             18
            /   \
          20     13

### 解析

递归分析
1. 从题目很容易分析得到，我们的递归应该从右子树开始。
2. 对于每个节点，应该得到其右子树的和，然后累加到自身，再传递给左子树。
3. 从2中不难发现，我们需要一个参数来传递前一个递归的结果。
4. 递归在node为null的时候结束。

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
    public TreeNode convertBST(TreeNode root) {
        if(root==null || (root.left==null&&root.right==null)) return root;
        sumBST(root,0);
        return root;
    }
    
    private int sumBST(TreeNode node ,int sum){
        if(node == null)return sum;
        sum = sumBST(node.right,sum);
        node.val += sum;
        sum = node.val;
        sum = sumBST(node.left,sum);
        return sum;
    }
}
```
