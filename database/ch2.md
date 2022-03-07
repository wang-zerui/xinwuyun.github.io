# 第二章 关系模型

[toc]

![image-20220223133244987](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/b52b4acc8fb21aaac53af8ed68461710-image-20220223133244987-510a38.png)

## 一、Structure of relational database

### 关系数据库的结构

关系数据库由**表**的集合组成，每个表有唯一的名字。

**关系——表**

**元组——行**

**属性——列**

关系实例——一个关系的特定实例

域——属性的取值范围

### 数据库模式

需要区分**数据库模式**和**数据库实例（database）**

前者是数据库的逻辑设计，后者是给定时刻数据库中数据的一个快照。

**关系实例**的内容经常变化，**关系模式**不经常变化。

### 码keys

一个元组的属性值必须能够*唯一*区分元组。

> 一个关系中没有两个元组在所有属性上取值相同

#### 超码 superkey

**一个或多个属性的集合**，这些属性的组合可以使我们在一个关系中唯一地确定一个元组。

形式化描述：设R表示关系r模式中的属性集合，如果R的一个子集K是r的一个***超码***，则关系r中任意两个不同元组不会在K的所有属性上取值完全相等。

> 超码中可能包含无关紧要的属性。如果**K**是一个超码，则K的任意超集也是超码。
>
> 最小超码称为**候选码 candidate key**，他们的任意真子集

#### 主码 primary key

表示被数据库设计者选中，用来在关系中区分不同元组的候选码。

#### 外码 foreign key

一个关系模式$r_1$可能在它的属性中包括另一个关系模式$r_2$的主码。

关系$r_1$也称为外码依赖的**参照关系**（referencing realtion），$r_2$称为外码的被参照关系（referenced relation）。

#### 参照完整性 referential integrity constraint

要求在参照关系任意元组在特定属性上的取值必然等于被参照关系中某个元组在特定属性上的取值

## 二、关系查询语言

**查询语言（query language）**是用户用来从数据库中请求获取信息的语言。查询语言可以分为过程化和非过程化的

### 过程化语言（procedural language）

用户指导系统对数据库执行一系列操作以计算出所需结果。

### 非过程化语言（nonprocedural language）

用户只需描述所需信息，不用给出获取该信息的具体过程

![image-20220223232152007](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/3e4a24887901f02fa81bb56ae1970087-image-20220223232152007-86a408.png)

## 三、关系运算

关系运算是**过程化语言**，有如下6个运算

+ select（选择）：$\sigma$
+ project（投影）：$\pi$
+ union（并）：$\cup$
+ set difference（集合差）：$-$
+ cartesian product（笛卡尔积）：$\times$
+ rename：$\rho$

### select 选择

$\sigma_{p}(r)$

$p$是选择谓词

![image-20220224001555334](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/7f21a292d81ddce3491a4908d4f1fe8b-image-20220224001555334-eae6bf.png)
$$
\sigma_{p}(r)=\{t \mid t \in r \text { and } p(t)\}
$$

### project 投影

![image-20220224001751671](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/640577bd8bc29c9c0f8e13510152abd1-image-20220224001751671-c54500.png)

### Union并

按行并

+ r和s必须有相同的属性
+ 属性的domain必须是compatible可兼容的

![image-20220224001850289](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/c5c139ddfe1fdb52ce67e90b4f648204-image-20220224001850289-32f169.png)

### 笛卡尔积

$r\times s$

![image-20220224002452486](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/58c008f9a15da14e31d91df52abf7a51-image-20220224002452486-088857.png)



### $\rho$

![image-20220224002705260](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/f90efbb45c52464a52c2e86556f90f65-image-20220224002705260-21d0dd.png)

## 四、例子

![image-20220224002733334](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/a6330970e6b4d1213889f691194e2ffd-image-20220224002733334-0cbec2.png)

![image-20220224002826628](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/da98eaa943eb37cd4f0a9940c2629746-image-20220224002826628-ae263e.png)

![image-20220224002834534](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/96943312766d7b73a267542361c3e4da-image-20220224002834534-761ff8.png)

![image-20220224002843178](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/c39a551079e6ce4ea074d0c9a43d8eb6-image-20220224002843178-8678af.png)

![image-20220224002853235](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/d1fa26ee3b202897d79bd69dbf2d3cb4-image-20220224002853235-01b819.png)

## 五、额外操作符

+ set intersection（集合交）
+ natural join（自然连接）
+ division（除法）

### 集合交 

与union同等级
$$
r \cap S=\{t \mid t \in r \wedge t \in S\}
r \cap s=r-(r-s)$
$$


### 连接

![image-20220224004547985](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/61e4fe1f68c0536be65c907c8bef443f-image-20220224004547985-5102a7.png)

![img](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/8bc72b05a4812c6da5819b39c4c1b2e9-sql-join-fe9a8b.png)

![image-20220224004425376](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/10b737373921f4c85c076bde4afc6f83-image-20220224004425376-63062a.png)

![image-20220224005653511](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/a46b9d89d7344135c36bdbdd89657d5c-image-20220224005653511-0627f2.png)

![image-20220224010333906](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/5391e5cf692650c4564d2fbf0c084668-image-20220224010333906-deba56.png)

![image-20220224010440634](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/5184b5735b086c8e86950a302b9a51d8-image-20220224010440634-e58c8e.png)

![image-20220224010451477](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/24/3186055cadb71eef0ef2d6a0e03b0550-image-20220224010451477-2acb5a.png)













