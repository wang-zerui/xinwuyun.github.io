## CH8

![image-20220228225942821](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/0cb9b3aa7cdc5751d1b34526c2544b10-image-20220228225942821-3acad1.png)

## 好的设计的特点Features of Good Relational Design

+ A combined schema without **repetion**

  没有**重复**的组合模式

### 更小的模式

+ 对于**inst_dept**。decompose it into instructor and department
+ dept_name是候选码
+ 表示为**函数依赖**
  + dept_name → building, budget
+ 在inst_dept中，因为dept_name不是候选码，building和budget可能会出现重复
+ 不是所有的分解都是好的
  + **lossy decomposition有损分解**


![image-20220228235117666](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/02/28/04699b1277ed2bb341d35c8052bdb2c3-image-20220228235117666-06cc25.png)

> 如果有多个同名的kim，则无法分辨

+ lossless decomposition 无损分解

## ⚛原子域和第一范式1NF

+ domain is atomic if its elements are considered to be indivisible units

  如果域中的元素是不可分割的称域为原子域
  
+ 如果R的所有属性的域都是原子的，则称该关系模式是**第一范式（first normal form, 1NF）**

### goal目的——为下列内容设计一个理论

+ 决定关系R是否是好的范式
+ 当R不是good form时，把它分解成{$R_1, R_2, R_3...$}，其中
  + 每个关系都是good form
  + 分解必须是无损连接分解
+ 理论基于
  + **函数依赖**
  + **多值依赖**

## Functional Dependency Theory

+ 合法关系集的约束
+ 要求关系中有候选码
+ 函数依赖是**key**的泛化

R是个关系模式 Relation Schema
$$
\alpha \subseteq R \text { and } \beta \subseteq R
$$
![image-20220301210358212](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/01/e78b6b2158b71654f2785575c645d3cd-image-20220301210358212-ed241c.png)

### 与码的关系 key

当$K\rarr R$时，$K$是**超码**。

当$K\rarr R$，并且不存在$\alpha \subset K, \alpha \rightarrow R$

> 不存在K的子集，使得函数依赖$\alpha \rarr R$成立

+ Function Dependencies允许我们表达不能使用超码表达的约束

+ 考虑如下模式

  inst_dept(<u>ID</u>, name, salary, <u>dept_name</u>, building, budget)

  使用函数依赖表示

  $dept\_name\rarr building \text{   } and \text{ } ID\rarr building$

###  we use funcional dependencies to

+ 实例：判定关系的实例是否**satisfies**给定**函数依赖集F**
  + **satisfies：**模式r满足**函数依赖集F**
+ 模式：说明合法关系集上的约束。如果模式R上满足函数依赖集F的关系，则F在r(R)上成立

> 注意：一个关系模式的**实例**可能satisfy一个函数依赖即使这个函数依赖在模式上并不成立。

### 平凡trivial函数依赖

如果一个函数依赖在一个关系的所有实例上都成立，则它是平凡的
$$
ID, name \rarr ID
\\
name \rarr name
$$
![image-20220302142334785](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220302142334785.png)

## 函数依赖集闭包 closure of a set of functional dependencies

+ 给定函数依赖集F，可以推断出一些其他的函数依赖也成立
  + 例如 $if \; A \rarr B \; and \; B \rarr C$
  + 可以推出$A \rarr C$
+ 能够从给定函数依赖集F推导出的所有函数依赖是F的**闭包（closure）**
+ 写作$F^+$
+ $F^+$是F的超集

## BCNF范式

+ 消除所有基于函数依赖能够发现的**冗余**
+ 具有函数依赖集F的关系模式R属于BCNF的条件是，对$F^+$中所有函数依赖$\alpha \rarr \beta$，下列至少一项成立
  + 是平凡的函数依赖
  + 或者$\alpha$是超码

> 数据库属于BCNF的条件是，构成该设计的所有关系模式都属于BCNF

## 将一个模式分解为BCNF

假设我们有一个**关系模式R**和**非平凡函数依赖**，不满足BCNF

decompose it into

+ $(\alpha \cup \beta)$
+ $R-(\beta - \alpha)$

## BCNF和依赖保留 Dependency Preservation

依赖保留，有时我们希望进行BCNF分解后，某些依赖仍然保留。

但是往往BCNF和依赖保留不能两全。

所以我们提出**3NF**，它比BCNF更弱。

## 3NF，第三范式

BCNF基础上再加一个条件

+ $\alpha \rarr \beta$是一个平凡trivial的函数依赖
+ $\alpha$是R的一个超码
+ $\beta - \alpha$中的每个属性都包含于R的一个候选码中

> 如果R满足BCNF则，R满足3NF
>
> 能确保每个模式都有保持依赖的函数依赖的3NF分解

## 规范化的goal

# 函数依赖理论

## closure of a set of functional dependencies

逻辑蕴含

给定关系模式r(R)，如果r(R)的每一个满足F的实例也满足f，则R上的函数依赖f被r上的函数依赖集F逻辑蕴含

+ 函数依赖集F的闭包是$F^+$
+ 我们可以通过反复使用
  + **reflexivity自反律**if $\beta \subseteq\alpha$则$\alpha \rarr \beta $
  + **augmentation增广律：**如果$\alpha \rarr \beta$，则$\gamma \alpha\rarr\gamma\beta$
  + **transitivity传递律：**如果$\alpha \rarr \beta$并且$\beta\rarr\gamma$则$\alpha\rarr\gamma$
  + **union合并律**：如果$\alpha \rarr \beta$并且$\alpha \rarr \gamma$，则$\alpha \rarr \beta \gamma$
  + **decomposition分解率**：union逆命题
  + **pseudotransitivity伪传递律：**如果$\alpha \rarr \beta$并且$\gamma \beta \rarr \delta$则$\alpha \gamma \rarr \delta$

## 属性集的闭包

如果$\alpha \rarr B$，我们称属性B被$\alpha$**函数确定（functionally determine)**。

要判断集合$\alpha$是否是超码，需要设计一个算法，用于计算被$\alpha$函数确定的属性集。

![image-20220303160148047](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303160148047.png)

![image-20220303155431239](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303155431239.png)

1. 先判断是不是超码
2. 再判断是不是候选码

### 用途

1. 判断超码：先求$\alpha^+$，看看是否包含R的所有属性
2. 判断函数依赖是否holds
   1. 对于$\alpha \rarr \beta$，check $\alpha^+$中是否有$\beta$即可
3. 另一种计算$F^+$的方法，**对任意$\gamma \subseteq R$找出$\gamma^+$，对任意$S\subseteq \gamma^+$，可以输出一个函数依赖$\gamma \rarr S$**

## 正则覆盖 canonical cover

### 无关属性 extraneous attributes

+ 考虑$\alpha \rarr \beta$ in F
  + 如果$A \in \alpha$，并且F**逻辑蕴含**$(F-\{\alpha \rightarrow \beta\}) \cup\{(\alpha-A) \rightarrow \beta\}$
  + 如果$A\in\beta$，并且**F逻辑蕴含$(F-\{\alpha \rightarrow \beta\}) \cup\{\alpha \rightarrow (\beta-A)\}$**
  + 则A是无关的

![image-20220303164059801](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303164059801.png)

### 判断一个属性是否无关extraneous（使用属性集闭包）

对于F中的$\alpha\rarr\beta$是否存在无关属性

+ $A\in\alpha$
  + 计算$({\alpha}-A)^+$，使用***F***
  + 判断其是否包含$\beta$，有则A是无关属性
+ $A\in \beta$
  + 计算$\alpha^+$，使用$\mathrm{F}^{\prime}=(F-\{\alpha \rightarrow \beta\}) \cup\{\alpha \rightarrow(\beta-A)\}$
  + 判断其是否包含A，不包含则A是无关属性

### 正则覆盖canoncial cover

**$F_c$是F的正则覆盖**，当

1. F逻辑蕴含Fc
2. Fc逻辑蕴含F
3. Fc中的函数依赖不包含无关属性
4. Fc中的每个函数依赖的左边都是唯一的。

### 算法

1. 适用**union rule**合并dependency
2. 对剩下的去除**无关属性**

![image-20220303170800599](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303170800599.png)

> 算法结束后，可能union rule需要再次适用。

![image-20220303185532492](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303185532492.png)

### 无损分解 lossless decomposition

#### 用关系代数说明

对于$R=(R_1, R_2)$，我们要求
$$
r=\prod_{R 1}(r) \bowtie \prod_{R 2}(r)
$$

> $R_1$和$R_2$是属性集，可能有共同的属性
>
> $\bowtie$是自然连接

这样令R1和R2是R的分解，没有信息损失，该分解是无损分解

#### 用函数依赖说明

如果以下函数任意一个属于$F^+$，则是无损分解
$$
R_1 \cap R_2 \rarr R_1
\\
R_1 \cap R_2 \rarr R_2
$$

> 也就是分解后一方含有另一方的超码
>
> 超码可以用**属性集闭包判断**

#### example

![image-20220303205507758](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303205507758.png)

### 保持依赖 dependency perservation

n个R，$R_i$的函数依赖集是$F_i$，如果
$$
\left(F_{1} \cup F_{2} \cup \ldots \cup F_{\mathrm{n}}\right)^{+}=F^{+}
$$
则分解是依赖保留的

#### 算法

分别对F中的函数依赖使用如下算法

![image-20220303210239523](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303210239523.png)

> 这里的属性闭包是F下的

#### example

![image-20220303210324132](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303210324132.png)

## 判断BCNF

![image-20220303223742377](/Users/chentong/Library/Mobile Documents/com~apple~CloudDocs/笔记/大三上/数据库笔记/复习/CH8.assets/image-20220303223742377.png)

## BCNF分解

## 3NF分解

+ BCNF不是依赖保持的
+ 检测违反函数依赖的效率很重要

### 解决方法

定义一个更弱的范式

1. 允许一定冗余
2. 函数依赖可以在单独的关系中检验不用计算连接

## design goals

### 关系型数据库设计

+ BCNF
+ 无损分解 lossless join
+ dependency preservation

### 如果不能达到，接收如下之一

1. 缺少函数依赖
2. 3NF



