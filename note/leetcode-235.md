### 题目

[[leetcode 235]](https://leetcode-cn.com/problems/lowest-common-ancestor-of-a-binary-search-tree/) 二叉搜索树的最近公共祖先

### 描述

给定一个二叉搜索树, 找到该树中两个指定节点的最近公共祖先。

百度百科中最近公共祖先的定义为：“对于有根树 T 的两个结点 p、q，最近公共祖先表示为一个结点 x，满足 x 是 p、q 的祖先且 x 的深度尽可能大（一个节点也可以是它自己的祖先）。”

例如，给定如下二叉搜索树:  root = [6,2,8,0,4,7,9,null,null,3,5]

![png](../bt.png)
````
示例 1:

输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 8
输出: 6 
解释: 节点 2 和节点 8 的最近公共祖先是 6。
示例 2:

输入: root = [6,2,8,0,4,7,9,null,null,3,5], p = 2, q = 4
输出: 2
解释: 节点 2 和节点 4 的最近公共祖先是 2, 因为根据定义最近公共祖先节点可以为节点本身。

````

### 解析

非迭代法：

当前节点大于p和q，那么将当前节点更新为其左子节点。
当前节点小于p和q，那么将当前节点更新为其右子节点。
否则，找到最近公共祖先。



### 实现

#### 实现1 循环法

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
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        
        while(true){
            if(root.val > p.val && root.val>q.val){
                root = root.left;
            }else if(root.val < p.val && root.val<q.val){
                root = root.right;
            }else {
                break;   
            }
        }
        
        return root;
    }
}
```


#### 实现2 迭代法

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
    public TreeNode lowestCommonAncestor(TreeNode root, TreeNode p, TreeNode q) {
        if(root==null) return null;
        TreeNode node = null;
        if(root.val>q.val&&root.val>p.val){
            node = lowestCommonAncestor(root.left,p,q);
        }else if(root.val<q.val&&root.val<p.val){
            node = lowestCommonAncestor(root.right,p,q);
        }else {
            node = root;
        }
        return node;
    }
}
```