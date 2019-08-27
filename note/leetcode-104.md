### 题目

[[leetcode 104]](https://leetcode-cn.com/problems/maximum-depth-of-binary-tree/) 二叉树的最大深度

### 描述

给定一个二叉树，找出其最大深度。

二叉树的深度为根节点到最远叶子节点的最长路径上的节点数。

说明: 叶子节点是指没有子节点的节点。

#### 示例

```java
给定二叉树 [3,9,20,null,null,15,7]，
   3
   / \
  9  20
    /  \
   15   7

结果 3
```
### 解析

比较简单的递归问题。

1. 递归结束条件。入参node为null，返回0.
2. 将根节点的左子树高度和右子树的高度比较，选择较大的一个，加上1，即为树的最大深度。
3. 递归过程类似。



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
    public int maxDepth(TreeNode root) {
        if(root == null){
            return 0;
        }
        int depth = 1;
        int dl = maxDepth(root.left);
        int dr = maxDepth(root.right);
        depth += Math.max(dl,dr);
        return depth;
    }
}
```

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
    
    static class Pair{
        public TreeNode node;
        public int depth;
        
        public Pair(TreeNode node,int depth){
            this.node = node;
            this.depth = depth;
        }
    }
    public int maxDepth(TreeNode root) {
        if(root == null)return 0;
        Queue<Pair> queue = new LinkedList();
        queue.add(new Pair(root,1));
        int depth = 0;
        while(!queue.isEmpty()){
            Pair temp = queue.poll();
            root = temp.node;
            int dtemp = temp.depth;
            
            if(root !=null){
                depth = Math.max(depth,dtemp);
                queue.add(new Pair(root.left,dtemp+1));
                queue.add(new Pair(root.right,dtemp+1));
            }
            
        }
        return depth;
    }
}

```
