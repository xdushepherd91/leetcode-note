### 题目

[[leetcode 389]](https://leetcode-cn.com/problems/find-the-difference/) 找不同

### 描述

给定两个字符串 s 和 t，它们只包含小写字母。

字符串 t 由字符串 s 随机重排，然后在随机位置添加一个字母。

请找出在 t 中被添加的字母。

 

示例:

输入：
s = "abcd"
t = "abcde"

输出：
e

解释：
'e' 是那个被添加的字母。

### 解析

1. 使用桶排序。26个字母，只需要26个桶。
2. 对两个字符串的字符分别入桶。
3. 第二个字符中桶内数字比第一个桶大就说明其添加了一个字母，返回即可。

### 实现

```java
class Solution {
    public char findTheDifference(String s, String t) {
        int[] sc = new int[26];
        int[] tc = new int[26];
        
        for(char c : s.toCharArray()){
            int index = (int)(c-'a');
            sc[index]++;
        }
        
        for(char c : t.toCharArray()){
            int index = (int)(c-'a');
            tc[index]++;
            if(tc[index]>sc[index]){
                return c;
            }
        }
        
        return '0';
    }
}
```