### 题目

[[leetcode 1122]](https://leetcode-cn.com/problems/relative-sort-array/submissions/) 数组的相对排序

### 描述

给你两个数组，arr1 和 arr2，

arr2 中的元素各不相同
arr2 中的每个元素都出现在 arr1 中
对 arr1 中的元素进行排序，使 arr1 中项的相对顺序和 arr2 中的相对顺序相同。未在 arr2 中出现过的元素需要按照升序放在 arr1 的末尾。


示例：

输入：arr1 = [2,3,1,3,2,4,6,7,9,2,19], arr2 = [2,1,4,3,9,6]
输出：[2,2,2,1,4,3,3,9,6,7,19]
 

提示：

arr1.length, arr2.length <= 1000
0 <= arr1[i], arr2[i] <= 1000
arr2 中的元素 arr2[i] 各不相同
arr2 中的每个元素 arr2[i] 都出现在 arr1 中

### 解析

1. 由于arr1的尾部是排序的，我们需要选择一个排序算法进行排序，由于数组中的数值不大于1000，这里选择桶排序。
2. 对于arr1进行排序之后，遍历arr2，对于arr1中对应的数字，在结果数组中进行赋值。
3. 将结果数组中未赋值的所有下表进行赋值。



### 实现

```java
class Solution {
    public int[] relativeSortArray(int[] arr1, int[] arr2) {

        //排序
        int[] temp =  new int[1001];
        for(int a1:arr1){
            temp[a1]++;
        }
        
        //相对排序
        int i = 0;
        for(int a2:arr2){
            while(temp[a2]-->0){
                arr1[i++] = a2;
            }
        }
        //绝对排序
        int j = arr1.length-1,k=1000;
        while(j>=i){
            while(temp[k]-->0){
                arr1[j--]=k;
            }
            k--;
        }
        return arr1;
    }
}
```