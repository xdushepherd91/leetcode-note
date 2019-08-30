### 题目

[[leetcode 476]](https://leetcode-cn.com/problems/number-complement/solution/c-ji-suan-gao-wei-jian-dan-wei-yun-suan-by-da-li-w/) 数字的补数

### 描述

给定一个正整数，输出它的补数。补数是对该数的二进制表示取反。

注意:

给定的整数保证在32位带符号整数的范围内。
你可以假定二进制数不包含前导零位。  
示例 1:
````
输入: 5
输出: 2
解释: 5的二进制表示为101（没有前导零位），其补数为010。所以你需要输出2。
````
示例 2:
````
输入: 1
输出: 0
解释: 1的二进制表示为1（没有前导零位），其补数为0。所以你需要输出0。
````
### 解析

1. 寻找当前数字的最高位所在位置。这里的实现比较多样。我选择使用了jdk中的一个实现。
2. 将最高位以下所有位变为1
3. 将得到的数字与原数字异或运算，得到结果

### 实现

#### 实现1

```java
class Solution {
    public int findComplement(int num) {
        int source = num;
        num = num |num>>1;
        num = num | num >>2;
        num = num | num >>4;
        num = num | num >>8;
        num = num | num >>16;
        source = num ^ source;
        return source;
    }
}
``` 