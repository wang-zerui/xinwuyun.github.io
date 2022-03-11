# CH3

## 一、CFG

![](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/27e1ddcf4c5af65c7d43fbd230de82ac-image-20211119153414572-f2479b.png)

## 二、产生式

![image-20211119153455640](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211119153455640.png)

![image-20211119153545637](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/80bcca85742f98f1c4b42c71c1ba6cd6-image-20211119153545637-0712a7.png)

**终结符和非终结符的区分**

1. 大小写区分：E->id
2. “”区分： E->"id"
3. 用<>区分

本课程中

![image-20211119153859914](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/10b768d0dab350ae02128224bdfff297-image-20211119153859914-be90ff.png)

**产生式的缩写**，若干个产生式具有相同的左部，可合并为一个产生式。

![image-20211119154022566](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/c77355c77982590a709c5209e0a9809c-image-20211119154022566-47e9c4.png)

## 三、CFG产生语言的基本方法——推导

### 直接推导

利用产生式产生句子的过程中，将用产生式$A\rarr \gamma$的右部替换文法符号序列$\alpha A \beta$，记作：$\alpha A \beta \Rightarrow \alpha \gamma \beta$

若对于任意文法序列$a_1$，$a_2$...$a_n$有$a_1 \Rightarrow a_2 \Rightarrow \ldots \Rightarrow a_n$

称此过程为零步或多步推导

![image-20211119155842688](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/1b9707f09aa748ca09a7846f2c92cccc-image-20211119155842688-468883.png)



## 四、上下文无关文法

由CFG G所产生的语言L(G)被定义为![image-20211119160628629](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/ae253f950d6a14e7ae420acb68157b0e-image-20211119160628629-add6f6.png)

L(G)称为上下文无关语言，$\omega$称为句子。若![image-20211119160725148](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/39f84fd1f943ef3e8e4216005911c0a1-image-20211119160725148-9aed44.png)

则称$\alpha$为$G$的一个句型

## 五、最左(右)推导

在推导过程中，若每次直接推导的替换句型中**最左边的非终结符**，则称为最左推导，由最左推导产生的句型被称为左句型。

![image-20211119161201005](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/3fc80ac330292fa1c42143afa7bbe8b2-image-20211119161201005-574b44.png)

## 六、分析树

1. **根**由开始符号所标记
2. 每个**叶子**由一个终结符、非终结符、或$\epsilon$标记
3. 每个**内部结点**由一个非终结符标记
4. 若A是**非叶子节点**的标记，且$X_1,X_2...X_n$是该节点从左到右所有孩子的标记，则$A\rarr X_1X_2...X_n$是一个产生式。若$A\rarr \epsilon$，则标记为A的结点可以仅有一个标记为$\epsilon$ 的孩子

## 七、分析书与语言和文法的关系

1. 每一个**直接推导**，对应一棵仅有父子关系子树，即产生式**左部非终结符**出右部的孩子
2. 分析书的**叶子**，从左到右构成G的一个句型。若叶子**仅由终结符标记**，则构成一个句子

## 八、语法树

对CFG G的句型，表达式的语法树被定义为具有下述性质的一棵树

1. 根与内部节点由表达式中的操作符标记
2. 叶子由表达式中的操作数标记
3. 用于改变运算优先级和结合性的括号，被隐含在语法树的结构中

**语法树和分析书**的根本区别

1. **分析树**的内部节点是**非终结符**
2. **语法树**的内部节点是**操作符**

或者说语法树中省略了反映分析过程的非终结符。

## 九、二义性是什么

文法G对同一句子产生不止一个树，则称G是二义的。

**原因**：在产生句子的过程中，某些直接推导有多于一种选择。

**根本原因**：文法中缺少文法符号优先级和结合性的规定

## 十、悬空问题

![image-20211119174126557](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/bfaa974ab5743b5f146c5ce93a856dce-image-20211119174126557-e5285a.png)

![image-20211119174220887](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/1fa6e2e5e51b2670e3f9629549ae6125-image-20211119174220887-dcf9b9.png)

![image-20211119174229118](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/e81dc3b7688fc0963b71ae0af17431a5-image-20211119174229118-9d94c2.png)

> 直接来说就是else有两种匹配方式

## 十一、二义性的消除

1. 改写二义文法为非二义文法
2. 规定二义文法中符号的**优先级**和**结和性**，使仅产生一棵分析树

![image-20211119191733590](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/582939d3e323dd5736169b1198595f58-image-20211119191733590-6e0ee3.png)

改写为
![image-20211119191748045](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/489a343960c59f9f91f70cb621bc86bd-image-20211119191748045-d6d250.png)

![image-20211119191836335](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/11/19/a81fb9b91791c76c89aab8a72dc5c494-image-20211119191836335-5428c7.png)

改写**二义文法**的关键步骤

1. 引入一个新的非终结符，增加一个子结构并提高一级优先级
2. 递归**非终结符**在终结符左边，使该终结符具有左结合性，否则具有右结合性

## 十二、正规式与上下文无关文法

从正规式到CFG的构造方法

1. 构造正规式的NFA
2. 若0位初态，则$A_0$为开始符号
3. 对于$move(i,a)=j$，引入产生式$A_i\rarr aA_j$
4. 对于$move(i,\epsilon)=j$，引入产生式$A_i\rarr A_j$
5. 若i是终态，则引入产生式$A_i\rarr \epsilon$

## 十三、自上而下分析

![img](http://p.ananas.chaoxing.com/star3/origin/11ed5733e28eac8347334f6cd2f597e9.png)



**基本思想**：推导

对于任何一个输入序列（记号流），从S开始进行**<u>最左推导</u>**，直到得到一个合法的句子或者非法结构。

**特点**：

+ 从**左到右扫描输入序列**，视图用一切可能的方法，自下而上，自左向右建立输入的分析树
+ 自下而上分析是一种**试探**的过程，是反复使用不同产生式谋求与输入序列匹配的过程

## 十四、左递归 直接左递归

文法G中的非终结符A，对某个文法符号序列$\alpha$存在推导$A\stackrel{+}{\Rightarrow}A\alpha$，则称G是左递归的。

若G中有形如$A\rarr A\alpha$的产生式，则称：

**该产生式对A直接左递归**

## 十五、消除直接左递归

![image-20211203104819171](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/a2431e3156b5b1e65315b3ca23869bdb-image-20211203104819171-1be04e.png)

**算法实现**

+ 输入：文法G，含直接左递归
+ 输出：不含左递归的G'
+ 方法

对每个产生式A，整理A为如下形式
$$
A \rightarrow A \alpha_{1}\left|A \alpha_{2}\right| \ldots\left|A \alpha_{m}\right| \beta_{1}\left|\beta_{2}\right| \ldots \mid \beta_{n}
$$
$\alpha_i$非空，$\beta_j$均不以A开始，然后用如下产生式代替
$$
\begin{array}{l}
A \rightarrow \beta_{1} A^{\prime}\left|\beta_{2} A^{\prime}\right| \ldots \mid \beta_{n} A^{\prime} \\
A^{\prime} \rightarrow a_{1} A^{\prime}\left|\alpha_{2} A^{\prime}\right| \ldots\left|\alpha_{n} A^{\prime}\right| \varepsilon
\end{array}
$$
![image-20211203110123419](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/3a652276b8b56450d627af64f19c8c47-image-20211203110123419-0db94c.png)

## 十六、消除左递归（非直接）

**输入**：无回路文法G

**输出**：无左递归的等价文法G'

**核心思想**：将无直接左递归的非终结符展开到其他产生式中

**方法**：

![](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/00820d2c4f28702a283483adda88c120-image-20211203111316358-1c868e.png)

![image-20211203113601947](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/0d0b53563243b7dd5e49b69f764da74e-image-20211203113601947-aa2313.png)

将非终结符合理排序：$A_1,A_2,A_3,...,A_n$

![image-20211203113723548](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/fccc87bb94490b33a9a12e04e1549ffd-image-20211203113723548-67380a.png)

## 十六、提取左因子

当不确定用产生式A产生哪个候选项替换A时，可以重写A的产生式来推迟这种决定，直到看见足够的输入能正确决定所需选择为止。



公共左因子（前缀）：$A\rarr\alpha\beta_1|\alpha\beta_2$
$$
A\rarr\alpha\beta_1|\alpha\beta_2
$$
替换为：
$$
A\rarr\alpha A' \\A'\rarr\beta_1|\beta_2
$$

## 十七、递归下降分析器

**本质**：以程序中的过程调用来模拟最左推导

**基本思想**：

每个**非终结符**A对应一个子程序（函数A），过程体中：

1. 产生式右部的**非终结符B**，对应子程序B的调用
2. 产生式右部的**终结符T，与输入记号进行匹配**

**稳妥方法**

1. 构造文法的状态转移图并化简
2. 从转移图转化为EBNF表示
3. 从EBNF构造子程序

![image-20211203172754757](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/5a3a0f274d10ffdaa1f428bafeca4e4a-image-20211203172754757-a112e3.png)



![image-20211203172839200](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/03/fe895d90631ab152c63b36b1ecab0d12-image-20211203172839200-22dbba.png)









