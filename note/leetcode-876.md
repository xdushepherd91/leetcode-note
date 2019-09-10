### 题目

[[leetcode 876]](https://leetcode-cn.com/problems/middle-of-the-linked-list/) 链表的中间节点

### 描述
给定一个带有头结点 head 的非空单链表，返回链表的中间结点。

如果有两个中间结点，则返回第二个中间结点。

示例 1：

输入：[1,2,3,4,5]
输出：此列表中的结点 3 (序列化形式：[3,4,5])
返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
注意，我们返回了一个 ListNode 类型的对象 ans，这样：
ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
示例 2：

输入：[1,2,3,4,5,6]
输出：此列表中的结点 4 (序列化形式：[4,5,6])
由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。


### 解析

方法一： 使用数组，返回数组中间节点。

方法二： 使用快慢指针。

1. 慢指针每次向前步进1，快指针每次向前步进2.
2. 当快指针不为null，切快指针的next节点不为null，循环接续
3. 深入探讨快指针。
   1. 当链表为奇数个时，快指针最终指向链表的最后一个节点，由于fast.next为null，循环结束。此时，slow指针在中间节点。
   2. 当链表为偶数个时，快指针最终直线链表最后一个节点的next节点，由于fast为null，循环结束。此时，slow指针在中间节点。


### 实现

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
    public ListNode middleNode(ListNode head) {
        ListNode slow=head,fast=head;
        while(fast!=null&&fast.next!=null){
            slow = slow.next;
            fast = fast.next.next;
        }
        
        return slow;
    }
}
```