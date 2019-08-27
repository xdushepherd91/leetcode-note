### 题目

[[leetcode 1051]](https://leetcode-cn.com/problems/height-checker/submissions/) 高度检查器

### 描述

学校在拍年度纪念照时，一般要求学生按照 非递减 的高度顺序排列。

请你返回至少有多少个学生没有站在正确位置数量。该人数指的是：能让所有学生以 非递减 高度排列的必要移动人数。

#### 示例

````
输入：[1,1,4,2,1,3]
输出：3
解释：
高度为 4、3 和最后一个 1 的学生，没有站在正确的位置。

注意:
1.  1 <= heights.length <= 100
2.  1 <= heights[i] <= 100
````


### 解析

1. 首先对入参进行排序，按照非递减方式排序
2. 对排序数组和原有数组进行对比，凡是对应下标数据不对应，都是需要挪动的学生。对结果计数count++。

### 实现

```java
class Solution {
    public int heightChecker(int[] heights) {
        int length = heights.length,count=0;
        int[] sort = new int[101];
        for(int height : heights){
            sort[height]++;
        }
        
        for(int i =0,j=0;i<101;i++){
            while(sort[i]-->0){
                if(i!=heights[j++]){
                    count++;
                }
            }
        }
        
        return count;
    }
}
```



