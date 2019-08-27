### 题目

[[leetcode 977]](https://leetcode-cn.com/problems/squares-of-a-sorted-array/submissions/) 有序数组的平方

### 描述

给定一个按非递减顺序排序的整数数组 A，返回每个数字的平方组成的新数组，要求也按非递减顺序排序。

#### 示例1

````
输入：[-4,-1,0,3,10]
输出：[0,1,9,16,100]
````

#### 示例2

````
输入：[-7,-3,2,3,11]
输出：[4,9,9,49,121]
````

### 解析

想使用桶排序偷懒，结果超过内存限制，失败。

这里我们来思考一下题目，本身是非递减的数组。如果所有数字都是正数，那么我们可以直接平方，对应下标输出就可以了。  
但是负数进来之后，就出现了问题。  
我们解决问题的时候，能抓住题目多一个特征，就能减少计算工作量。这里我们发现非递减的的负数序列在平方后必然变成递减序列。那么其逆序序列必然是非递减的。  
所以我们找到输入数组的正负分界线，然后对分界线两边的数据进行平方计算之后，进行类似归并排序的操作，就可以重新形成一个非递减的序列。

### 实现

```java
class Solution {
    public int[] sortedSquares(int[] A) {
        int length = A.length;
        int[] result = new int[A.length];
        int j=0,t=0;
        while(j<length && A[j]<0){
            j++;
        }
        int i=j-1;
        
        while(i>=0&&j<length){
            if(A[i]*A[i]<A[j]*A[j]){
                result[t++] = A[i]*A[i];
                i--;
            }else{
                result[t++] = A[j]*A[j];
                j++;
            }
        }
        while(j<length){
            result[t++] = A[j]*A[j];
            j++;    
        }
        while(i>=0){           
            result[t++] = A[i]*A[i];
            i--;
        }
        return result;
    }
}
```
