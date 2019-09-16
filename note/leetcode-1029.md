### 题目

[[leetcode 1029]](https://leetcode-cn.com/problems/two-city-scheduling/) 两地调度

### 描述

公司计划面试 2N 人。第 i 人飞往 A 市的费用为 costs[i][0]，飞往 B 市的费用为 costs[i][1]。

返回将每个人都飞到某座城市的最低费用，要求每个城市都有 N 人抵达。

 

示例：

输入：[[10,20],[30,200],[400,50],[30,20]]
输出：110
解释：
第一个人去 A 市，费用为 10。
第二个人去 A 市，费用为 30。
第三个人去 B 市，费用为 50。
第四个人去 B 市，费用为 20。

最低总费用为 10 + 30 + 50 + 20 = 110，每个城市都有一半的人在面试。
 

提示：

1 <= costs.length <= 100
costs.length 为偶数
1 <= costs[i][0], costs[i][1] <= 1000

### 解析

官方解答：
1. 先让所有人都去A市。
2. 挑选N个人去B市。标准时，去B市的花费越小越好。
3. 选择出来去B是花费最小的N个人。

另一种思路。
1. 首先，我们定了一个基准。2N个人都去A市。
2. 接下来，我们需要选定N个人，去B市，原则是，要比A市的花费要越少越好。
3. 那我们接下来怎么做，在2N个人里面，选择N个人，其去B市的花费不大于去A市的花费，且与A市的差值越大越好。

### 实现

```java
class Solution {
    public int twoCitySchedCost(int[][] costs) {
         int result = 0;
         int[] diff = new int[costs.length];
         for(int i = 0;i<costs.length;i++){
             result += costs[i][0];
             diff[i] = costs[i][1]-costs[i][0];
         }
         Arrays.sort(diff);
         for(int i=0;i<costs.length/2;i++){
             result+=diff[i];
         }
        return result;
    }
}
```