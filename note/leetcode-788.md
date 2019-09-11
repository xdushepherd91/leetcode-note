### 题目

[[leetcode 788]](https://leetcode-cn.com/problems/rotated-digits/) 旋转数字

### 描述

我们称一个数 X 为好数, 如果它的每位数字逐个地被旋转 180 度后，我们仍可以得到一个有效的，且和 X 不同的数。要求每位数字都要被旋转。

如果一个数的每位数字被旋转以后仍然还是一个数字， 则这个数是有效的。0, 1, 和 8 被旋转后仍然是它们自己；2 和 5 可以互相旋转成对方；6 和 9 同理，除了这些以外其他的数字旋转以后都不再是有效的数字。

现在我们有一个正整数 N, 计算从 1 到 N 中有多少个数 X 是好数？

示例:
输入: 10
输出: 4
解释: 
在[1, 10]中有四个好数： 2, 5, 6, 9。
注意 1 和 10 不是好数, 因为他们在旋转之后不变。
注意:

N 的取值范围是 [1, 10000]。

### 解析

解法一：


1. 我们队2到N的数字进行迭代判断。1不需要判断。
2. 如何判断好数？
   1. 必定要按照个十百千这样的位判断。这比较好实现。不断的对10取模值得到每一位的数字，不断的除以10去掉已经判断的位。
   2. 如果某一位存在3,4,7，直接返回false。
   3. 如果循环没有返回，我们需要一个标志位，标志该数字的某一位必定含有一个好数，这比较容易实现。

解法二：
对于好数的判断，还有另外一种实现方法。
0和任何数字n的或运算结果都是n。
-1和任何数字的或运算结果都是-1。
那么
1. 我们给好数的权值为任何大于1的数字。
2. 给任何非好数的权值为-1。
3. 给0,1,8这样的数字设置为0.
我们根据目标数字每个位中的数字使用1或者-1或者0去进行或操作。

1. 结果如果为0，说明目标数字中每个位置都为0,1，或者8中的任何一个，不是好数。
2. 结果如果为-1，说明目标数字中至少有一个位为非好数。不是好数。
3. 结果如果大于1，说明目标数字钟不存在非好数，且必定含有一个好数。

### 实现

#### 实现1 条件判断法

```java
class Solution {
    public int rotatedDigits(int N) {
        int result = 0;
        for(int i=2;i<=N;i++){
            if(test(i)==true){
                result++;
            }
        }
        return result;
    }
    
    private boolean test(int num){
        boolean flag=false;
        int[] map={0,0,1,-1,-1,1,1,-1,-1,1};
        while(num!=0){
            int mod = num%10;
            if(mod == 3 || mod == 4 || mod == 7){
                return false;
            }else if(mod == 2 || mod == 5 || mod == 6 || mod == 9){
                flag=true;
            }
            num /= 10;
        }
        return flag;
    }
}
```

#### 实现2 按位计数

```java
class Solution {
    public int rotatedDigits(int N) {
        int result = 0;
        for(int i=2;i<=N;i++){
            if(test(i)==true){
                result++;
            }
        }
        return result;
    }
    
    private boolean test(int num){
        int flag=0;
        int[] map={0,0,1,-1,-1,1,1,-1,0,1};
        while(num!=0){
            int mod = num%10;
            flag |=map[mod];
            num /= 10;
            
        }
        return flag>0;
    }
}
```

