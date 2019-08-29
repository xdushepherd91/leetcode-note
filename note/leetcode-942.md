### 题目

[[leetcode 942]](https://leetcode-cn.com/problems/di-string-match/submissions/) 增减字符串匹配

### 描述

````
给定只含 "I"（增大）或 "D"（减小）的字符串 S ，令 N = S.length。

返回 [0, 1, ..., N] 的任意排列 A 使得对于所有 i = 0, ..., N-1，都有：

如果 S[i] == "I"，那么 A[i] < A[i+1]
如果 S[i] == "D"，那么 A[i] > A[i+1]


````

### 解析

所有的I按照递增顺序填写
所有的D按照递减顺序填写

### 实现

```java
class Solution {
    public int[] diStringMatch(String S) {
        int length = S.length(),lo=0,hi=length;
        int result[] = new int[length+1];
        for(int i=0;i<length;i++){
            if(S.charAt(i)=='I'){
                result[i] = lo++;
                
            }else{
                result[i] = hi--;
            }
        }
        result[length]=lo++;
        return result;
    }
}
```