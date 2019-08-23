#/bin/sh


cat > ./note/leetcode-$1.md << EOF
### 题目

[[leetcode $1]]($3) $2

### 描述

### 解析

### 实现

EOF

echo -e "[leetcode-$1](./note/leetcode-$1.md) $2  " >> README.md

