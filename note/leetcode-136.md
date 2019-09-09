### 题目

[[leetcode 136]](https://leetcode-cn.com/problems/single-number/) 只出现一次的数字

### 描述

给定一个非空整数数组，除了某个元素只出现一次以外，其余每个元素均出现两次。找出那个只出现了一次的元素。

说明：

你的算法应该具有线性时间复杂度。 你可以不使用额外空间来实现吗？

````
示例 1:

输入: [2,2,1]
输出: 1
示例 2:

输入: [4,1,2,1,2]
输出: 4
````

### 解析

方法比较多，但是考虑到不使用额外的空间，具有线性复杂度，这里使用异或来解决问题

### 实现

```java
class Solution {
    public int singleNumber(int[] nums) {
        int result = 0;
        for(int num : nums){
            result = result ^ num; 
        }
        
        return result;
    }
}
```
