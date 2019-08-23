### 题目

[[237]](https://leetcode-cn.com/problems/delete-node-in-a-linked-list/submissions/) 删除链表中的节点

### 描述

请编写一个函数，使其可以删除某个链表中给定的（非末尾）节点，你将只被给定要求被删除的节点。现有一个链表 -- head = [4,5,1,9]，它可以表示为:
4->5->1->9

##### 示例1

````
输入: head = [4,5,1,9], node = 5
输出: [4,1,9]
解释: 给定你链表中值为 5 的第二个节点，那么在调用了你的函数之后，该链表应变为 4 -> 1 -> 9.
````
##### 示例2

````
输入: head = [4,5,1,9], node = 1
输出: [4,5,9]
解释: 给定你链表中值为 1 的第三个节点，那么在调用了你的函数之后，该链表应变为 4 -> 5 -> 9.

````
##### 说明
````
链表至少包含两个节点。
链表中所有节点的值都是唯一的。
给定的节点为非末尾节点并且一定是链表中的一个有效节点。
不要从你的函数中返回任何结果。
````

### 解析

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
    public void deleteNode(ListNode node) {

          }
    }
}
```

如上是leetcode官网中给出的基本代码，仅仅给出了需要删除的节点，**并没有**给出链表的头结点。那么我们怎么删除？

参考数组中删除一个中间元素，我们需要将之后的元素统一前移，这里我们也一样。

1. 把需要删除节点的下一个节点的值赋给需要删除的节点
2. 将需要删除节点的下一节点的再下一个节点的值赋给将要删除的节点的下一个节点
3. 以此类推
4. 到尾结点的时候需要注意。如下，假设C为尾结点，那么我们在B的时候，就需要使用B.next.next==null来判断是否是否已经到达临界点，是的话，说明在C的值移动到B之后，B将成为新的尾结点，并且整个移动结束，循环退出
    B->C->null



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
    public void deleteNode(ListNode node) {
          while(node.next!=null){
            node.val=node.next.val;
            if(node.next.next==null){
              node.next=null;
              break;
            }
            node = node.next;
          }
    }
}
```