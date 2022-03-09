# CH4 数字传输

1. 线路编码：数据元素、信号元素、数据速率、信号速率、最小带宽、最大数据速率、直流分量、自同步
2. 线路编码方案：单极性编码（*NRZ*）、极性编码（*NRZ-L*和*NRZ-I*）、归零码（*RZ*）、双相码（*Manchester*和*Differential Manchester*）、双极性编码（*AMI*和伪三进制码）、
3. 脉码调制*PCM*：采样（采样率）、量化等级、量化误差
4. Delta调制的概念
5. 传输模式：异步传输、同步传输、并行传输、串行传输的概念

## DIGITAL-TO-DIGITAL CONVERSION数字到数字转换

+ 线性编码line coding
+ 块编码或分组编码block coding
+ 扰码scrambling

### 线路编码

将数字数据转换为数字信号。

![image-20220309210445077](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/7517efd7796c1ac17cba6fc245b65403-image-20220309210445077-f43059.png)

#### 信号元素与数据元素

区分数据元素data element和信号元素signal element

+ 我们的目标是发送数据元素
+ 我们能发送的是信号元素
+ 数据元素是表示一块信息的最小实体——位
+ 信号元素承载 **数据单元**，信号元素是数字信号的最小单元

##### r

**定义比率r为每个信号元素的数据元素数量。**

![image-20220309211419152](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/c2dbba368259ce43c295b8bd9d39ae48-image-20220309211419152-4ed36c.png)

#### 数据速率data rate

1s发送的数据元素的数量，即比特率

#### 信号速率signal rate

1s发送的信号速率的数量，单位波特baud

*波特率buad rate、脉冲速率pluse rate、调制速率modulation rate*

#### 二者关系

$$
S=c\times{N}\times \frac{1}{r}baud
$$

这里的N是数据速率（bps），c是情形因子$c\in[0,1]$

### 带宽

携带信息的数字信号是非周期性的。非周期性信号的带宽是无限连续的。

> 虽然数字信号的真实带宽是无限的，但有效带宽是有限的。

波特率而不是比特率决定了数字信号的带宽，最小带宽定义如下
$$
B_{\min}=c\times N\times\frac{1}{r}
$$
如果给出通道带宽，我们可以得出最大数据速率如下
$$
N_{\max}=\frac{1}{c}\times B \times r
$$

> 一般情形 $c=\frac{1}{2}$

### 基线偏移

避免长0和长1

![image-20220309214919993](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/04f684b77c5c70d826391cb85a1e66d8-image-20220309214919993-e2ea32.png)

### 直流成分 DC component

当数字信号中的电平保持一段时间恒定时，频谱会产生很低的频率。

这些接近0的频率称为**直流成分**。会给不能通过低频的系统或使用电子耦合的系统带来问题（变压器）。

对此应该使用无直流方案

### 自同步

接收方的位间隔必须与发送方的位间隔严格对应。

**self-synchronizing**，数字信号在

+ 数字信号在传输的数据中包含定时信息。

+ 如果信息中包含有提示接收方

  + 起始
  + 中间
  + 结束位置

  的脉冲跳变就可以完成自同步

+ 如果接收方时钟不同步，这些提示跳变会将其时钟复位

## 线路编码方案

+ 单极——**NRZ**
+ 极性——**NRZ、RZ和双相（曼彻斯特和差分曼彻斯特）**
+ 双极——**AMI和伪三元码**
+ 多电平——2B/IQ、8B/6T and 4D-PAM5
+ 多跳变

### 单极编码方案

**所有信号电平都在时间轴的一边**

#### NRZ non-return-to-zero方案

位中间信号不会归0

![image-20220309222440275](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/0da821c86ed90d44157ecf2a9f90d566-image-20220309222440275-b8d6ed.png)

开销高

### 极性编码方案

电平在时间轴两边

#### NRZ和极性NRZ(polar NRZ)

+ NRZ-L：电平决定位值
+ NRZ-I：见1就翻不归0

#### 存在的问题

+ 基线偏移
  + NRZ-L：全0，全1长序列
  + NRZ-I：全0
+ 同步
  + NRZ-L：全0，全1长序列
  + NRZ-I：全0
  + 极性意外改变会导致1变成0

两个方案都有N/2Bd的平均信号速率

> S=c✖️N✖️1/r

+ 带宽
  + 频率接近0时，功率密度值会很高
  + 携带高能量DC值

**🌰**

![image-20220309224016815](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/05a8f1386e36372aff4dff5e4ccdaecc-image-20220309224016815-fe2528.png)

都是N/2

#### RZ归0编码

![image-20220309224213691](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/2b20fdbc8c5eb5774920058526e288a4-image-20220309224213691-f7bf43.png)

缺点：极性改变会导致所有1识别为0

#### 双相编码：曼彻斯特和差分曼彻斯特difference manchester

![image-20220309224617426](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/8984bf0d65c276b71d1af3a229525059-image-20220309224617426-60eb94.png)

> 位中间的跳变用于同步

差分见0就翻，中间必翻

+ 没有基线偏移
+ 没有DC成分
+ 信号速率太高

### 双极性方案

+ 双极bipolar编码。
+ 有三个电平
  + 正
  + 负
  + 0

#### AMI alternate mark inversion交替传号

AMI: 0保持0电平；1交替正负

伪三元编码：0和1交换

![image-20220309225104446](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/5e97d891860efb5b272839ec025ba8a1-image-20220309225104446-27f0b3.png)

![image-20220309225217513](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/c5ef9b7e619494db016907376d1cfdfb-image-20220309225217513-9e5ddf.png)

+ 适合长距离通信
+ 虽然有长0，但是没有DC成分，因为长0振幅是0
+ 但是长0会有同步问题

![image-20220309225543530](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/09/c8cfb3e304bd10fba08082a4731dbb86-image-20220309225543530-a8ce34.png)

## 模拟analog到数字digit转换

+ 脉冲码调制
+ delta调制

### 脉冲码调制PCM

把模拟信号转换成数字信号的最通用技术称为**脉冲码调制pluse code modulation**

1. 采样
2. 量化
3. 编码

#### 采样sampling

+ 每隔$T_s$秒对模拟信号采样
+ 











