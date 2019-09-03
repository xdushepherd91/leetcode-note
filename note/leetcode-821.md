### 题目

[[leetcode 821]](https://leetcode-cn.com/problems/shortest-distance-to-a-character/submissions/) 字符的最短距离

### 描述

给定一个字符串 S 和一个字符 C。返回一个代表字符串 S 中每个字符到字符串 S 中的字符 C 的最短距离的数组。

示例 1:

````
输入: S = "loveleetcode", C = 'e'
输出: [3, 2, 1, 0, 1, 0, 0, 1, 2, 2, 1, 0]
````


### 解析

1. 假设只有一个匹配字符，那么，我们可以通过两次字符串遍历计算出最短距离。
   1. 从左到左，用字符位置下标减去每个位置下标即可得到目标字符右边的所有下标的距离
   2. 从右到左，用每个位置的下标减去目标字符的下标即可得到目标字符左边所有下边的距离
2. 假设有两个匹配字符，同理。
   1. 从左到右边，计算出第一个匹配字符右边的所有字符到匹配字符的距离。
   2. 从右到左，计算出每个字符到匹配字符的距离。
   3. 特殊情况1讨论，从左到右，无法计算出第一个字符左边的距离，但是从右到左的时候可以，同理第二个字符的右侧距离也可以算出来
   4. 特殊情况2讨论，在两个字符之间的距离，两次都可以算到，那么我们只需要在第二次计算的时候选一个小的值记录下来即可
3. 推而广之
   有n个匹配字符的计算方法也一样

### 实现

```java
class Solution {
    public int[] shortestToChar(String S, char C) {
        int[] result = new int[S.length()];
        int length = S.length();
        int first=Integer.MIN_VALUE/2;
        for(int i=0;i<length;i++){
            if(S.charAt(i)==C){
                first=i;
            }
            result[i] = i-first;
        }
        first = Integer.MAX_VALUE/2;
        for(int i=length-1;i>=0;i--){
            if(S.charAt(i)==C){
                first=i;
            }
            result[i] = Math.min(result[i],first-i);
        }
        
        return result;
    }
}
```