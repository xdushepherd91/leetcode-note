### 题目

[[leetcode 119]](https://leetcode-cn.com/problems/pascals-triangle-ii/) 杨辉三角

### 描述

给定一个非负索引 k，其中 k ≤ 33，返回杨辉三角的第 k 行。

在杨辉三角中，每个数是它左上方和右上方的数的和。

示例:
![杨辉三角形](../yht.gif)
输入: 3
输出: [1,3,3,1]

### 解析

递归法实现


### 实现

```java
class Solution {
    public List<Integer> getRow(int rowIndex) {
        List<Integer> result = new ArrayList();
        Map<String,Integer> book = new HashMap();
        for(int i=0;i<=rowIndex;i++){
            result.add(helper(rowIndex,i,book));
        }
        return result;
    }
    
    private int helper(int row,int column,Map<String,Integer> map){
        if(column==0){
            return 1;
        }else if(column==row){
            return 1;
        }else{
            if(map.get((row-1)+"-"+column)==null){
                String key = row-1+"-"+column;
                map.put(key,helper(row-1,column,map));
            }
            if(map.get((row-1)+"-"+(column-1))==null){
                map.put((row-1)+"-"+(column-1),helper(row-1,column-1,map));
            }
            return map.get((row-1)+"-"+column)+map.get((row-1)+"-"+(column-1));
        }
    }
}
```