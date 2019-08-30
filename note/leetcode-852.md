### 题目

[[leetcode 852]](https://leetcode-cn.com/problems/peak-index-in-a-mountain-array/submissions/) 山峰数组的峰顶索引

### 描述

我们把符合下列属性的数组 A 称作山脉：

A.length >= 3
存在 0 < i < A.length - 1 使得A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1]
给定一个确定为山脉的数组，返回任何满足 A[0] < A[1] < ... A[i-1] < A[i] > A[i+1] > ... > A[A.length - 1] 的 i 的值。

#### 示例1

````
输入：[0,1,0]
输出：1
````

#### 示例2
```
输入：[0,2,1,0]
输出：1
```

### 解析

找数组的最大值而已

实现方法：
1. 遍历
2. 二分法
3. 双指针。两个指针分别从前和从后自增和自减，直到相遇。可以当做一种思路，比遍历还费劲。

### 实现

#### 实现1
```java
class Solution {
    public int peakIndexInMountainArray(int[] A) {
        int i=0;
        for(;i<A.length;){
            if(A[i]<A[i+1]){
                i++;
            }else{
                break;
            }
        }
        return i;
    }
}
```
#### 实现2
```java
class Solution {
    public int peakIndexInMountainArray(int[] A) {
        int lo=0,hi=A.length-1;
        int j=0;
        while(true){
            j=(lo+hi)/2;
            if(A[j]>A[j+1]){
                if(j-1>=0 &&A[j]>A[j-1]){
                    break;
                }else{
                    hi=j-1;
                }
            }else{
                lo=j+1;
            }
        }
        return j;
    }
}
```

#### 实现3

```java
class Solution {
    public int peakIndexInMountainArray(int[] A) {
        int lo=0,hi=A.length-1;
        while(lo != hi){
            if(A[lo]<A[lo+1]){
                lo++;
            }else{
                hi--;
            }
        }
        return lo;
    }
}
```