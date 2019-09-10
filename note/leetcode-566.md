### 题目

[[leetcode 566]](https://leetcode-cn.com/problems/reshape-the-matrix/submissions/) 重塑矩阵

### 描述

在MATLAB中，有一个非常有用的函数 reshape，它可以将一个矩阵重塑为另一个大小不同的新矩阵，但保留其原始数据。

给出一个由二维数组表示的矩阵，以及两个正整数r和c，分别表示想要的重构的矩阵的行数和列数。

重构后的矩阵需要将原始矩阵的所有元素以相同的行遍历顺序填充。

如果具有给定参数的reshape操作是可行且合理的，则输出新的重塑矩阵；否则，输出原始矩阵。

````
示例 1:

输入: 
nums = 
[[1,2],
 [3,4]]
r = 1, c = 4
输出: 
[[1,2,3,4]]
解释:
行遍历nums的结果是 [1,2,3,4]。新的矩阵是 1 * 4 矩阵, 用之前的元素值一行一行填充新矩阵。
示例 2:

输入: 
nums = 
[[1,2],
 [3,4]]
r = 2, c = 4
输出: 
[[1,2],
 [3,4]]
解释:
没有办法将 2 * 2 矩阵转化为 2 * 4 矩阵。 所以输出原矩阵。
````

### 解析

1. 计算矩阵的总数据量于r*c是否相等，不相等，直接返回原数组。
2. 将原数组的数据按照一行一行的数据赋值到新数组的对应位置。
3. 由于c相等，那么我们可以根据每个数据的下标对c分别取余和取模得到其在新数组中的r和c。这里数据在原数组中的下标可以使用一个指针来记录。


### 实现

```java
class Solution {
    public int[][] matrixReshape(int[][] nums, int r, int c) {
        int total = nums.length*nums[0].length;
        if(total !=r*c) return nums;       
        int[][] result = new int[r][c];     
        int index = 0;
        for(int[] num : nums){
            for(int n: num){
                result[index/c][index%c] = n;
                index++;
            }
        }
        
        return result;
    }
}
```