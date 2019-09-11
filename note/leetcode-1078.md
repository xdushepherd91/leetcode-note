### 题目

[[leetcode 1078]](https://leetcode-cn.com/problems/occurrences-after-bigram/) Bigram分词

### 描述
给出第一个词 first 和第二个词 second，考虑在某些文本 text 中可能以 "first second third" 形式出现的情况，其中 second 紧随 first 出现，third 紧随 second 出现。

对于每种这样的情况，将第三个词 "third" 添加到答案中，并返回答案。

 

示例 1：

输入：text = "alice is a good girl she is a good student", first = "a", second = "good"
输出：["girl","student"]
示例 2：

输入：text = "we will we will rock you", first = "we", second = "will"
输出：["we","rock"]
 

提示：

1 <= text.length <= 1000
text 由一些用空格分隔的单词组成，每个单词都由小写英文字母组成
1 <= first.length, second.length <= 10
first 和 second 由小写英文字母组成

### 解析

没有什么技巧。
1. 将text按照空格切分成字符串数组。
2. 匹配。成功加入list。
3. list转换为array。

### 实现

```java
class Solution {
    public String[] findOcurrences(String text, String first, String second) {
        List<String> list = new ArrayList();
        String[] tarray = text.split(" ");
        int length = tarray.length;
        for(int i = 0;i<length-2;i++){
            if(tarray[i].equals(first) && tarray[i+1].equals(second) ){
                list.add(tarray[i+2]);
            }
        }
        return list.toArray(new String[list.size()]);
    }
}
```
