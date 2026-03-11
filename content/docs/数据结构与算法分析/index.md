---
weight: 999
title: "在线书籍"
description: ""
icon: "article"
date: "2025-11-03T10:59:56+08:00"
lastmod: "2025-11-03T10:59:56+08:00"
draft: false
toc: true
---
数据结构与算法分析 Java语言描述 [城通网盘](https://474b.com/f/20525574-481147221-5c3d61) [百度网盘](https://pan.baidu.com/s/135hWyCK3SssLwMmeHn4PCg) 9kk7

# BFS框架

通常用于求解最短路径问题

```java
// 计算从起点 start 到终点 target 的最近距离
int BFS(Node start, Node target) {
    Queue<Node> q; // 核心数据结构
    Set<Node> visited; // 避免走回头路
    
    q.offer(start); // 将起点加入队列
    visited.add(start);
    int step = 0; // 记录扩散的步数

    while (q not empty) {
        int sz = q.size();
        /* 将当前队列中的所有节点向四周扩散 */
        for (int i = 0; i < sz; i++) {
            Node cur = q.poll();
            /* 划重点：这里判断是否到达终点 */
            if (cur is target)
                return step;
            /* 将 cur 的相邻节点加入队列 */
            for (Node x : cur.adj())
                if (x not in visited) {
                    q.offer(x);
                    visited.add(x);
                }
        }
        /* 划重点：更新步数在这里 */
        step++;
    }
}
```

>来源：[752. 打开转盘锁 - 力扣（LeetCode）](https://leetcode.cn/problems/open-the-lock/solutions/219909/wo-xie-liao-yi-tao-bfs-suan-fa-kuang-jia-jian-dao-/)

# DFS框架

```python
result = []
def backtrack(路径, 选择列表):
    if 满足结束条件:
        result.add(路径)
        return
    
    for 选择 in 选择列表:
        # 做选择
        将该选择从选择列表移除
        路径.add(选择)
        backtrack(路径, 选择列表)
        # 撤销选择
        路径.remove(选择)
        将该选择再加入选择列表
```

## 动态规划

```python
# 自顶向下递归的动态规划
def dp(状态1, 状态2, ...):
    for 选择 in 所有可能的选择:
        # 此时的状态已经因为做了选择而改变
        result = 求最值(result, dp(状态1, 状态2, ...))
    return result

# 自底向上迭代的动态规划
# 初始化 base case
dp[0][0][...] = base case
# 进行状态转移
for 状态1 in 状态1的所有取值：
    for 状态2 in 状态2的所有取值：
        for ...
            dp[状态1][状态2][...] = 求最值(选择1，选择2...)
```



