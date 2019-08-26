### 题目

[[leetcode 617]](https://leetcode-cn.com/problems/merge-two-binary-trees/submissions/) 合并二叉树

### 描述

给定两个二叉树，想象当你将它们中的一个覆盖到另一个上时，两个二叉树的一些节点便会重叠。

你需要将他们合并为一个新的二叉树。合并的规则是如果两个节点重叠，那么将他们的值相加作为节点合并后的新值，否则不为 NULL 的节点将直接作为新二叉树的节点。

#### 示例

````
输入: 
	Tree 1                     Tree 2                  
          1                         2                             
         / \                       / \                            
        3   2                     1   3                        
       /                           \   \                      
      5                             4   7                  
输出: 
合并后的树:
	     3
	    / \
	   4   5
	  / \   \ 
	 5   4   7

````

### 解析

题目比较简单，我们来思考使用递归的方式进行合并，首先，来思考一个初级的版本：

从root节点开始，递归的对两个树的值进行相加，直到传入的节点为null。

这里有几个问题：

1. 我们假设两个树完全一致。这是不可能的，这里就需要分情况讨论。
2. 在两个树不完全一致的时候，我们在递归中，究竟使用哪个树的节点作为子节点。这里，就需要我们在每次递归的时候，为上层调用返回一个子节点，作为上层节点的子节点。
3. 递归的边界？很显然，左右子树都是null的时候，递归结束。


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
    public TreeNode mergeTrees(TreeNode t1, TreeNode t2) {
                
        if(t1!=null&&t2!=null){
            t1.val += t2.val;
            t1.left = mergeTrees(t1.left,t2.left);
            t1.right = mergeTrees(t1.right,t2.right);
            return t1;
        
        }else if(t1==null&&t2!=null){
            t2.left = mergeTrees(null,t2.left);
            t2.right = mergeTrees(null,t2.right);
            return t2;
        }else if(t1!=null&&t2==null){
            t1.left = mergeTrees(t1.left,null);
            t1.right = mergeTrees(t1.right,null);
            return t1;        
        }else{
            return null;
        }
    }
}
```
