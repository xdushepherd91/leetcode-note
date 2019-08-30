### 题目

[[leetcode 344]](https://leetcode-cn.com/problems/reverse-string/solution/) 翻转字符串

### 描述

编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。

不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。

#### 示例1

````
输入：["h","e","l","l","o"]
输出：["o","l","l","e","h"]
````

#### 示例2

````
输入：["H","a","n","n","a","h"]
输出：["h","a","n","n","a","H"]
````

### 解析

1. 我们需要对每个下标为i的字符和每个下标为length-1-i的字符进行调换。
2. 在不增加内存的基础上，我们可以参考数字钟原地置换的方式进行原地置换。

### 实现

#### 实现1

```java
class Solution {
    public void reverseString(char[] s) {
        int length = s.length;
        for(int i=0;i<length/2;i++){
            s[i] =(char) (s[i]+s[length-1-i]);
            s[length-1-i] =(char) (s[i]-s[length-1-i]);
            s[i] = (char)(s[i] - s[length-i-1]);
        }
    }
}
````

#### 实现2

```java
class Solution {
    public void reverseString(char[] s) {
        int length = s.length,j=length-1;
        
        for(int i=0;i<length/2;i++){
            char tmp = s[i];
            s[i] = s[j];
            s[j--] = tmp;
        }
    }
}
```


