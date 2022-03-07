# CH20IP协议

# 考点

### 第20章 *IP*协议

1. IP*分组（数据报）的格式*
1. *分片(Identification*、*Flags*、*Fragmentation offset*）、何处分片和重装
1. MTU
1. IPv6分组格式
1. IPv4到IPv6的过渡

## 网际互联

网络的物理层和数据链路层在本地运行。这两层共同负责网络相邻节点间的数据传递。

![image-20211225213850929](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/25/afee6dea988281415d39e0e0d41c2f9d-image-20211225213850929-83527e.png)

这个互联网由五个网络组成：四个LAN一个WAN。

A发送数据分组到D需要经过三个链路，每个链路包括两个物理层和数据链路层

> S1如何知道应该从f3接口发送出去，前两层没有规则帮助R1做出正确决策。而且，**帧也没有携带任何路由选择信息**。帧中只包含主机A的MAC地址和S1的MAC地址

## 网络层需求

网络层负责

1. 主机间的传递
2. 通过路由器或交换机对分组进行**路由选择**

## 网络层总的思想

**源端网络层**：将来自另一个协议的输入数据生成一个分组，分组的头部包含源和目的逻辑地址以及其他信息。网络层负责检验路由表寻找路由选择信息。如果分组太大，就要分段。

**交换机或路由器中的网络层：**当一个分组到达时，路由器或交换机就从他的路由选择表中找到一个必须将其发送出去的接口。**改变头部的某些内容后的**分组按照路由选择信息再传送给数据链路层

**目的端的网络层负责地址验证**：确保分组组中的目的地址与主机地址是相同的。*如果分组是一个分段，网络层就等待所有的分段到达后再对其进行重组*，然后再将重组后的分组交给传输层。

![image-20211225214753748](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/25/82e5c7215b0d79804c1f8aaf068d3b91-image-20211225214753748-1a3da5.png)

![image-20211226103500119](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/c3ba92ef40f0bf79c35036c8610156f0-image-20211226103500119-7f6c05.png)

## 作为数据报网络的因特网

交换可以分为

1. 电路交换
2. 分组交换
   1. 虚电路方法
   2. 数据报方法
3. 报文交换

在网络层，因特网使用数据报交换方法。它利用网络层所定义的全球地址，从源端到目的端路由分组

> 因特网的网络层交换是利用数据报分组交换的方法实现的

### **作为无连接网络的因特网**

#### 面向连接的服务

1. 源端首先与目的端建立一个连接
2. 连接建立，分组按照顺序依次沿着相同的路径发送
3. 所有报文的所有分组传递完毕，连接终止

一个连接建立后，对具有相同源和目的地址的分组序列，只会进行一次路由策略。

#### 连接服务

1. 网络层协议独立地对待每个分组，**每个分组与其他分组没有联系**，每个分组与其他分组没有联系。一个报文（传输层来的）中分组可能会沿着不同的路径到达其目的地。

因特网网络层通信无连接

> 注:无连接是指交换机或路由器不保存有关连接状态的信息，不需要建
> 立连接，也不需要拆除连接。

> + 因特网中的网络层交换是利用数据报分组交换的方法实现
> + 分组传递可利用面向连接的服务来实现，也可以利用无连接服务实现
> + 因特网的网络层通信是无连接的

------

## IPv4

**网际协议第四版**

TCP/IP

![](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/ad550495da0d0f62eb4dbfc305b983e7-image-20211226154745623-9eff5b.png)

+ IPv4是TCP/IP协议中使用的传输机制。
+ IPv4是一种不可靠的无连接数据报协议——尽力传递。**尽力传递这一词是指IPv4协议不提供差错控制或流量控制**
+ IPv4**假定底层不可靠**
+ IPv4必须与可靠协议（如TCP结合使用）配合
+ IPv4也是使用数据报的分组交换网的无连接协议
  + 每一分组独立进行处理
  + 每一分租通过不同路由传递到目的端
  + 有些数据报可能遗失或损坏

### 数据报

IPv4层的分组称为**数据报datagram**。

<img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/6b6b684b38935fcafb71446038a9c095-image-20211226160348148-882b86.png" alt="image-20211226160348148" style="zoom:60%;" /><img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/0193ffa2c95947e0291a40d8c9dbab2a-image-20211226160400766-b6d2bd.png" alt="image-20211226160400766" style="zoom:40%;" />

![image-20211226163522372](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/7501804a2f310f339eb76cf45a52ed4e-image-20211226163522372-2347b9.png)

#### VER版本4位

占4bit，IP协议版本

0010

#### HLEN首部长度4位

单位长度4字节，头部最小字节20，不能小于5000000000

IP首部长度最大60字节（$15\times 4$）

#### Service服务类型8位

用来获得更好的服务

![image-20211226161314603](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211226161314603.png)

![image-20211226161400114](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/10801c9f5cb81b0616a80544ac064dcf-image-20211226161400114-ba0375.png)

![image-20211226161522621](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211226161522621.png)

![image-20211226161543733](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211226161543733.png)

#### Total Length总长度16字节

首部和数据之和的长度，单位为字节。数据报最大长度为65535字节。总长度不能超过最大传送单元MTU



以太网限制帧中数据报的长度在46到1500字节之间，当数据报长度小于46字节，必须进行填充(pading)

**数据长度的计算方法**

为了找到从上层来的数据长度，可以将总长度减去头部长度。将HLEN字段的值乘以4就可以得到头部长度
$$
数据长度=总长度-头部长度
$$
这个字段16位长，因此IPv4数据报长度限制在65535字节，其中头部占20到60字节，剩下的是从上层来的数据

> 实际上某些网络不能将65535字节的数据报封装成他们的帧，这样的话数据报必须分段
>
> 许多情况下，不用读取这个字段，但是有些时候封装在一个帧中的不仅仅是数据报，还有**填充**。比如，以太网限制数据字段大小为46~1500，如果数据报长度小于46字节，必须增加填充字节才能符合要求。
>
> 一个小的数据封装在以太网帧中
>
> ![image-20211226162700587](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/0b8606ffc3bd99a01d3ce99b7e849664-image-20211226162700587-13cb52.png)

#### 标识Identification 16位

是一个计数器，用来产生数据报的标识。用于分段中

#### 标志flag 3bit 只有最后两位有意义

![image-20211226165931051](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/97e6ecb9aa3a2dfb32769bb48fa23c86-image-20211226165931051-efd4ec.png)

![image-20211226170114604](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/bb829b930bb6b7caff872765866d616f-image-20211226170114604-13c1cb.png)

#### 片偏移fragmentation offset13位

较长分组在分片后某片在原分组中的相对位置，8bit为偏移单位

#### 生存时间Time To Live 8bit

数据报可以在网络中通过路由器的个数的最大值

#### 协议Protocol 8bit

协议(8 bit)字段指出此数据报携带的数据使用何种协议， 以便目的主机的 IP 层将数据部分上交给那个处理过程。

![image-20211226171338926](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/0612834df5769747bf99ef093175f202-image-20211226171338926-aa5207.png)

![image-20211226171455352](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/211dbedcb983a4fc1d45de2d034e19d5-image-20211226171455352-36875e.png)

#### 首部检验和Checksum

值检测首部，不包括数据部分。使用简单计算方法

![image-20211226171600068](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/d5379fe057abe72aec22a3a3a2f3df43-image-20211226171600068-062c38.png)

![image-20211226172346990](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/a76fea2c8f043034d55d83d2a2b989aa-image-20211226172346990-43ddb9.png)

![image-20211226173019032](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/ea2e488360210feef424398b66013ea9-image-20211226173019032-bd8391.png)

### 例子🌰

#### 一个IPv4分组的前8位如下

01000010

前4位是版本，后四位为HLEN

版本正确。后四位是2，$2\times {4}=8$字节数为8，头部字节最小字节数20，最大60

#### HLEN

头部长度字段的值为1000，问这个分组携带的选项是几个字节。

答：12字节

#### 计算数据长度

IPv4分组，头部长度字段的值为5，总长度字段的值是0x0028，问这个分组携带的数据是多少字节？
$$
32+8=40\\

40-20=20bytes
$$

```
|VER|HLEN|SERVICE     |   TOTAL_LENGTH   |
|    IDENTIFICATION   |FLAG|OFFSET       |
|TIME_TO_LIVE|PROTOCOL|HEADER_CHECKSUM   |
|Source IP Address                       |
|Destination IP Address                  |
```

#### TTL

0x45000028000100000102 . . .

01，还能1跳。

PROTOCOL是02，是IGMP

## 分段

+ 一个数据报可以通过几个不同的网络进行传输
+ 每个路由器将它所接收到的帧拆封称IPv4数据报，对其进行处理，再封装成另一个帧
+ 接收到帧的格式和长度取决于此帧**刚刚经过的**物理网络所使用的协议
+ 发出去的帧的格式和长度则取决于**将要经过的**物理网络所使用的协议
+ 例如：如果一个路由器将一个局域网连接到一个广域网
  + 接收到：局域网帧
  + 发送：广域网帧

### MTU最大传输单元

每个数据链路层协议都有自己的帧格式，这格式定义的一个字段是数据字段的最大长度。

当数据报封装成帧时，该数据报的总长度必须小于**最大数据长度**

![image-20211226203856936](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/b774aef2b2bb831bfe3aac58c72a52ec-image-20211226203856936-16fe29.png)

某些网络的MTU值

+ 超级通道Hyperchannel: 65535
+ 令牌环16Mbps： 17194
+ 令牌环4Mbps：4464
+ FDDI：4352
+ 以太网：1500
+ X.25：576
+ PPP：296

源端通常不对IPv4分组进行分段，传输层将数据分割成适合在数据链路层所用IPv4的长度

当对一个数据报进行分段时，每个分段都有其自己的头部：

1. 头部中的某些部分需要被复制到所有的分段中
2. 修改三个字段
   1. 标识
   2. 分段偏移
   3. 总长度

### 与分段有关的字段

+ 标识identification：标记一个从源主机发出的数据报，唯一定义这个数据报。

  + 为了保证唯一性，IPv4协议**使用一个计数器**标识数据报
  + 发送数据报时，就将该计数器的值**复制到标识字段**中
  + 只要该计数器保存在主存中，唯一性就得到保证
  + 所有分段该字段相同
  + 目的端据此进行重组

+ 标记flag

  + Reserved
  + Dont fragment
    + 1不分段：如果通不过该网络，则丢弃并向源主机发送一个ICMP差错报文
    + 0，根据需要对数据报进行分段
  + More fragment：多分位段
    + 1：表明不是最后的分段
    + 0：是最后的分段或唯一分段

+ 分段偏移

  + 表示这个分段在整个数据报中的相对位置
  + 8字节为度量单位

  ![image-20211226210914387](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/4fd7832eb63ae2dd9916f895a9019ad0-image-20211226210914387-db572a.png)





## 校验和

![image-20211226220108055](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211226220108055.png)

![image-20211226220201771](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/7abfcd850734abc4549c39a0492da6cd-image-20211226220201771-c477dc.png)

## IPv6

+ 地址空间更大
+ **层次结构**扩展性强
+ 首部格式灵活
+ 改进的选项
+ 允许协议继续扩种
+ 支持即插即用
+ 支持资源的预分配
+ 支持更多的安全性
+ 首部改为8字节对齐

### IPv6数据报头部和有效载荷

![image-20211226220432836](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/ad31ef9e1890c2de23766f2d1bec1f81-image-20211226220432836-28246c.png)

![image-20211226220515511](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/a56cb7092af58a708d1f60d382cedc5f-image-20211226220515511-7677ad.png)

#### 版本Version 4bit Version

0110

#### 优先级 4bit Traffic Class

发生通信量拥塞时分组的优先级

+ 可进行拥塞控制的通信量
+ 不可进行拥塞控制的通信量

#### 流标号 24bit Flow Label

流是互联网络上从特定源点到特定终点的一系列数据报，“流”所经过的路径上的路由器都保证指明的服务质量。所有属于同一个流的数据报都具有同样的流标号

#### 有效载荷长度 Payload length 16bit

指明IPv6数据报除**基本首部**以外的字节数

#### 下一个首部 next header

8bit 相当于IPv4的protocol或可选字段

#### 跳数控制 hop limit

跳数限制

#### 数据报格式

![image-20211226221458833](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/2c7d1e2d63b9769dc83a86f88b15a813-image-20211226221458833-b8b494.png)

## 

![image-20211226222422630](/Users/xinwuyun/Library/Application Support/typora-user-images/image-20211226222422630.png)



## 4to6过渡

因特网上系统非常多，从IPv4到IPv6的过渡不能突然发生。要使每一个系统从IPv4过渡到IPv6，需要花费相当长的时间，

### 三种过渡策略

+ 双协议栈
+ 隧道技术
+ 头部转换

## 过渡.双协议栈

+ 过渡到v6之前，使用**双协议栈dual stack**
+ 分组发送到目的端时
+ 主机向DNS查询，
+ 如果返回一个IPv4地址，源主机就发送IPv4分组，
+ 如果返回IPv6分组，就发送一个IPv6分组

## 过渡.隧道技术

当两台使用IPv6计算机互相通信，通过Ipv4区域时，使用隧道技术。

进入时封装成4分组，离开时去掉封装

![image-20211226223845288](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/094e9d779368e209f323d30b7f9413df-image-20211226223845288-d6212f.png)

## 头部转换

![image-20211226224015735](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/af2be377dffe15bda3b5c897085bfaa8-image-20211226224015735-48c5c3.png)

![image-20211226224037248](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/80b735288bc3aade4658f83e3f3e9adb-image-20211226224037248-6b71f3.png)

![image-20211226224049030](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/74c453227e994f9e34915167770d9c3c-image-20211226224049030-e6ac0b.png)

![image-20211226224339473](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/2da43105f765bdb4c5ae1da99660a2c7-image-20211226224339473-bca1ad.png)

![image-20211226224346756](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/26/3db2a9141d004dace6938eb6f1db2ae4-image-20211226224346756-78e5a9.png)

0x45 00 00 54 00 03 00 00 20 06 58 41 7C 4E 03 02 B4 0E 0F 02







