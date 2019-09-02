### 题目

[[leetcode 171]](https://leetcode-cn.com/problems/excel-sheet-column-number/) Excel表格序列号

### 描述

给定一个Excel表格中的列名称，返回其相应的列序号。

例如，
````
   A -> 1
    B -> 2
    C -> 3
    ...
    Z -> 26
    AA -> 27
    AB -> 28 
    ...

````
#### 示例

````
输入: "A"
输出: 1

输入: "AB"
输出: 28

输入: "ZY"
输出: 701
````


### 解析

从示例可以看出来，这是简单的进制转换问题。到这一步基本上问题就解决了。有几点需要注意

1. 这里的基准值是A,我们使用A的ASCII码减去1作为基准值。
2. 进制单位为26。

### 实现

```java
class Solution {
    public int titleToNumber(String s) {
        int index=0,length = s.length(),result=0;
        int base = 'A'-1;
        while(index<length){
            result = result*26 + s.charAt(index++)-base;
        }
        
        return result;
    }
}
```

