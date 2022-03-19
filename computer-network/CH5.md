# CH5 

1. 比特率和波特率
2. 数字到模拟转换：
   1. `*ASK*的概念及ASK的带宽
   2. *FSK*的概念及BFSK的带宽
   3. *PSK*、BPSK、QPSK和QAM的概念
3. 模拟信号调制：
   1. *AM*、*FM*和*PM*的概念
   2. AM带宽、FM带宽和PM带宽

## 数字到模拟转换

digital-to-analog conversion

![image-20220310094436044](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/0bc0ca5c84e663c7227a60dc43d16b61-image-20220310094436044-be693f.png)

> 一个正弦波由
>
> + 振幅
> + 频率
> + 相位
>
> 定义

改变任何一个，波都会变化。可以用这个变化来表示数据的变化。可以得出至少三种将数字数据调制到模拟信号的机制

1. 幅移键控：==ASK==amplitude shift keying
2. 频移键控：==FSK==frequency shift keying
3. 相移键控：==PSK==phase shift keying
4. 正交振幅调制：quadrature amplitude modulation QAM

### 比特率和波特率

$$
S=N\times \frac{1}{r}
$$

波特类似车辆，比特类似乘客。

#### 例子🌰

![image-20220310095207983](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/45b8fe6752a703930ace4cc2dbce7f00-image-20220310095207983-f161c7.png)

#### 带宽

除了**FSK**，其他数字数据的模拟传输所需带宽与信号速率成正比。

FSK还要再加上载波信号频率间的差值

#### 载波信号 carrier signal

+ 发送设备产生一个高频信号作为基波来承载信息信号
+ 接收设备将自己的收听频率调整到与所期望的发送设备载波频率一致
+ 数字信息通过改变载波信号的一个或多个特性（振幅，频率和相位）来调制载波信号
+ 这种形式的改变称为调制（移动键控）

> 收音机

## 幅移键控 ASK

通过改变载波信号的振幅来生成信号元素

### 二进制ASK BASK

> 有多少个电平，就有多少种振幅，ASK常用两个电平

一个信号电平的振幅峰值是0，另一个和载波信号相同

![image-20220310100254880](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/23de8763fd6c75e2ea6a109a4372a28c-image-20220310100254880-d9705a.png)

### ASK带宽

调制处理后信号变成了非周期复合信号，非周期复合信号由连续频谱

带宽与信号速率成正比，通常涉及另一个因子称为d，如绝育调制和过滤处理
$$
B=(1+d)\times S\\
d\in [0,1]
$$

+ 最大值是2S
+ 最小值是S
+ 载波频率$f_c$位于带宽中间
  + 如果有可用的**带通通道**
  + 可以选择合适的$f_c$从而占用该通道。

<img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/40b3731c475ca4291be3921a9f74a2e5-image-20220310101131987-b964f4.png" alt="image-20220310101131987" style="zoom:50%;" />

#### 例子1

![image-20220310101218055](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/7dff7f8f58a492c57d7d8c7e0403f1f6-image-20220310101218055-6d4c05.png)

### 多电平ASK

多于两个电平，可以使用4,8,16或更多振幅，一次对应2,3,4位或更多位。

不使用单纯的ASK实现，而是使用QAM实现

## 频移键控

+ 通过改变频率来表示数据
+ 调制后信号的频率在一个信号元素持续期间是固定的
+ 如果数据元素改变则下一个信号元素会变。

amplitude phase不变

### 二进制FSK BFSK

考虑两个载波频率。

+ 选择两个载波频率，$f_1$和$f_2$
  + 如果数据元素是0，使用第一个；
  + 如果数据元素是1，使用第二个
+ 通常两个载波频率很高，差值很小

![image-20220310103441090](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/375775e9cb6a41ae26515ba9fff47057-image-20220310103441090-055899.png)

一个带宽的中点频率是$f_1$，另一个中点频率是$f_2$

两个带宽都是$(1+d)S$

$f_2-f_1=2\Delta f$

#### BFSK带宽

$$
B=(1+d)\times S+2\Delta f \\
\Delta f \geq S
$$

#### 例子 🌰

![image-20220310103839284](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/0012b3b46f011647f4b487f3c543c2a1-image-20220310103839284-9a288b.png)

![image-20220310104128738](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/a80c6ab29c172ce8ac197050a357c316-image-20220310104128738-6c6859.png)

![image-20220310104112960](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/1edf6a19496ac0e0f325552f3f2de04e-image-20220310104112960-948c61.png)

#### 多电平FSK

使用多于两个频率（4,8,16）

**相邻频率相差2$\Delta f$(最小值为S)**

d=0时

![image-20220310104246234](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/accc1543dc73363fb943d90f3dd1542b-image-20220310104246234-dc2716.png)

![image-20220310104303871](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/227dd60d784b385af2f6e1ea9345b54f-image-20220310104303871-4ff716.png)

## 相移键控

通过改变相位来表示信号元素。

+ 比ASK和FSK更通用

### 二进制PSK BPSK

使用两个相位

+ 0
+ 180

![image-20220310104612854](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/904a812203aa98aded33e201e806ba09-image-20220310104612854-73336f.png)

优点：

1. PSK和ASK一样简单，但是比起ASK不受噪声影响
2. PSK优于FSK：不需要两个载波信号

### 带宽

$$
B=(1+d)S
$$

### 实现

![image-20220310104958446](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/83df45cd5c7d1a93901687318b986865-image-20220310104958446-54e46e.png)

极性NRZ信号乘载波频率

### 正交PSK QPSK

载波信号一个同相一个异相

![image-20220310120703601](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/bea84f4779d8f9fac0906c9981bf1606-image-20220310120703601-6b97c7.png)

![image-20220310120053256](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/567c89640a6c3e7fb771e28e85d53bbc-image-20220310120053256-addafe.png)

 ![image-20220310140911506](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/feb3bf14a586490ce723e8257ab22ace-image-20220310140911506-3659a0.png)

### 星座图 constellation diagram

+ 定义信号元素的**振幅和相位**
+ 一个信号元素由一个点表示。它携带的位或位组合写在旁边
+ 两根轴
  + X轴：同相载波相关
  + Y轴：正交载波相关
+ 每个点包含四个信息
  + 在X轴投影定义了同相成分的amplitude
  + 与Y轴投影定义了正交成分的amplitude
  + 到原点连线的长度：振幅
  + 角度：相位

![image-20220310143001966](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/dd0332698c3495036ceb2aca368ed7e9-image-20220310143001966-96fb85.png)![image-20220310143306788](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/b1ea8d276ccaddce456d320a51a5517d-image-20220310143306788-5d3bee.png)

## QAM Quadrature Amplitude Modulation 正交振幅调制

> PSK和ASK的结合

+ 一次改变**两种特性**
+ ASK + PSK
+ 使用两个载波
  + **一个同相**
  + **一个正交**
  + 每个载波**使用不同振幅**
+ 可能的变化有无穷多个

![image-20220310143830436](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/249f53776e1532a061dc96f3a25eaf82-image-20220310143830436-127791.png)

## 模拟信号调制（模拟到模拟转换）

如果介质具有**带通特性**或只有带通带宽可用。

那么模拟信号需要调制。

e.g.无线电，正负为每个无线电台分配基带带宽。每个电台生成的模拟信号都是低通信号，都在同一频率范围内。为了能收听不同电台，需要将低通信号平移，使每一个信号对应不同的频率范围

analog-to-analog conversion可以通过三种方法实现

+ 调幅 amplitude modulation AM
+ 调频 frequency modulation FM
+ 调相 phase modulation PM

### AM

+ 对载波信号调制
  + 使其（载波信号）振幅随调制信号的振幅变化而变化
  + 载波信号频率保持不变
+ 调制信号变成了包络线
+ 使用乘法器实现

![image-20220310145410840](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/683dcfd3e957a35cdcd24cb8364b6d80-image-20220310145410840-a15a73.png)

**AM带宽**

调制信号modulation signal带宽的两倍。

> 音频信号带宽通常为5KHz，所以调幅无线电台最小需要带宽是10kHz

$$
B_{AM}=2B
$$

### 调频 frequency modulation

![image-20220310145534256](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/a6cb1f3c09c6218b2cac33ee93951b55-image-20220310145534256-fff7ea.png)

**带宽**
$$
B_{FM}=2(1+\beta)B\\
\beta \text{一般为4}
$$
🌰

立体声广播的音频信号带宽接近15kHz。FCC允许每个调频电台使用200kHz的频率差，确保不重叠。
$$
B_{FM}=150
$$

### 调相 phase modulation

![image-20220310150905794](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/e1d4f4f0b6f64f34fd3cd041b58c82d3-image-20220310150905794-151293.png)

**带宽**

由调制信号的带宽和最大振幅确定

> $\beta$窄带大约是1，宽带大约是3

$$
B_{PM}=2(1+\beta)B
$$



![image-20220310145331565](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/b0f5d1e13d54cd28b4670d5850cf6756-image-20220310145331565-421769.png)

![image-20220310151108936](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/6e03677aca5be0887aaf4ef3b069e531-image-20220310151108936-bfa4c9.png)

![image-20220310151116462](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/ad62b0370217cae0537b18ec749d71ef-image-20220310151116462-2b82c8.png)

![image-20220310151742565](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/858d98de56c105105169f18e0ca21e2f-image-20220310151742565-b75d42.png)

![image-20220310151904439](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2022/03/10/54423a9e59830fc286c7623eab07dc0e-image-20220310151904439-847ba6.png)