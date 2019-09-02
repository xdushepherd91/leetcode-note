### 题目

[[leetcode 108]](https://leetcode-cn.com/problems/convert-sorted-array-to-binary-search-tree/) 将有序数组转换为二叉搜索树

### 描述

将一个按照升序排列的有序数组，转换为一棵高度平衡二叉搜索树。

本题中，一个高度平衡二叉树是指一个二叉树每个节点 的左右两个子树的高度差的绝对值不超过 1。

示例:

````
给定有序数组: [-10,-3,0,5,9],

一个可能的答案是：[0,-3,9,-10,null,5]，它可以表示下面这个高度平衡二叉搜索树：
      0
     / \
   -3   9
   /   /
 -10  5
````

### 解析

1. 首先，入参是有序数组。那么问题可以进行简化。我们从有序数组的中间拿到一个元素，即二叉树的根节点。
2. 从根节点元素的左面中间拿到一个元素，是根节点的左子节点。
3. 右边是右子节点。
4. 递归边界判断。当某个元素的某侧不存在元素的时候，递归结束。



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
    public TreeNode sortedArrayToBST(int[] nums) {
        int length=nums.length;
        return sortedArrayToBST(nums,0,length-1);
    }
    
    public TreeNode sortedArrayToBST(int[] nums,int lo,int hi){

        if(lo>hi) return null;
        int length=hi-lo+1,i=lo+length/2;
        TreeNode node = new TreeNode(nums[i]);
        node.right=sortedArrayToBST(nums,i+1,hi);
        node.left=sortedArrayToBST(nums,lo,i-1);
        return node;
    }
}
```