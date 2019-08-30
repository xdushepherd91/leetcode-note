### 题目

[[leetcode 905]](https://leetcode-cn.com/problems/sort-array-by-parity/submissions/) 按奇偶排序数组

### 描述

给定一个非负整数数组 A，返回一个数组，在该数组中， A 的所有偶数元素之后跟着所有奇数元素。

你可以返回满足此条件的任何数组作为答案。

##### 示例

````
输入：[3,1,2,4]
输出：[2,4,3,1]
输出 [4,2,3,1]，[2,4,1,3] 和 [4,2,1,3] 也会被接受。
````

### 解析

方法一：直接新建一个数组对元数组进行两次遍历，先把偶数全部拿出来，再把奇数全部拿过来
方法二：头尾各一个指针，头指针遇到奇数停止，尾指针遇到偶数停止，交换后，继续循环。类似快排。

### 实现

#### 实现1

```java
class Solution {
    public int[] sortArrayByParity(int[] A) {
               int[] ans = new int[A.length];
        int t = 0;

        for (int i = 0; i < A.length; ++i)
            if (A[i] % 2 == 0)
                ans[t++] = A[i];

        for (int i = 0; i < A.length; ++i)
            if (A[i] % 2 == 1)
                ans[t++] = A[i];

        return ans;
    }
    
}
```

#### 实现2

```java

class Solution {
    public int[] sortArrayByParity(int[] A) {
        int length = A.length,lo=0,hi=length-1;
        while(true){
            while(lo <length-1 && A[lo]%2==0){
                lo++;
            }
            while(hi>0 && A[hi]%2!=0){
                hi--;
            }
            
            if(lo==length-1||hi==0) break;
            if(lo>hi){
                break;
            }
            swap(A,lo,hi);
            
        }
        return A;
    }
    
    public void swap(int[] a,int i,int j){
        a[i] = a[i]+a[j];
        a[j] = a[i]-a[j];
        a[i] = a[i]-a[j];
    }
}

```


