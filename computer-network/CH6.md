# 第6章 带宽利用

1. 复用：FDM、同步TDM、统计TDM和WDM的概念
2. 数字层次、*T1*载波、*E1*载波
3. 波分和码分的概念
4. 扩频：FHSS和DSSS的概念

##   motivation

+ 带宽利用是可用带宽的合理利用

### 复用 multiplexing

可获得效率

### 扩频 spreading

保密和抗干扰能力

## 复用 multiplexing

允许通过一条数据链路传输多个信号，在复用的系统中，n条线路共享一条链路的带宽

![image-20220310160108661](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/2d749befe000e65101fd55a8785ec227-image-20220310160108661-e79afb.png)

+ 复用器MUX：将流量组成一个单独的传输流
+ 分离器 DEMUX：接收端，将传输流分解成几个单独的传输流
+ 通道channel：在给定一对设备之间传送传输信号的链路的那部分。一个link可能有多个通道

有三种技术

+ 频分多路复用 Frequency-Division Multiplexing(analog)
+ 波分多路复用 Wavelength-Division Multiplexing(analog)
+ 时分多路复用 Time-Division Multiplexing(digit)

## FDM

### 概念

+ FDM是用来**组合模拟信号**的模拟多路复用技术
+ **载波频率之间的频率差**能容纳调制信号的带宽
+ 通道之间用保护频带分割，防止重叠
+ 载波频率不能影响原始的数据频率
+ 数字信号转换为模拟信号后，仍然可以使用FDM

![image-20220310160706160](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/feea32106d08597afba97b3f5306fbc5-image-20220310160706160-582501.png)

### 例子1

![image-20220310161446189](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/d0be795432394f6bd980e39f9552076f-image-20220310161446189-174836.png)![image-20220310161438201](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/a220911edfbcd12d6f5871a931bcb73e-image-20220310161438201-175307.png)

### 例子2

![image-20220310161653582](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/9c461e1dc2c1fc668c2d199b6f981d29-image-20220310161653582-77d43a.png)![image-20220310161718378](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/aa73943ef2bda2473d48f889f00f6a51-image-20220310161718378-96d57a.png)

![image-20220310162019291](../../../../Library/Application%20Support/typora-user-images/image-20220310162019291.png)

## 波分多路复用

+ 合并多个光信号
+ 用于具有高数据速率传输能力的光纤
+ 概念上与FDM相同，原理也一样
  + 差别是WDM复用的频率非常高

### prisms 棱镜在波分复用中的复用和分离器

![image-20220310163532934](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/46607032ce5b19b3bbf3626bcae49b3c-image-20220310163532934-04abb7.png)

+ 将多个光源组成单一光信号
+ 在分离器上做相反的处理
+ 光源组合与分离由棱镜完成
+ WDM的一种应用是同步光纤网络SONET

## 时分多路复用复用 TDM

+ 组合多个低速通道为一个高速通道

+ 是一个数字化的过程，允许多个连接共享一条高带宽链路

  TDM在时间上共享，每个连接占用链路的一个时间片段

+ TDM将不同源端的数字数据合并到一个时间共享的链路上

![image-20220310163718227](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/85d965bc999dab7cfa88339edcfb3c5a-image-20220310163718227-c772c1.png)

### 同步时分复用 Sync time-division multiplexing

![image-20220310165331421](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/f88af4dcb2c01387ab4f0114ab9a1ed1-image-20220310165331421-58b1b0.png)

![image-20220310163855763](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/1079d9e68eeae2d9330f8f5fa0396d92-image-20220310163855763-05a97e.png)
$$
\text{链路速率}=n\times{数据速率}
$$
且一个单元的持续时间变为$\frac{1}{n}$

#### 例子

![image-20220310164455728](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/de6c28539c67c1027e285697f70a963f-image-20220310164455728-6cbdc7.png)

![image-20220310165320798](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/8e1f9b1a51e0212c8408de806fec2b72-image-20220310165320798-359942.png)

#### 交替 interleaving

+ TDM可以看做是两个快速旋转的开关
+ 是同步的，以相同速率旋转但是方向相反

**交替interleaving**：在复用一侧，当开关在一个连接前打开时，连接即有机会从通路中接收一个单元。

![image-20220310165357863](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/1caf80c96b1d532c0a2cf6215e80d884-image-20220310165357863-57e6b4.png)

#### 空时隙empty slots

会出现不连续数据

![image-20220310170804137](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/62d7fcaea70a5889e0d9346bf32bbd88-image-20220310170804137-da2236.png)

## 数据速率管理

有时每路信号速率不同

+ 多级复用 multilevel multiplexing
+ 多时隙分配 multiple-slot allocation
+ 脉冲填充 pulse stuffing

> 前两个都必须是整数倍的情况；最后一个是任意倍即可

### 多级复用（加速）

+ 一条输入数据线的数据速率是其他一些输入数据线数据速率的整数倍可以采用多级复用技术

![image-20220310171152995](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/1f80d1ed11170ad33ce86db92453d3f2-image-20220310171152995-ceaf9f.png)

### 多时隙（减速）

![image-20220310171255930](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/9b289a03f03071d4f38ae90d43fa3a5b-image-20220310171255930-65293a.png)

### 脉冲填充

![image-20220310171347143](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/20dce706b46f4a4158b34282b5351660-image-20220310171347143-5e0ac2.png)

### 帧同步（帧指示位）

如果复用器和分离器之间失去同步，则属于某一个通道的位可能会被错误的通道接收。

为此，在帧开始增加一位或多为的同步位。

![image-20220310171712335](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/27591ecd3df1c6920e76cd088a0420d8-image-20220310171712335-03b82a.png)

#### 例子

![image-20220310171816960](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/5209bc659f079a150a5c3517e4bd1ddd-image-20220310171816960-a7c3d8.png)

![image-20220310171826535](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/f37e05a70038253b1ccc19eb58496c85-image-20220310171826535-4fb22f.png)

## 数字信号服务（1.544记住）

电话公司通过一种数字信号的层次结构实现TDM，称为

+ **数字信号（digital signal, DS）**
+ 或**数字层次结构（digital hierarchy)**

![image-20220310172426883](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/b4f8269923412283896e2ab3674719c7-image-20220310172426883-9b62b5.png)

DS0有24个，每个是64kbps，以及8kbps的同步开销得到1.544记住1.544**

### T线路

DS-0, DS-1是服务的名称

+ 使用**T线路T lines**实现

![image-20220310172527179](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/4ec2ea06d2211327912ec2a19391102b-image-20220310172527179-c7f1b3.png)

![image-20220310190859721](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/8759512134944a867bc6738043f679fe-image-20220310190859721-f2424c.png)

### 用于模拟传输的T线路

T线路是为数字数据、音频或者视频设计的数字线路。但也可以用于模拟传输（常规电话连接）。前提是对模拟信号采样，然后使用TDM

> 过去，一个组织可能需要几十根电缆，来与外界通信。有了T线路之后，只需要一根T线路

![image-20220310192348549](e)

### **8kbps**的开销是怎么来的

![image-20220310192436817](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/7e4d02fbf1ae09ed310c66ef59a5f1a2-image-20220310192436817-8ca1ab.png)

## E线路

欧洲版T线路。概念相同，容量不同

![image-20220310192728580](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/a549a27f98c622d7af2032807db08a76-image-20220310192728580-37fa77.png)

## 统计时分复用

动态分配时隙以提高带宽的效率。

+ 每个帧的时隙个数小于输入线的条数
+ 复用器循环顺序检查输入线
+ 输入线有数据发送时
+ 才对输入线分配时隙
+ 输出时隙时需要携带
  + 数据
  + 目的地址（输入线）
    + 寻址：N个输出线用n位表示，满足$n=\log_2N$

![image-20220310193349102](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/97576153d703387bd209b0a4581b8df9-image-20220310193349102-2b503f.png)

### 没有同步位

### 时隙大小

![image-20220310194341776](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/8eb944cfc5fc03538b3d1a617e14e291-image-20220310194341776-c2428e.png)

### 带宽

链路的容量小于每个通道容量之和

## 扩频 spread spectrum

为无线网设计

+ 防止窃听者窃听
+ 防止入侵者干扰

### 做法

为达到此目的

+ 在信号上增加冗余部分
+ 扩展原始信号的频带满足每个站的需要。
+ 如果需要的带宽是B，扩展至$B_{ss}$
  + $B_{ss} \gg B$

### 两个原则

1. 每个站点分配的带宽要足够大
2. 原来的带宽B扩大到$B_{ss}$，由一个与原来的信号无关的过程来做

### 调频扩频FHSS

#### 伪随机噪声

用源信号调制M个不同的载波频率。某一时刻用信号调制1个再破频率，下一时刻调制另一个频率。

+ 伪随机噪声 frequency hopping spread spectrum

#### FHSS循环

![image-20220310202253841](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/ae4ef33f23acb7e97982f93bdeb854b0-image-20220310202253841-84a1dd.png)

![image-20220310202209514](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/5310582134c224359d62f7315e3a7fe0-image-20220310202209514-10745d.png)

#### 宽带共享

如果**跳频数**是M，可以将M个通道复用为使用同一带宽的通道，

## 直接序列扩频direct sequence spread spectrum DSSS

每个数据位用扩展编码的n位代替。每一位被编码为n位代替

![image-20220310203328963](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/0c5501ce7fbe278df08f7172383c1a89-image-20220310203328963-5bd26f.png)