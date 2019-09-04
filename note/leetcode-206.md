### 题目

[[leetcode 206]](https://leetcode-cn.com/problems/reverse-linked-list/solution/fan-zhuan-lian-biao-by-leetcode/) 反转链表

### 描述

反转一个单链表。

示例:

````
输入: 1->2->3->4->5->NULL
输出: 5->4->3->2->1->NULL
````

### 解析

在单链表反转的过程中，注意，我们需要保存当前节点的前一个节点和下一个节点的引用。另外需要注意边界。

1. 循环法。每次暂存当前节点的next节点，然后将next节点设置为前一个节点，将暂存的next节点设置为当前节点，循环执行，直到当前节点为null。那么最后一个prev节点即新的头结点

2. 迭代法1。每次迭代传入current和prev节点，如果current为null，则迭代结束，将prev节点设置为head节点即可。

3. 迭代法2。该方法可以假设我们对迭代法的理解。
    首先，在每次迭代的时候判断current节点是否为null，current.next是否为null。为null的话返回current节点。
    其次，首先进行迭代，每次传入current.next，注意，翻转的工作延后再做，因为每次迭代就记录了链表中的一个节点，这是一个局部变量。
    最后，记录下最后一个迭代的返回节点，即为新的头结点
    在迭代之后进行每个迭代内部的翻转工作。


### 实现

#### 实现1

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    private ListNode first=null;
    public ListNode reverseList(ListNode head) {
        if(head==null) return null;
        reverse(null,head);
        return first;
    }
    
    public void reverse(ListNode prev,ListNode current){
        if(current==null) {
            first = prev;
            return;
        }
        ListNode next = current.next;
        current.next = prev;
        reverse(current,next);
    }
}
```
#### 实现2

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
        if(head == null || head.next == null) return head;
        ListNode prev=null,current=head;
        while(current !=null){
            ListNode temp = current.next;
            current.next = prev;
            prev = current;
            current = temp;
        }
        
        return prev;
        
    }
    
}
```

#### 实现3

```java
/**
 * Definition for singly-linked list.
 * public class ListNode {
 *     int val;
 *     ListNode next;
 *     ListNode(int x) { val = x; }
 * }
 */
class Solution {
    public ListNode reverseList(ListNode head) {
        if(head == null || head.next == null) return head;
        ListNode p = reverseList(head.next);
        head.next.next = head;
        head.next = null;
        
        return p;
    }
    
}
```         
