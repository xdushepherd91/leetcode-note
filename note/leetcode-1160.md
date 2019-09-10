### 题目

[[leetcode 1160]](https://leetcode-cn.com/problems/find-words-that-can-be-formed-by-characters/) 拼写单词

### 描述

给你一份『词汇表』（字符串数组） words 和一张『字母表』（字符串） chars。

假如你可以用 chars 中的『字母』（字符）拼写出 words 中的某个『单词』（字符串），那么我们就认为你掌握了这个单词。

注意：每次拼写时，chars 中的每个字母都只能用一次。

返回词汇表 words 中你掌握的所有单词的 长度之和。

````
示例 1：

输入：words = ["cat","bt","hat","tree"], chars = "atach"
输出：6
解释： 
可以形成字符串 "cat" 和 "hat"，所以答案是 3 + 3 = 6。
示例 2：

输入：words = ["hello","world","leetcode"], chars = "welldonehoneyr"
输出：10
解释：
可以形成字符串 "hello" 和 "world"，所以答案是 5 + 5 = 10。

````

### 解析

1. 使用桶排序对字母表进行统计，a的下标为0，b的下标为1，以此类推。每个字母出现一次，就对其对应下标加1。
2. 使用桶排序对单词分别进行统计，单词中每个字母出现以此，对1中的数据进行以此减一操作。
3. 如果哪个下标小于0，说明字母表中对应的字母不够用。
4. 将所有符合条件的单词长度加和。

### 实现

#### 实现1 桶排序使用

```java
class Solution {
    public int countCharacters(String[] words, String chars) {
        int result=0;
        char[] cs = chars.toCharArray();

        for(String word : words){
            boolean flag=true;
            int[] chas = new int[26];
            for(char c : cs){
                chas[c-'a']++;
            }
            for(char c:word.toCharArray()){
                chas[c-'a']--;
                if(chas[c-'a']<0){
                    flag=false;
                }
            }
            
            if(flag){
                result+=word.length();
            }
        }
        
        return result;
    }
    
}
```
#### 实现2

```java
/**
 * Definition for a binary tree node.
 * public class TreeNode {
 *     int val;
 *     TreeNode left;
 *     TreeNode right;
 *     TreeNode(int x) { val = x; }
 * }
 */
class Solution {
    public List<Double> averageOfLevels(TreeNode root) {
        List<Double> result = new ArrayList();
        if(root==null) return result;
        Deque<TreeNode> queue = new ArrayDeque();
        queue.add(root);
        while(!queue.isEmpty()){
            int count=queue.size();
            double total=count,all=0;
            TreeNode current=null;
            while(count-->0){
                current = queue.remove();
                all+=current.val;
                if(current.left !=null) queue.add(current.left);
                if(current.right !=null) queue.add(current.right);
            }
            double r = all/total;
            result.add(r);
        }
        return result;
    }
    
}
```

