## 一、语法与语义

语法是语言的结构，即语言的"样子"。
语含是附着于语言结构上的实际含义，即语言的”意义“

![image-20211207190500288](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/07/e0ee1f53524ddf585ee392b027056a5e-image-20211207190500288-3c9444.png)

![image-20211207190510191](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/07/78fa5c5609a699b751387c6d39504d20-image-20211207190510191-263270.png)

![image-20211207190717574](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/07/42f007548c97ade1981375eec6463abb-image-20211207190717574-748400.png)

## 二、属性与语义规则

### 语法制导翻译的基本思想

以语法翻译为基础，伴随语法分析的各个步骤，执行相应的语义动作

### 属性的抽象表示

```
E.val
E.type
E.code
E.place
```

![image-20211207200205470](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/07/8d8ebaec0a755393654d0d9a5a678e28-image-20211207200205470-f9dd0c.png)

## 三、语义规则的两种表现形式

![image-20211207200531755](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/07/1962d308ad431ba89cf5721132f11167-image-20211207200531755-0e0649.png)

抽象程度不同。作用等价

## 四、LR分析翻译方案的设计

LR分析中的语法制导翻译实质上是对LR语法分析的扩充

1. 扩充LR分析器的功能：执行归约动作时，也执行相应产生式对饮的语义动作。由于是归约时执行语义动作。因此<u>限制语义动作仅能放在产生式右部的最右边</u>;

2. 扩充分析栈

   增加一个与分析栈并列的语义栈，用于存放分析栈中文法符号所对应的属性值

![](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/07/ae2d01fe1b896aaad30b102de10217e7-image-20211207204521045-92de5b.png)

**虚拟属性**：`print(E.post)`可想象为`L.p:=print(E.post)`

| 产生式           | 翻译方案2       |
| ---------------- | --------------- |
| $L\rarr E$       |                 |
| $E\rarr E_1+E_2$ | `print(+)`      |
| $E\rarr num$     | `print(lexval)` |

+ 语法制导定义——算法
+ 翻译方案——程序实现

许多的文法都了简化的二义文法，而默认解决二义性的方法是**为文法符号规定常规意义下的优先级和结合性**。

![image-21207210532978](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211207210532978.png)























