### 题目

[[leetcode 693]](https://leetcode-cn.com/problems/binary-number-with-alternating-bits/) 交替位二进制数

### 描述
给定一个正整数，检查他是否为交替位二进制数：换句话说，就是他的二进制数相邻的两个位数永不相等。

````
示例 1:

输入: 5
输出: True
解释:
5的二进制数是: 101
示例 2:

输入: 7
输出: False
解释:
7的二进制数是: 111
示例 3:

输入: 11
输出: False
解释:
11的二进制数是: 1011
 示例 4:

输入: 10
输出: True
解释:
10的二进制数是: 1010
````

### 解析

1. 用1和数字n进行按位与操作，记录得到的结果prev
2. 循环对n进行右移一位操作得到结果和1进行按位与操作得到结果cur
3. prev==cur，说明n有两位相邻的位数值相同，返回false
4. 循环在n==0时结束。
5. 返回ture。

### 实现

```java
class Solution {
    public boolean hasAlternatingBits(int n) {
        int prev = n & 1;
        while(n != 0){
            n >>= 1;
            int cur = n & 1;
            if(cur == prev){
                return false;
            }
            prev = cur;
        }
        return true;
    }
}
```