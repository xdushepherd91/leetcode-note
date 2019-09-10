### 题目

[[leetcode 897]](https://leetcode-cn.com/problems/increasing-order-search-tree/) 递增顺序查找树

### 描述

给定一个树，按中序遍历重新排列树，使树中最左边的结点现在是树的根，并且每个结点没有左子结点，只有一个右子结点。

````
输入：[5,3,6,2,4,null,8,1,null,null,null,7,9]

       5
      / \
    3    6
   / \    \
  2   4    8
 /        / \ 
1        7   9

输出：[1,null,2,null,3,null,4,null,5,null,6,null,7,null,8,null,9]

 1
  \
   2
    \
     3
      \
       4
        \
         5
          \
           6
            \
             7
              \
               8
                \
                 9  
````

### 解析

中序遍历，进一步加深了对递归的认识。
1. 使用一个全局的current节点来记录当前的节点
2. 使用一个result节点记录根节点。最初时，current和current节点指向相同。
3. 第一次递归调用返回是在最左节点。我们令其left为null，right不变，并将其设置为current节点。
4. 第一个左子节点返回。我们另current节点的right为当前调用节点，将当前调用节点设置为current。
5. 递归调用 右子树。


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
    private TreeNode current=null;
    public TreeNode increasingBST(TreeNode root) {
        if(root==null) return null;
        TreeNode result = new TreeNode(0);
        current = result;
        inOrder(root);
        return result.right;
    }
    
    public void inOrder(TreeNode node){
        if(node==null) return;
        inOrder(node.left);
        node.left = null;
        current.right = node;
        current=node;
        inOrder(node.right);

    }
}
```