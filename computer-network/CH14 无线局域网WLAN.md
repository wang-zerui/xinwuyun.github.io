# CH14 无线局域网WLAN

![80971692_p0](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/a590d703d8168ef2de4db99e75ba05b2-80971692_p0-fa9fc2.jpeg)

## 一、IEEE 802.11

IEEE定义的无线局域网规范

涵盖

+ 物理层
+ 数据链路层

### 体系结构

+ 基本服务集（BSS）
+ 扩展服务集（ESS）

## 二、基本服务集BSS

**Basic Service set BSS**

无线局域网的积木块

一个基本服务集由

+ 固定的或移动的**无线站点**
+ 访问点**（Access point ，AP）**的**中央基站**

![image-20211223154152901](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/ef82631243fe1d001041c2c10c69ee81-image-20211223154152901-5c209e.png)

## 三、扩展服务集

**Extend Service Set ESS**

+ 两个或更多个带有AP的BSS组成。
+ 通过一个分布式系统（通常是有线局域网将各个BSS连接在一起）。
+ 分布式系统连接到AP，
+ 该分布式系统可以是任何的IEEE局域网
  + 以太网

> 注意，包含两种类型的站点
>
> + 移动站点：BSS内的一个普通站点
> + 固定站点：属于有线网络的一部分的AP站点

> 注意：一个移动站点可以同时属于多个BSS

![image-20211223155445080](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/aa8ff21e50c22d45069f5116178afd91-image-20211223155445080-172d89.png)



## 站点类型

根据站点在无线局域网中的**移动性**

IEEE 802.11分为三种类型

1. 不迁移：固定的或仅在BSS**内部移动**
2. BSS迁移：站点可以从一个BSS**移动到另外一个****BSS**，但仅在一个ESS中
3. ESS迁移：站点可以从**一个ESS移动到另一个ESS**，不保证通信在移动中是连续的

## MAC层

IEEE 802.11定义了两个MAC层

+ 分布式**协调**功能（DCF）
+ 点**协调**功能（PCF）

![image-20211223162318973](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/237c51daec6f43411f63de67d8ad13bb-image-20211223162318973-0a3fec.png)

![image-20211223162528811](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/78d36900d045a0696fd78955231873d4-image-20211223162528811-1c0a8c.png)

> 局域网的IEEE标准
>
> ![](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/faa3dc4e4b2e214ebf310e7fbf5fc7f1-image-20211223162543639-0a46a6.png)

### **分布式协调功能**

IEEE在**MAC子层**定义的两种协议之一称为**分布式协调功能（distributed coordination function DCF）**。

DCF使用**CSMA/CA**作为访问方式，

> Link{@ CH12}

不能用**CSMA/CD**

1. 为了进行冲突检测：站点必须能够同时发送数据和接收冲突信号
2. 因为隐藏的站点问题：可能检测不到冲突
3. 站点间的距离可以很大：信号衰减会使得一端的站点无法侦听到另一端的冲突

![image-20211223165335347](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/a17e99fcdc2e97e3b180f7e3ce454720-image-20211223165335347-3c0ca0.png)

### **处理流程图**

CSMA/CA

+ 为CSMA增加了一个冲突避免（Collision Avoidance）
+ 在使用CSMA/CA的同时**还增加使用确认机制**

![image-20211223165009084](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/17ff3adc5cb43cd3963034d34ba1be20-image-20211223165009084-90b5db.png)

### **帧交换时序CSMA/CA**

1. 在发送一个帧之前，源站点**通过检测载波频率的能量级来侦听介质**
   1. 在通道空闲之前，通道使用**带有补偿的持续策略**
   2. 站点发现通道空闲之后，它等待一个**DIFS（分布式帧间间隔）**的时间周期，然后发送一个请求发送的**控制帧**
2. **目的**端**接收到RTS并等待一个SIFS**（short interframe space， SIFS）的短暂时间
3. **目的端**向**源站点**发送一个**清除发送（CTS）**的**控制帧**
4. **源端**等待一个与SIFS相等的时间，发送数据
5. **目的端**收到，等待一个**SIFS**，发送ACK（在这个协议中，没有任何方法检查数据是否已经成功到达目的站点）

> CSMA/CD中没有冲突就是向源站点表示数据已经到达

### NAV**网络分配矢量**（**冲突避免**）

*如果一个站点获得访问，那么其他站点需要**推迟**发送数据*

1. 当一个站点发送RTS帧（Request To Send），它**包含了需要占据通道的时间**。

   > 一个站点发送时，其他站点不能发送

2. 受这一传送所影响的站点建立一个**网络分配矢量（network allocation vector NAV）**的**定时器**

3. NAV指出允许这些站点**下次检测还需要多长时间**
   1. 也就是 每个站点检查物理介质是否空闲之前必须检查NAV是否过期

#### 握手冲突

![image-20211223204944343](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/711ade5f122a4c416fc549f30315546b-image-20211223204944343-440b90.png)

#### 点协调功能（PCF）

Point coordination function ,PCF。它在DCF的上面实现，主要用于**对时间敏感的传输**

+ 集中式、无竞争轮询方式
+ AP对可以被轮询的**站点**进行轮询
+ 站点依次被轮询，将数据发送给AP
+ 有比DCF更高的优先级
  + 定义了另一套**帧间间隔（interframe space）**
    + PIFS比DIFS端
    + SIFS与DCF的一样
  + 意味着如果同一个站点想用DCF，一个AP想用PCF，AP有优先权

![image-20211223212731183](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/1a68cba8764a41b33726eac1efc11499-image-20211223212731183-8b957a.png)

#### 分段

**为什么分段？**

无线环境噪声很多，被毁坏的帧必须重传。将一个大的帧分割为多个更小的帧。

**帧格式**

![image-20211224093353088](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/f2870ab7250459e03a36ee27f7079370-image-20211224093353088-0d7ece.png)

MAC层包含9个字段

+ 帧控制（FC）：FC字段为2字节，定义了一个**帧的类型和一些控制信息**

  ![image-20211223214028987](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/affb56642adfbfde99fa63198161699e-image-20211223214028987-dcef6f.png)

+ D：定义了用于设置NAV值的时间间隔时间。在一个控制帧中，这个字段用来定义帧的ID

+ 地址：有4个地址字段，每个6字节。![image-20211223213921708](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/9345221827572ceb6b7568f6d41a3a07-image-20211223213921708-d6c111.png)

+ 序列控制：本字段定义帧的序列号，用于流量控制

+ 帧主体：0~2312字节

+ FCS：4字节 CRC-32差错检测序列

![image-20211223214119141](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/96a501b56c506c267a84d7d4e89e54cf-image-20211223214119141-d51062.png)

## 寻址机制

四种情况，由FC字段两个标记定义。每一个标记可能是0或1。

MAC帧的四种地址地址1~4的解释取决于这些标记的值

![image-20211223215744859](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/789e8b34400c23010da18e1897b5e2d1-image-20211223215744859-feb293.png)

![image-20211223215754823](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/fd4eb141f1ce8b88456d5582e010ea69-image-20211223215754823-9d3ce4.png)

![image-20211223215808146](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/88708e7d558e71535e38816b4308d41f-image-20211223215808146-574f34.png)![image-20211223215821055](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/23/93ddf1b843804f4a943930202fce977d-image-20211223215821055-89224e.png)

## 隐藏站点和暴露站点问题

![image-20211224093452829](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/88e5062c3a7f64e4b8ab5baeb9822584-image-20211224093452829-d8f1e5.png)



![image-20211224095704730](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/53028f1306d59236ba28cd8bae705e0a-image-20211224095704730-74b52f.png)

![image-20211224095713071](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/68b045dc2178dd632047e500aef88b87-image-20211224095713071-3455b7.png)

![image-20211224095721254](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/5adc1f9f33a400c9ec95c0a8dbf8eaa9-image-20211224095721254-a46094.png)

![image-20211224100221356](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/5dc433bcd7ed62d0447749f717620bb7-image-20211224100221356-a87f9c.png)

![image-20211224100258652](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/01f34e9499340b1bab4f3b11c064041c-image-20211224100258652-5cd350.png)

![image-20211224100314536](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/126f403592259a59f272102cabc51dc3-image-20211224100314536-e942f9.png)

![](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/6eedd3e950740e52f36501f343350e5a-image-20211224100324416-d8c2e7.png)

![image-20211224100334814](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/24/19a1bb253950502e04b1e8e1dd93b70c-image-20211224100334814-a715d7.png)













