### 题目

[[leetcode 762]](https://leetcode-cn.com/problems/prime-number-of-set-bits-in-binary-representation/) 二进制表示中质数个计算置位

### 描述

给定两个整数 L 和 R ，找到闭区间 [L, R] 范围内，计算置位位数为质数的整数个数。

（注意，计算置位代表二进制表示中1的个数。例如 21 的二进制表示 10101 有 3 个计算置位。还有，1 不是质数。）

````
示例 1:

输入: L = 6, R = 10
输出: 4
解释:
6 -> 110 (2 个计算置位，2 是质数)
7 -> 111 (3 个计算置位，3 是质数)
9 -> 1001 (2 个计算置位，2 是质数)
10-> 1010 (2 个计算置位，2 是质数)
示例 2:

输入: L = 10, R = 15
输出: 5
解释:
10 -> 1010 (2 个计算置位, 2 是质数)
11 -> 1011 (3 个计算置位, 3 是质数)
12 -> 1100 (2 个计算置位, 2 是质数)
13 -> 1101 (3 个计算置位, 3 是质数)
14 -> 1110 (3 个计算置位, 3 是质数)
15 -> 1111 (4 个计算置位, 4 不是质数)
````

### 解析

题目简单

1. 计算每个数的1的个数。 n!=0时，n=n&n-1的次数即n中1的个数

2. 计算每个数是否为质数。 注意0和1既不是质数也不是合数。

### 实现

```java
class Solution {
    public int countPrimeSetBits(int L, int R) {
        int result=0;
        while(L<=R){
           int num = calculateNumOfOne(L++);
            if(isPrimeNumber(num)){
                result++;
            }
        }
        return result;
    }
    
    public int calculateNumOfOne(int num){
        int count = 0;
        while(num!=0){
            num = num & num-1;
            count++;
        }
        return count;
    }
    
    public boolean isPrimeNumber(int num){
        if(num < 2) return false;
        int i =2;
        while(i<num){
            if(num%i++==0){
                return false;
            }
        }
        return true;
    }
}
```