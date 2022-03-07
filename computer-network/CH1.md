## 总线型

总线拓扑结构是多点连接，由一条较长的线缆作为主干来连接网络上的所有设备

![image-20211211113919116](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/3926a4f3c01713d5a3f48e4032f71938-image-20211211113919116-f90c90.png)

![image-20211211114301499](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/7447be3313c6c71e2de6ee3216ee839b-image-20211211114301499-119741.png)

+ **电信（telecommunication）**在一定距离上的通信
+ 数据：以任何格式表示的信息，该格式需要创建和使用数据的双方达成共识
+ 数据通信，在两台设备之间通过诸如线缆的某种形式的传输介质进行的数据交换

+ 组件：报文 发送方 接收方 传输介质 协议
+ 数据表示：文本 数字 图像 音频 视频
+ 数据流：单工 半双工 全双工

## 一、五个组件

![image-20211211115341719](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/ead72a693997878d3bdcefbe55ea4b62-image-20211211115341719-d96f56.png)

+ 报文（message）
+ 发送方 sender source
+ 接收方 receiver destination
+ 传输介质 transmission medium
+ 协议 protocol 管理数据通信的一组规则，表示通信设备之间的一组约定

## 二、数据的表示

![image-20211211115406573](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/a1f1197d776ee4317fbf34b2e907102f-image-20211211115406573-a9ca2d.png)

## 三、数据流

三种

![image-20211211144825334](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/4db9b41696e275f18e723d9f159ae007-image-20211211144825334-60f4c2.png)

## 四、网络

network是通信链路连接起来的设备（节点）的集合，一个节点是计算机，打印机或者**能够发送、接收由该网络上的其他节点产生的数据的任何其他设备**

## 五、分布式处理

+ 将任务给多台计算机
+ 集中式的反义词、分散的
+ 当前通信系统的流行处理方式

## 六、网络准则

+ 性能：
  + 吞吐量 throughput
  + 延迟 delay latency
+ 可靠性 Reliablity
  + 故障出现的频率
  + 故障恢复所花费的时间
  + 灾难中的健壮性
+ 安全性 Security
  + 保护数据免受未授权的访问
  + 传输过程中免受攻击

## 七、物理结构 Physical Topoloy

+ 链路 Link 将设备由一台设备传输到另一台设备的通信通路
+ 连接类型
  + 点到点（point to point）：
  + 多点连接 （multipoint connection, multidrop connection）：

![image-20211211150319167](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/4d2ad9bf353ca994aced1231f0d90bb0-image-20211211150319167-b044ad.png)

## 八、拓扑结构

![image-20211211150343577](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/2f27d12cd1ac8d2133779b8e0b72ec25-image-20211211150343577-27f3e3.png)

<img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/35ec91d58e5522babc1b1ca9be54b186-image-20211211150353225-1ff19a.png" alt="image-20211211150353225" style="zoom:50%;" /><img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/fea9aa4b3a856773c8137ced4675cbf0-image-20211211150416891-b11cea.png" alt="image-20211211150416891" style="zoom:50%;" />



<img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/684feb02fa329434886ed7887ad2ee1b-image-20211211150442762-311afe.png" alt="image-20211211150442762" style="zoom:50%;" /><img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/af6f510bd12a144cbab24eb85accf7f3-image-20211211150454953-7baf68.png" alt="image-20211211150454953" style="zoom:50%;" />

![image-20211211150615450](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/6801984a7d8e64a85e6463a4a0222148-image-20211211150615450-290541.png)![image-20211211150626653](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/51155a76d364e0d612bbcb68d95d61ee-image-20211211150626653-8ea69f.png)

环形

<img src="https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/50dbefcf6c7abd148033f177df1aa963-image-20211211150719641-11cb41.png" alt="image-20211211150719641" style="zoom:67%;" />

![image-20211211150907914](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/4d89bf4ae0db495b6bd7ba7a9705c876-image-20211211150907914-11363f.png)

混合型拓扑结构

![image-20211211151100962](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/9ffbeb4d4e1817176b4644801f260cf5-image-20211211151100962-2fdbca.png)

## 九、网络模型NetworkModel

+ OSI Open System Interconnection 模型：7层模型
+ Internet模型：5层模型

## 十、网络分类

按地理范围划分

| 名称   | 英文                      | 缩写 |
| ------ | ------------------------- | ---- |
| 局域网 | Local area network        | LAN  |
| 广域网 | Wide area network         | WAN  |
| 城域网 | metropolitan area network | MAN  |
| 个人网 | personal area network     | PAN  |

## 十一、因特网

internet：互联网：两个或多个可以互相通信的网络

Internet：因特网，I大写

### 因特网层次结构

![image-20211211152251266](https://cdn.jsdelivr.net/gh/xinwuyun/pictures@main/2021/12/11/ccb6ff44abcb28437539962b0e092955-image-20211211152251266-ff009b.png)

## 十二、协议和标准

协议是规则的同义词，然后讨论标准。

## 十三、协议

+ 协议
  + 通信内容
  + 通信方式
  + 通信时间
+ 要素
  + 语法syntax
  + 语义semantics
  + 时序timing
+ 标准：达成一致的规则

## 十四、标准的分类

+ 事实上的标准，TCP/IP
+ 法定的标准，OSI/RM













