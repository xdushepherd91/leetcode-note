### 题目

[[leetcode 784]](https://leetcode-cn.com/problems/letter-case-permutation/) 字母大小写全排列

### 描述

给定一个字符串S，通过将字符串S中的每个字母转变大小写，我们可以获得一个新的字符串。返回所有可能得到的字符串集合。

示例:
输入: S = "a1b2"
输出: ["a1b2", "a1B2", "A1b2", "A1B2"]

输入: S = "3z4"
输出: ["3z4", "3Z4"]

输入: S = "12345"
输出: ["12345"]

### 解析

使用递归法，对字符串中的字符逐个进行遍历。每次遍历，判断是否需要进行字符串转换，递归分为两部分。

在递归深度恰好等于字符串长度的时候,递归结束，将字符串添加到结果列表中即可。

### 实现

```java
class Solution {
    public List<String> letterCasePermutation(String S) {
        if(S==null || S.length()==0) return new ArrayList<String>();
        List<String> result = new ArrayList<String>();
        helper(S,"",result,0);
        return result;
    }
    
    private void helper(String S,String str,List<String> result,int index){
        if(S.length()==index){
            result.add(str);
            return;
        }
        char c = S.charAt(index);
        helper(S,str+String.valueOf(c),result,index+1);
        if('a'-1<c&&c<'z'+1){
            str += String.valueOf((char)(c-32));   
            helper(S,str,result,index+1);     
        }else if('A'-1<c&&c<'Z'+1){
            str += String.valueOf((char)(c+32));
            helper(S,str,result,index+1);
        }  
    }
}
```

