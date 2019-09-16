### 题目

[[leetcode 520]](https://leetcode-cn.com/problems/detect-capital/) 检测大写字母

### 描述

给定一个单词，你需要判断单词的大写使用是否正确。

我们定义，在以下情况时，单词的大写用法是正确的：

全部字母都是大写，比如"USA"。
单词中所有字母都不是大写，比如"leetcode"。
如果单词不只含有一个字母，只有首字母大写， 比如 "Google"。
否则，我们定义这个单词没有正确使用大写字母。

示例 1:

输入: "USA"
输出: True
示例 2:

输入: "FlaG"
输出: False
注意: 输入是由大写和小写拉丁字母组成的非空单词。

### 解析

有效的单词的三种情况：
1. 全部是大写字母。
2. 首字母大写，其他字母小写。
3. 全部小写。

代码中应该为这三种情况分别声明标志变量。

注意：
如果单词的长度是0或者1，直接返回true即可
### 实现

可以看到，
一、如果首字母是大写字母，那么有两种情况满足条件：  
1. 后续字母全部是大写。  
2. 后续字母全部是小写。  
二、如果瘦子木事小写字母，那么有一种情况满足条件：  
1. 后续字母全部是小写。 

```java
class Solution {
    public boolean detectCapitalUse(String word) {
        if(word.length()<2) return true;
        boolean first=false,middle=false,all=false;
        for(int i=0;i<word.length();i++){
            if(i==0&&word.charAt(i)<'Z'+1){
                first=true;
            }
            if(i!=0&&word.charAt(i)>'a'-1){
                middle=true;
            }
            if(i!=0&&word.charAt(i)<'Z'+1){
                all=true;
            }
        }
        
        return (first&&!middle) ||(first && middle && !all) || (!first&&!all);
    }
}

```