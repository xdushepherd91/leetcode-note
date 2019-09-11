### 题目

[[leetcode 225]](https://leetcode-cn.com/problems/implement-stack-using-queues/) 用队列实现栈

### 描述


使用队列实现栈的下列操作：

push(x) -- 元素 x 入栈
pop() -- 移除栈顶元素
top() -- 获取栈顶元素
empty() -- 返回栈是否为空
注意:

你只能使用队列的基本操作-- 也就是 push to back, peek/pop from front, size, 和 is empty 这些操作是合法的。
你所使用的语言也许不支持队列。 你可以使用 list 或者 deque（双端队列）来模拟一个队列 , 只要是标准的队列操作即可。
你可以假设所有操作都是有效的（例如, 对一个空的栈不会调用 pop 或者 top 操作）。


### 解析

使用两个队列，一个main，一个slave
1. 入队直接入队。记录top。
2. 出队的时候，比较麻烦。
   1. 判断栈是否为空，为空这里返回-1。题目中未作要求。
   2. 栈不为空，那么将main队列中的前n-1个数据出队到slave队列中去。同时记录下最后一个出队值作为top值。
   3. 将slave和main引用进行交换，保证下次的出队操作依然从main进行。

### 实现

```java
class MyStack {

    Deque<Integer> main = new ArrayDeque();
    Deque<Integer> slave = new ArrayDeque();
    int top=0;
    /** Initialize your data structure here. */
    public MyStack() {
        
    }
    
    /** Push element x onto stack. */
    public void push(int x) {
        top=x;
        main.add(x);
    }
    
    /** Removes the element on top of the stack and returns that element. */
    public int pop() {
        if(empty()) return -1;
        while(main.size()>1){
            top = main.remove();
            slave.add(top);
        }
        Deque temp = slave;
        slave = main;
        main = temp;
        return slave.remove();
    }
    
    /** Get the top element. */
    public int top() {
        if(empty()) return -1;
        return top;
    }
    
    /** Returns whether the stack is empty. */
    public boolean empty() {
        return main.isEmpty();
    }
}

/**
 * Your MyStack object will be instantiated and called as such:
 * MyStack obj = new MyStack();
 * obj.push(x);
 * int param_2 = obj.pop();
 * int param_3 = obj.top();
 * boolean param_4 = obj.empty();
 */
```