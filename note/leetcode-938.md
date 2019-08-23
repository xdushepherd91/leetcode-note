### 题目
[leetcode 938] 二叉搜索树的范围和


### 链接
[leetcode 938](https://leetcode-cn.com/problems/range-sum-of-bst/)

### 题目描述

给定二叉搜索树的根结点 root，返回 L 和 R（含）之间的所有结点的值的和。

二叉搜索树保证具有唯一的值。

#### 示例 1

````
输入：root = [10,5,15,3,7,null,18], L = 7, R = 15
输出：32
````
#### 示例 2

````
输入：root = [10,5,15,3,7,13,18,1,null,6], L = 6, R = 10
输出：23
````

### 解析

题目规定使用二叉搜索树，那么，对于任意节点，有如下性质：

1. 任意节点的值不小于左子树的值
2. 任意节点的值不大于右子树的值

在给定了某一节点的时候，我们需要做的事情是：

1. 获取当前节点的值。满足条件，在结果中加上当前节点的值。
2. 获取左子树的和。加到结果中去。
3. 获取右子树的和。加到结果中去。

注意：获取子树和的过程是一个递归调用的过程。

递归的边界判断：

1. 当前节点的值已经小于L，那么向左子节点的递归结束。
2. 当前节点的值已经大于R，那么向右子节点的递归结束。

### 代码实现

#### 实现1


```java

    public static int rangeSumBST(TreeNode root, int L, int R) {
        int result = 0;
        if (root == null) {
            return 0;
        }
        if (root.val < L) {
            result += rangeSumBST(root.right, L, R);
        } else if (root.val > R) {
            result += rangeSumBST(root.left, L, R);
        } else {
            result += root.val;
            result += rangeSumBST(root.left, L, R);
            result += rangeSumBST(root.right, L, R);
        }
        return result;
    }
```


#### 实现2

```java
    public static int rangeSumBST1(TreeNode root, int L, int R){
        int result = 0;
        if (root==null){
            return 0;
        }

        if(root.val>=L&&root.val<=R){
            result +=root.val;
        }
        if (root.val>L){
            result +=rangeSumBST1(root.left,L,R);
        }
        if (root.val<R){
            result  += rangeSumBST1(root.right,L,R);
        }
        return  result;
    }
```









