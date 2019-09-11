### 题目

[[leetcode 872]](https://leetcode-cn.com/problems/leaf-similar-trees/) 叶子相似的树

### 描述

请考虑一颗二叉树上所有的叶子，这些叶子的值按从左到右的顺序排列形成一个 叶值序列 。

![tree](../tree.png)

举个例子，如上图所示，给定一颗叶值序列为 (6, 7, 4, 9, 8) 的树。

如果有两颗二叉树的叶值序列是相同，那么我们就认为它们是 叶相似 的。

如果给定的两个头结点分别为 root1 和 root2 的树是叶相似的，则返回 true；否则返回 false 。

### 解析

1. 使用迭代找到叶子节点。node.left和node.right都为null的节点，加入结果队列。
2. 两个结果队列进行对比。


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
    public boolean leafSimilar(TreeNode root1, TreeNode root2) {
        if(root1==null&&root2==null) return true;
        if(root1==null&&root2!=null) return true;
        if(root1!=null&&root2==null) return true;
        List<Integer> result1 = new ArrayList();
        List<Integer> result2 = new ArrayList();
        findLeaf(root1,result1);
        findLeaf(root2,result2);
        
        if(result1.size()!=result2.size()){
            return false;
        }
        for(int i=0;i<result1.size();i++){
            if(!result1.get(i).equals(result2.get(i))){
                return false;
            }            
        }
        
        return true;
    }
    
    private void findLeaf(TreeNode node,List<Integer> result){
        if(node.left==null && node.right==null){
            result.add(node.val);
        }
        if(node.left!=null){
            findLeaf(node.left,result);
        }
        if(node.right!=null){
            findLeaf(node.right,result);
        }
    }
}
```