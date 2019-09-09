### 题目

[[leetcode 575]](https://leetcode-cn.com/problems/distribute-candies/) 分糖果

### 描述

给定一个偶数长度的数组，其中不同的数字代表着不同种类的糖果，每一个数字代表一个糖果。你需要把这些糖果平均分给一个弟弟和一个妹妹。返回妹妹可以获得的最大糖果的种类数。

````
示例 1:

输入: candies = [1,1,2,2,3,3]
输出: 3
解析: 一共有三种种类的糖果，每一种都有两个。
     最优分配方案：妹妹获得[1,2,3],弟弟也获得[1,2,3]。这样使妹妹获得糖果的种类数最多。
示例 2 :

输入: candies = [1,1,2,3]
输出: 2
解析: 妹妹获得糖果[2,3],弟弟获得糖果[1,1]，妹妹有两种不同的糖果，弟弟只有一种。这样使得妹妹可以获得的糖果种类数最多。

````

### 解析

1. 首先确定使用集合来给妹妹分配糖果。
2. 对所有的糖果进行遍历，妹妹的集合中没有当前糖果时，将糖果分配给妹妹
3. 边界。
   1. 妹妹的糖果集合等于糖果总数的1/2的时候
   2. 糖果分配完成。

### 实现

```java
class Solution {
    public int distributeCandies(int[] candies) {
        int i=0,length=candies.length,count=0;
        
        while(sister.size()<length/2&&i<length){
            if(!sister.contains(candies[i])){
                count++;
            }
            i++;
        }
        
        return sister.size();
    }
}
```