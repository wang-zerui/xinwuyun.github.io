# 第一章

![image-20220222173209786](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/22/9e9d5f1a90777689cb29c9998a747aa6-image-20220222173209786-707ab2.png)

## 一、Data Models and Databases

### 抽象层次 Levels of Abstraction

+ 物理层Phsical Level：描述数据如何存储
+ 逻辑层Logical Level：描述数据库中存储什么数据以及数据间的关系。
  + **物理数据独立性（phicial data indepentdence）**
+ 视图层View Level：描述整个数据库的某个部分

![image-20220222190453469](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/22/973214002da7e1e87c2a776057823394-image-20220222190453469-de9703.png)

**例子**

定义如下记录

```sql
type instructor = record
	ID: char(5)
	name: char(20)
	dept_name: char(20)
	salary: numberic(8, 2)
	end;
```

1. **物理层**：instructor记录可能被描述为连续存储位置组成的存储块。
2. **逻辑层**：定义了这些记录类型的相互关系
   1. 程序设计人员正式在这个抽象层次上使用某种程序设计语言进行工作。
   2. 数据库管理员也是在这个抽象层次工作。
3. **视图层**：计算机用户看见的是为其**屏蔽了数据类型细节**的一组应用程序
   1. 视图层上定义了数据库的多个视图，数据库用户看到的是这些视图。
   2. 提供了防止用户访问数据库的某些部分的安全性机制

## 二、实例和模式

### 实例

特定时刻存储在数据库中的信息的集合称作数据库的一个实例。

### 模式

数据库的总体设计

#### 物理模式 physical schema

物理层描述数据库的设计

#### 逻辑模式 logical schema

在逻辑层描述数据库的设计

#### 视图层模式

有若干种，有时称为**子模式**（**subschema**）

> 描述了数据库的不同视图

> 逻辑层最重要，物理模式隐藏在逻辑模式下，通常可以轻易被更改应用程序如果不依赖与物理模式，他们就被称为具有**物理数据独立性**



## 三、数据模型 data model

1. 是一个

+ 描述数据
+ 数据联系
+ 数据语义
+ 以及一致性约束

的**概念工具**集合

**提供了一种**描述

+ 物理层
+ 逻辑层
+ 视图层

的数据库设计的方式

### 关系模型 rational model

关系模型用表的集合来表示数据和数据间的联系。

### 实体-联系模型 entity-relationship model

ER模型，基于对显示世界的这样一种认识

现实世界由一组称作**实体的基本对象**以及**这些对象间的联系**构成。实体是现实世界中可区别于

### 基于对象的数据模型 object-based model

ER模型增加了封装、方法和对象标识等概念后的扩展。

### 半结构化数据模型 semistructured data model（XML）

允许那些相同类型的数据项含有不同的属性集的数据定义。XML被广泛用来标识半结构化数据。

![image-20220222204417718](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/22/06269787ef15148c026553b0533911ed-image-20220222204417718-72f421.png)![image-20220222210007875](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/22/2de43508bb9993136ec2df69dc53af69-image-20220222210007875-5ed9fb.png)

## 四、关系数据库

关系数据库包括DML和DDL。

### 表

所有数据都存放在若干表中

![image-20220222211320787](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/22/d179a19aadce13cb14c98a3eda7a889d-image-20220222211320787-70f303.png)

### 数据操纵语言 DML Data-Manipulation Language

> DML中设计信息检索的部分称作**查询语言（query language）**。**通常把*查询语言*和*数据操纵语言*作为同义词**

非过程化的，以几个表作为输入，总是仅返回一个表。

### 数据定义语言 DDL Data-Defination Language

可以定义表、完整性约束、断言和授权等。

> 元数据：metadata，关于数据的数据。只能由数据库系统本身来访问和修改

## 五、Database Design

### 设计过程

1. 初始阶段：全面刻画预期的数据库
2. **概念设计****conceptual-design**：描述数据以及他们之间的关系
   1. ER模型
   2. 规范化算法，将所有属性集所谓输入，生成一组关系表
3. **逻辑设计阶段**：将高层的概念模型映射到要使用的数据库系统的实现数据模型上
4. **物理设计阶段**指定物理特性，包括文件组织的形式以及内部的存储结构

## 六、数据库引擎

+ 存储管理器（storage manager）
+ 查询处理器（query processing）
+ 事务管理（transaction manager）

### 存储管理器 storage manager

存储管理器在数据库中存储的底层数据与应用数据以及向系统提交的查询之间提供接口的部件；

存储管理器负责与文件管理器进行交互，原始数据通过操作系统提供的文件系统存储在磁盘上；

存储管理器将各种DML语句翻译为底层文件系统命令。

存储管理器负责数据库中数据的存储、检索和更新

+ 权限及完整性管理器
+ 事务管理器
+ 文件管理器
+ 缓冲器管理器

实现了几种数据结构

+ 数据文件：数据库自身
+ 数据字典：关于数据库结构的元数据，尤其是数据库模式
+ 索引：针对数据项的快速访问

### 查询处理器

+ **DDL解释器（DDL interpreter）**，解释DDL语句并将这些定义记录在数据字典里
+ **DML编译器（DMLcompiler）**，将查询语言中的DML语句翻译为一个执行方案，包括一系列查询执行引擎能理解的低级指令

一个查询通常可被翻译成多中等价的具有相同结果的执行方案的一种，DML编译器还进行**查询优化**，从几种选择汇总选出代价最小的一种

+ **查询执行引擎（query evaluation engine）**，执行由DML编译器产生的低级指令。

### 事务管理

+ **原子性 atomicity**
+ **一致性 consistency**
+ **持久性 durability**

**事务transaction**是数据库应用中完成单一逻辑功能的操作集合。

每个**事务**是一个具有**原子性和一致性**的单元。我们要求单元不违反任何数据库的一致性约束。但是执行过程中，必要时允许暂时的不一致。

原子性和一致性是**恢复管理器recovery manager**的职责。

为了保证原子性，失败的事务必须对数据库状态不产生任何影响，数据库必须被恢复到该失败事务开始执行之前的状态。这种情况下数据库系统必须进行**故障恢复failure recovery**。

+ **并发控制管理器concurrency-control manager**，控制并发事务间的相互影响，保证数据一致性
+ **事务管理器transaction manager**包括并发控制管理器和恢复管理器

## 数据库体系结构

![image-20220223004240529](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/397b6fc103b0d9d39bc6479b484ccc5c-image-20220223004240529-0f97a7.png)

![image-20220223004249754](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/b490ef88e305178ce165a573ff36da91-image-20220223004249754-b26ce9.png)

数据库架构很大程度上取决于所运行的操作系统

+ 集中式
+ 客户端-服务器的
+ 并行的
+ 分布式的

![image-20220223004425217](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/222f4eca1b0ac6540f3e459fbc831cfb-image-20220223004425217-65cf26.png)

## 数据库史

### 50~60年代

磁带用于数据存储，只能顺序读取。

### 60年代末~70年代

摆脱了顺序访问的限制，可以将表和数保存在磁盘上。

关系模型和查询数据的非过程化方法出现。关系型数据库诞生

### 80年代

关系型数据库真正应用，取代了网状和层次型数据库。

程序猿只需要考虑逻辑层的工作。

### 90年代初

许多厂商推出了并行数据库产品。

### 90年代

互联网的爆发式发展。数据库系统需要提高事务处理速度和高可靠性，提供对数据的web接口

### 2010年前

XML兴起。开源数据库系统应用显著增长——PostgreSQL和MySql

### 至今

用于数据分析的数据库。

+ 按列存储的列存储数据库
+ 高度并行的数据库
+ 分布式数据库

![image-20220223005128710](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/00bd1f5f5b818db5b1847ac13bc3705c-image-20220223005128710-5476ed.png)![image-20220223005135877](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/23/f5f855242aaf98718bab7b5731400c3d-image-20220223005135877-eed096.png)