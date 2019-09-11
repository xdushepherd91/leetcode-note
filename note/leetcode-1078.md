### 题目

[[leetcode 1078]](https://leetcode-cn.com/problems/occurrences-after-bigram/) Bigram分词

### 描述

### 解析

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
