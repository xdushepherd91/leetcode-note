### 题目

[[leetcode 226]](https://leetcode-cn.com/problems/invert-binary-tree/submissions/) 翻转二叉树

### 描述

翻转一棵二叉树。

#### 示例

````
输入：
     4
   /   \
  2     7
 / \   / \
1   3 6   9
输出：
     4
   /   \
  7     2
 / \   / \
9   6 3   1

````




### 解析

题目比较简单，考察对二叉树的理解。这里可以使用递归的方式解决，也可以使用循环。这里说一下递归

    1. 边界条件。当入参为null的时候，递归调用结束。
    2. 对每个入参，将其左右子节点进行调换，注意需要使用临时节点。
    3. 对其左右子节点进行递归调用。

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
    private TreeNode temp = new TreeNode(0);
    public TreeNode invertTree(TreeNode root) {
        if(root == null){
            return null;
        }
        temp = root.left;
        root.left = root.right;
        root.right = temp;
        invertTree(root.left);
        invertTree(root.right);
        return root;
    }
}
```

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
    TreeNode temp = new TreeNode(0);
    public TreeNode invertTree(TreeNode root) {
        if (root == null) return null;
    Queue<TreeNode> queue = new ArrayDeque<TreeNode>();
    queue.add(root);
        while(!queue.isEmpty()){
            TreeNode node = queue.poll();
            temp = node.left;
            node.left = node.right;
            node.right = temp;
            if(node.left!=null) queue.add(node.left);
            if(node.right!=null) queue.add(node.right);
        }
        return root;
    }
}
```