

# 第二章网络模型

ISO是组织，OSI是模型

## OSI模型（7层）

+ 跨系统
+ 可理解并设计一个灵活、健壮和可互操作的网络体系结构
+ OSI模型提供了一个可以用来进行网络系统设计的层次化框架，由7个相互独立但又有互相关联的层次组成

![image-20211212091910521](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/5fd966007063e62a2c01478149bb1496-image-20211212091910521-755a3d.png)

![image-20211212091938749](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/f9eda6aedd13272bb127f2660138aacc-image-20211212091938749-57334a.png)

### 物理层

+ **物理介质**上传输位流所需的功能，定义了接口与传送戒指的机械和电气特性
+ 物理层负责**位**从一跳到另一跳的传递

![image-20211212092116375](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/9a3e5d496820d2810d07238c2d30efcc-image-20211212092116375-689eac.png)

![image-20211212092144018](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/d0407a0f4d4086f9d61ba3fa00a47374-image-20211212092144018-ff1a2a.png)



### 数据链路层

+ 将物理层的数据无差错地传递给网路层
+ 负责将帧从**一跳传递到下一跳**

![image-20211212092242901](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/fc37db23eef6dba08de597f998069eb4-image-20211212092242901-5b113a.png)

### 跳到跳的传递

![image-20211212092259447](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/9d444b2b158fd33a7eb6f9ee8c22f706-image-20211212092259447-358d80.png)

### 网络层

负责将各个分组**从源地址传递到目的地址**

+ 逻辑寻址
+ 路由选择

![image-20211212092333268](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/a2406c757cef6ac26005ecc60077abd2-image-20211212092333268-8b843e.png)

从源到目的地址

![image-20211212092421322](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/fc15c4c6cfd97997ff4e1f43e4821995-image-20211212092421322-e27f4e.png)

> 物理层和数据链路层都是**一跳到下一跳**

### 传输层

报文，从一个进程到另一个进程

![image-20211212095158514](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/4bd4823a79301bf26d65f09fcd7400aa-image-20211212095158514-41899d.png)

+ 报文
+ 进程到进程
+ 端到端可靠运输
+ 服务访问点SAP/端口Port（service access port）
+ 分段Segment和组装
+ 连接控制
+ 流量控制
+ 差错控制

### 一个报文在进程间的可靠传递

![image-20211212095353260](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/8bbb04803d0bcb851ee3f046180a910d-image-20211212095353260-ae2bac.png)

### 会话层session

+ 对话控制
+ 同步 同步点
+ 经常在套接字中使用

经常在套接字中使用

### 表示层

+ 翻译
+ 加密
+ 压缩数据

![image-20211212095605484](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/d35d270254f3e8bbb5e62b7134f825f6-image-20211212095605484-1d1e63.png)

### 应用层

向用户提供服务

## 二、TCP/IP协议族

> 一个是模型 一个是协议族

OSI之前开发的，并不与OSI模型的各层严格对应

## 三、四个层次

+ 物理层
+ 数据链路层
+ 网络层
+ 传输层
+ 应用层

![image-20211212095852294](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/5585324ebe5d03c8ae2ff2f5eb455a09-image-20211212095852294-c83a6d.png)

+ 所谓应用层占据了后三层
+ 传输层是 TCP UDP STCP
+ 网络层是IP（加上其他配套协议）

## 四、PDU 协议数据单元

PDU是指对等层次之间传递的数据单位。

+ **物理层**的——**数据位bit**
+ **数据链路层**——**数据帧**
+ **网络层**——**数据报**
+ **传输层——数据段**
+ 更高层次——数据

## 五、一些协议

![image-20211212100309149](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/6279be9a848734fa9df71a968c47bf3d-image-20211212100309149-2db68d.png)

![image-20211212100956091](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/a3261132f0ea83079e7a70aeb47175f5-image-20211212100956091-72bb35.png)

## 六、寻址

TCP/IP协议簇的应用网络中使用4层地址
+ 物理地址
+ 逻辑地址
+ 端口地址
+ 专用地址 Specific address

各层与地址的关系

![image-20211212101134712](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/9cc2f1971ac9da2d803b10f75493009d-image-20211212101134712-20056e.png)

## 七、物理地址

别名

+ 链路地址
+ 硬件地址、
+ MAC地址

局域网或广域网中定义的节点地址。

**包含在数据链路层的帧中**

最低级的地址

长度和格式可变，与网络有关。通常以以太网使用的网卡上的48位物理地址。

![image-20211212101446597](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/ec82543911c203d267a1537db68b7e3d-image-20211212101446597-f2ed23.png)

![image-20211212101456772](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/057beb48009d1ce189affe1ce7036077-image-20211212101456772-07ed2d.png)

## 八、IP地址🌰



![image-20211212101701372](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/3170a39813565f9f3c074a6c9bc9a705-image-20211212101701372-f0d0e2.png)



图显示了由两个路由器连接三个局域网的互联网的一部分。为了相互的连接，每个设备(计 算机或者路由器)都有一对地址(物理地址和逻辑 地址)。在这个例子中，每台计算机只与一个链路相连，因此只有一对地址。然而，**每个路由器和三个网络相连**(在图中只显示了两个)。因此**每个路 由器有三对地址，一对地址对应一个连接。**

## 九、端口地址🌰

![image-20211212101903452](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/12/47c01a3caf926ba862b73bcbf2abec6f-image-20211212101903452-6482b4.png)

两台计算机通过网络进行通信。 发送方计算机有三个进程正在进行，分别使用端口 **a**，**b**，**c**。同时，接收方计算机有两个进程正在进 行，端口地址分别是 **j** 和 **k**。在发送方计算机中的 进程 **a** 需要和在接收方计算机的进程 **j** 进行通信。 尽管从跳到跳物理地址会改变，但是逻辑地址和端 口地址从源地址到目的地址均保持不变。

---

# **跳到跳**过程中**物理地址**改变，**逻辑地址**不变

---

## 十、专用地址

面向对象应用被设计为专用地址

mail://xxxx

ftp://xxxx























