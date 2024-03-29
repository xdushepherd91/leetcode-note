### 题目

[[leetcode 868]](https://leetcode-cn.com/problems/binary-gap/) 二进制间距

### 描述

示例 1：

输入：22
输出：2
解释：
22 的二进制是 0b10110 。
在 22 的二进制表示中，有三个 1，组成两对连续的 1 。
第一对连续的 1 中，两个 1 之间的距离为 2 。
第二对连续的 1 中，两个 1 之间的距离为 1 。
答案取两个距离之中最大的，也就是 2 。
示例 2：

输入：5
输出：2
解释：
5 的二进制是 0b101 。
示例 3：

输入：6
输出：1
解释：
6 的二进制是 0b110 。
示例 4：

输入：8
输出：0
解释：
8 的二进制是 0b1000 。
在 8 的二进制表示中没有连续的 1，所以返回 0 。
 

提示：

1 <= N <= 10^9

### 解析

问题关键，找下标。

1. 使用一个只有一位为1的数和目标数字进行与操作，如果对应位置恰好为1那么结果大于0，否则结果等于0。
2. 我们使用数字1，通过左移操作，一步步地寻找等于1的下标并记录，运算。
3. 知道右移结果大于目标数字后结束。


### 实现

```java
class Solution {
    public int binaryGap(int N) {
        int flag = 1, result=0,prev=-1,current = 0,index=0;
        while(flag<=N){
            if((flag&N)!=0){
                if(prev==-1){
                    prev=index;
                }else{
                    current = index;
                    result = Math.max(result,current-prev);
                    prev = current;
                }
            }
            index++;
            flag<<=1;
        }
        return  result;
    }
}
```