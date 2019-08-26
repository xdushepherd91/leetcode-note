### 题目

[[leetcode 461]](https://leetcode-cn.com/problems/hamming-distance/) 汉明距离

### 描述

两个整数之间的汉明距离指的是这两个数字对应二进制位不同的位置的数目。

给出两个整数 x 和 y，计算它们之间的汉明距离。

#### 示例

````
输入: x = 1, y = 4

输出: 2

解释:
1   (0 0 0 1)
4   (0 1 0 0)
       ↑   ↑

上面的箭头指出了对应二进制位不同的位置。

````

### 解析

1. 首先计算出x和y中二进制位不同的数值表示result。这里很自然想到使用异或。
2. 计算步骤1中结果result里面1的个数。这里使用与运算。  
   解释: 
   1. 我们每次将result和result-1做与运算，仔细思考，这两个数值做与运算，会将result中最低位的1变为0，而其他位置的1不变。
   2. 每次执行1中操作，我们就给结果计数count加1.
   3. 知道result&result-1结果为0，就说明我们执行了count次与操作，把所有的1都消除掉了，也就是计算得到了result中1的个数。

### 实现

#### 实现1

```java
class Solution {
    public int hammingDistance(int x, int y) {
        int result = x ^ y;
        x=0;
        while(result!=0){
            result=result&(result-1);
            x++;
        }
        
        return x;
    }
}
```

#### 实现2

```java
class Solution {
    public int hammingDistance(int x, int y) {
        y ^= x;
        x=0;
        while(y!=0){
            y=y&(y-1);
            x++;
        }
        
        return x;
    }
}
``` 


