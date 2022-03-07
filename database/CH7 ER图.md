# CH7 ER图

[toc]



## design process

1. 第一个阶段是完整刻画未来数据库用户的数据需求
2. **概念设计阶段**选择数据模型
3. 完整的概念模式还指明企业的功能需求。在功能需求规格说明（specification of functional requirement），用户描述将在数据上进行的各类操作**（事务）**
4. 从抽象数据模型到数据库实现
5. 逻辑设计logical design
6. 物理设计physical design

## design approaches

+ ER图
+ 规范化理论

## 建模

+ ER数据模型的提出旨在方便数据库的设计，它是通过允许定义代表数据库全局逻辑结构的企业模式实现的
+ ER模型在将现实世界企业的含义和交互 映射到概念模型上非常有用

### 三个概念

+ 实体集
+ 联系集
+ 属性

## 实体集 Entity set

+ Entity是现实生活中区别于其他对象的事务
+ entity set是类型属性相同的实体的集合
+ 实体由一组属性表示；即描述性属性。实体集的所有成员都拥有。
  + `insrtructor=(ID, name, street, city, salary)`
  + `course=(course_id, title, credits)`
+ 实体集属性的一个子集构成primary key，唯一标识（uniquely identify）集合中的成员

![image-20220228122444289](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/0b33b90c8fdbc2003235455c123c1684-image-20220228122444289-81c67c.png)

## 关系集 Relationship set

Relationship是若干实体之间的联系

![image-20220228125343864](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/eda0aef2b9fbb0fd67180c6c57ee5fc4-image-20220228125343864-0b0e3f.png)

### 例子 advisor

![image-20220228125609583](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/2d4c41f04d70c976db51f9eadd2006f7-image-20220228125609583-67a8f9.png)

### 描述性属性 descriptive attribute

+ 属性也可以和联系集相关联
+ 比如，advisor有一个时间

![image-20220228130643974](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/2c398775c3b8b3ec3cdd50cf7e499656-image-20220228130643974-2a4967.png)

### degree of relationship set 联系集的度

#### 二元关系 binary relationship

涉及两个实体集的联系集

#### 度>2的联系，一般联系都是二元的



### 映射基数 mapping cardinality

表示一个实体通过一个联系集能关联的实体的个数

**对于二元联系**，**一定是如下**

+ 一对一
  + ![image-20220228151941668](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/0b7208f9562f5170c53d8b8569b50d23-image-20220228151941668-0b2d51.png)
+ 一对多
  + ![image-20220228152524929](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/d101f307408aae9a07927c59ca958e11-image-20220228152524929-ff024f.png)
+ 多对一
  + ![image-20220228152729154](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/2faf7b58b909f0362fe6c1db5b55a67c-image-20220228152729154-db2c4c.png)
+ 多对多
  + ![image-20220228152738712](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/6ac9d8d1edddbafd124d2b40323184e4-image-20220228152738712-08453e.png)

## 复杂属性

### 简单simple和复合compsite属性



### 单值single和多值multivalued属性



### 派生derived属性



## 冗余属性

## 弱实体集

+ 考虑section，由 <u>course_id, semester, year 和 sec_id</u>唯一标识
+ 显然，section实体与course实体相关，假设我们创建一个sec_course联系来联系section和course

弱实体集的存在依赖于另一个实体（**标识 identifying**）或**属主实体集owner entity set**。

**我们使用标识实体和额外属性**（discriminator 分辨符）来唯一标识弱实体，非弱实体集叫强实体集

> section的分辨符是sec_id、year和semester

### existence dependent

弱实体集存在依赖于**标识实体集**

**标识实体集**拥有（**own**）弱实体集

# ER图

## 实体集

+ 矩形代表实体集
+ 矩形中列出属性
+ 下划线指出主码

![image-20220228165449723](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/15127dfe28cd112a87bd1e624a7a6f77-image-20220228165449723-0021a3.png)

## 联系集

### 菱形代表联系集

![image-20220228165554293](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/26f631a64f81ab54fd8f757981e37ece-image-20220228165554293-c8452f.png)

### 描述性属性

![image-20220228165616876](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/e866a9f43bedfa87790c376c29e776ac-image-20220228165616876-f9e0ee.png)

## 角色role

![image-20220228170109095](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/5b44ac5de3bb72fbb8a17db8cbc641b9-image-20220228170109095-0e6ed9.png)

## 映射基数cardinality constraints

![image-20220228170647211](/Users/chentong/Library/Application Support/typora-user-images/image-20220228170647280.png)

### 全部和部分参与 total and partial participation

### 全部参与 total participation

![image-20220228174106661](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/f5ea304afda2fbab14484accadb82609-image-20220228174106661-7fc1a7.png)

每个学生都必须有一个instructor

### 部分参与partial participation

某些实体可能没有参与联系集中的所有联系

![image-20220228174444905](/Users/chentong/Library/Application Support/typora-user-images/image-20220228174444905.png)

有些instructor没有参与advisor

## 复杂属性的表示

instructor

+ <u>ID</u>
+ **name** —— 复合属性
  + **frist_name**
  + **middle_initial**
  + **last_name**
+ **address** ——复合属性
  + **street**
    + **street_number**
    + **street_name**
    + **apt_number**
  + **city**
  + **state**
  + **zip**
+ **{phone_number}** ——多值属性
+ date_of_birth
+ **age**()——派生属性

### 弱实体集

+ ER图中，用双矩形表示weak entity set
+ 分辨符（discriminator）用虚线下划线标出
+ 联系集用双菱形标出

![image-20220228212401922](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/e392081015cccbbca70ac40539b06af7-image-20220228212401922-fa3f5b.png)

![image-20220228212602493](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/37f5b0f98f7fb1da5356f83f3888f52f-image-20220228212602493-62d006.png)

## 简化为关系模式

+ 实体集和关系集可以统一表示为表示数据库内容的关系模式。
+ 一个符合ER图的数据库可以由模式的集合表示
+ 对于每个实体集和联系集，都有唯一的模式对应
+ 每个模式有多个列，每个列有唯一的名字

## reduction——表示实体集

+ Strong entity set reduces to a schema whith the same attribute

  强实体集变成模式时属性名不变

  student(<u>ID</u>, name, tot_cred)

+ Weak entity set 变成一个表，包含标识强实体集的主键和分辨符

  section(<u>course_id, sec_id, sem, year)</u>

## 复杂属性

+ 复合属性：为每个子属性创建独立的属性<img src="/Users/chentong/Library/Application Support/typora-user-images/image-20220228215856541.png" alt="image-20220228215856541" style="zoom: 33%;" />

+ 多值属性：对于多值属性M，实体集中不包含该属性，构建关系模式R，该模式包含一个对应于M的属性A。

  instructor_phone(**<u>ID, phone_number</u>**)

## 映射

### 一对多和多对一联系集

many side是total participation的情况下，直接在many side添加one side的主码

![image-20220228222505710](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/9390abf254b22c1dd40ef6d2560a9c95-image-20220228222505710-38ada4.png)

instructor(<u>ID</u>, name, salary, dept_name)

### 对于一对一联系

任何一边可以作为many side

### 弱实体集

![image-20220228225555995](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/19b370a57b81b900c5523d6e093fc6e7-image-20220228225555995-eef736.png)

section(<u>course_id, sec_id, semester, year</u>)

### n元联系集

**以三元联系集为例**

+ 最多一个箭头
+ 如果超过一个箭头则有多重解释











































