### 题目

[[leetcode 1021]](https://leetcode-cn.com/problems/remove-outermost-parentheses/comments/) 删除最外层的括号

### 描述

有效括号字符串为空 ("")、"(" + A + ")" 或 A + B，其中 A 和 B 都是有效的括号字符串，+ 代表字符串的连接。例如，""，"()"，"(())()" 和 "(()(()))" 都是有效的括号字符串。

如果有效字符串 S 非空，且不存在将其拆分为 S = A+B 的方法，我们称其为原语（primitive），其中 A 和 B 都是非空有效括号字符串。

给出一个非空有效字符串 S，考虑将其进行原语化分解，使得：S = P_1 + P_2 + ... + P_k，其中 P_i 是有效括号字符串原语。

对 S 进行原语化分解，删除分解中每个原语字符串的最外层括号，返回 S 。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/remove-outermost-parentheses
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。

#### 示例1

```java
输入："(()())(())"
输出："()()()"
解释：
输入字符串为 "(()())(())"，原语化分解得到 "(()())" + "(())"，
删除每个部分中的最外层括号后得到 "()()" + "()" = "()()()"。
```

#### 示例2

```java
输入："(()())(())(()(()))"
输出："()()()()(())"
解释：
输入字符串为 "(()())(())(()(()))"，原语化分解得到 "(()())" + "(())" + "(()(()))"，
删除每隔部分中的最外层括号后得到 "()()" + "()" + "()(())" = "()()()()(())"。
```
#### 示例3

```java
输入："()()"
输出：""
解释：
输入字符串为 "()()"，原语化分解得到 "()" + "()"，
删除每个部分中的最外层括号后得到 "" + "" = ""。

```

### 解析

首先可以想到的是，将括号字符串依次放入一个栈中。入栈有如下情况：

1. 在栈为空的时候，遇到一个"(",说明该字符时一个外围括号的左括号，此时，结果队列中不需要该字符，只需要将该字符入栈即可
2. 在栈不为空时，遇到一个"(",说明该字符不是一个外围括号的左括号，此时，我们需要将该字符放入到结果队列中，同时将该字符入栈。
3. 当栈大小大于1时，每次遇到一个")"字符，我们需要将栈的最顶层字符出栈，并将")"字符放入结果队列。
4. 当栈大小正好等于1时，遇到一个")"字符，我们需要将栈清空，丢弃当前字符。




### 实现


#### 实现1
```java
class Solution {
    public String removeOuterParentheses(String S) {
        int length = S.length(),i=0;
        ArrayDeque<Character> stack = new ArrayDeque<Character>();
        StringBuilder result = new StringBuilder();
        
        while(i<length){
            if(S.charAt(i) == '('){
                if(stack.size()==0){
                    stack.push('(');
                }else{
                    stack.push('(');
                    result.append('(');
                }
            }else{
                stack.pop();
                if(stack.size()>0){
                    result.append(')');
                }
                
            }
            i++;
        }
        return result.toString();
    }
}
```
#### 实现2
```java
class Solution {
    public String removeOuterParentheses(String S) {
        int length = S.length(),i=0;
        ArrayDeque<Character> stack = new ArrayDeque<Character>();
        StringBuilder result = new StringBuilder();
        
        while(i<length){
            if(S.charAt(i) == ')'){
                if(stack.size()>1){
                    result.append(S.charAt(i));
                }
                stack.pop();
            }else{
                stack.push(S.charAt(i));
                if(stack.size()>1){
                    result.append(S.charAt(i));
                }
            }
            i++;
        }
        return result.toString();
    }
}
```
```
