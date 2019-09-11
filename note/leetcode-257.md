### 题目

[[leetcode 257]](https://leetcode-cn.com/problems/binary-tree-paths/) 二叉树的所有路径

### 描述

### 解析

1. 很自然地我们可以想到使用递归
2. 并且，在递归边界处将一个路径加入到结果list中。
3. 这里的递归边界判断我们判断node.left和node.right同时为null，也就是node为叶子节点即可。
4. 在递归调用前，我们先判断被递归节点是否为null，不为null则递归。


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
    public List<String> binaryTreePaths(TreeNode root) {
        List<String> result = new ArrayList();
        if(root==null) return result;
        helper(root,result,"");
        return result;
    }
    
    private void helper(TreeNode node ,List<String> result,String path){
        if(node.left ==null && node.right == null){
            result.add(path+node.val);
        }else{
            path = path + node.val +"->";
        }
        if(node.left!=null){
            helper(node.left,result,path);
        }
        if(node.right!=null){
            helper(node.right,result,path);
        }
    }
}
```