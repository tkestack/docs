# 集群管理

# 概念
**在这里可以管理你的 Kubernetes 集群。**

> 注意：由于【平台管理】控制台下对集群的大多数操作与【业务管理】控制台完全一致，因此除了集群的【基本信息】和【节点管理】之外，其他栏目（包括命名空间、负载、服务、配置、存储、日志、事件）请参考【业务管理】控制台下[相应部分](../business-control-pannel/application)

# 操作步骤

平台安装之后，可在【平台管理】控制台的【集群管理】中看到global集群。如下图所示：
   ![Global集群](https://github.com/tkestack/tke/blob/master/docs/images/cluster.png?raw=true)

TKEStack还可以另外**新建独立集群**以及**导入已有集群**实现**多集群的管理**。

> 注意：**新建独立集群**和**导入已有集群**都属于[TKEStack架构](../../installation/installation-architecture.md)中的**业务集群**。

## 新建独立集群

1. 登录 TKEStack，右上角会出现当前登录的用户名，示例为admin。

2. 切换至【平台管理】控制台。

3. 在“集群管理”页面中，单击【新建独立集群】。如下图所示：
   ![新建独立集群](https://github.com/tkestack/tke/blob/master/docs/images/createCluster.png?raw=true)

4. 在“新建独立集群”页面，填写集群的基本信息。新建的集群需满足[installation requirements](../../../../docs/guide/zh-CN/installation/installation-requirement.md)的需求，在满足需求之后，TKEStack的集群添加非常便利。如下图所示，只需填写【集群名称】、【目标机器】、【密码】，其他保持默认即可添加新的集群。

   > 注意：若【保存】按钮是灰色，单击附近空白处即可变蓝

   ![集群基本信息0.png?raw=true](https://github.com/tkestack/tke/blob/master/docs/images/ClusterInfo.png?raw=true)

- **集群名称：** 支持**中文**，小于60字符即可

+ **Kubernetes版本：** 选择合适的kubernetes版本，各版本特性对比请查看 [Supported Versions of the Kubernetes Documentation](https://kubernetes.io/docs/home/supported-doc-versions/)。（**建议使用默认值**）

+ **网卡名称：** 最长63个字符，只能包含小写字母、数字及分隔符(' - ')，且必须以小写字母开头，数字或小写字母结尾。（**建议使用默认值eth0**）

+ **VIP** ：高可用 VIP 地址。（**按需使用**）

+ **GPU**：选择是否安装 GPU 相关依赖。（**按需使用**）

  + **pGPU**：平台会自动为集群安装 [GPUManager](https://github.com/tkestack/docs/blob/master/features/gpumanager.md) 扩展组件
  + **vGPU**：平台会自动为集群安装 [Nvidia-k8s-device-plugin](https://github.com/NVIDIA/k8s-device-plugin)

+ **容器网络** ：将为集群内容器分配在容器网络地址范围内的 IP 地址，您可以自定义三大私有网段作为容器网络， 根据您选择的集群内服务数量的上限，自动分配适当大小的 CIDR 段用于 kubernetes service；根据您选择 Pod 数量上限/节点，自动为集群内每台云服务器分配一个适当大小的网段用于该主机分配 Pod 的 IP 地址。（**建议使用默认值**）

  + **CIDR**： 集群内 Sevice、 Pod 等资源所在网段。

  + **Pod数量上限/节点**： 决定分配给每个 Node 的 CIDR 的大小。

  + **Service数量上限/集群** ：决定分配给 Sevice 的 CIDR 大小。

+ **目标机器** ：

  + **目标机器**：节点的内网地址。（建议: Master&Etcd 节点配置**4核**及以上的机型）

  + **SSH端口**： 请确保目标机器安全组开放 22 端口和 ICMP 协议，否则无法远程登录和 PING 云服务器。（**建议使用默认值22**）

  + **主机label**：给主机设置Label,可用于指定容器调度。（**按需使用**）

  + **认证方式**：连接目标机器的方式

    +  **密码认证**：
       +  **密码**：目标机器密码
    +  **密钥认证**：
       +  **私钥**：目标机器秘钥
       +  **私钥密码**：目标机器私钥密码，可选填

  + **GPU**： 使用GPU机器需提前安装驱动和runtime。（**按需使用**）

    > 输入以上信息后单击【保存】后还可**继续添加集群的节点**

5. **提交**： 集群信息填写完毕后，【提交】按钮变为可提交状态，单击即可提交。

## 导入已有集群

1. 登录 TKEStack。
2. 切换至【平台管理】控制台。
3. 在“集群管理”页面，单击【导入集群】。如下图所示：
   ![导入集群](https://github.com/tkestack/tke/blob/master/docs/images/importCluster-1.png?raw=true)

4. 在“导入集群”页面，填写被导入的集群信息。如下图所示：
   ![导入集群信息](https://github.com/tkestack/tke/blob/master/docs/images/importCluster-2.png?raw=true)

- **名称**： 被导入集群的名称，最长60字符
- **API Server**： 
  - 被导入集群的API server的域名或IP地址
- **CertFile**： 输入被导入集群的cert 文件内容
- **Token**： 输入被导入集群创建时的token值

1. 单击最下方 【提交】 按钮 。

## **对集群的操作**

#### 基本信息

1. 登录 TKEStack。

2. 切换至【平台管理】控制台。

3. 在“集群管理”页面中，点击要操作的集群ID，如下图“global”所示。

   ![Global集群](https://github.com/tkestack/tke/blob/master/docs/images/cluster.png?raw=true)

4. 点击【基本信息】，可查看集群基本信息

   ![](https://github.com/tkestack/tke/blob/master/docs/images/basicinformation.png?raw=true)

   1. 集群名称
   2. 集群ID
   3. 状态
   4. Kubernetes版本
   5. 网卡名称
   6. 容器网络
   7. 集群凭证：在本地主机安装kubectl后，可用过用户名密码或集群CA证书登陆到集群。
   8. 超售比：Kubernetes对象在申请资源时，如果申请总额大于硬件配置，则无法申请，但是很多时候部分对象并没有占用这么多资源，因此可以设置超售比来扩大资源申请总额，以提高硬件资源利用率。可通过超售比最后面的笔的符号对超售比更改
   9. 创建时间

#### 节点管理

1. 登录 TKEStack。

2. 切换至【平台管理】控制台。

3. 在“集群管理”页面中，点击要操作的集群ID，如下图“global”所示。

   ![Global集群](https://github.com/tkestack/tke/blob/master/docs/images/cluster.png?raw=true)

4. 点击【节点管理】中的【节点】，可查看当前集群的“节点列表”

   ![](https://github.com/tkestack/tke/blob/master/docs/images/nodes.png?raw=true)

5. 点击蓝色【添加节点】按钮可增加当前集群的Worker节点

   1. 目标机器：建议内网地址，要求添加的节点和当前集群的其他机器在同一内网。
   2. SSH端口：默认22
   3. 主机label：按需添加
   4. 认证方式：按需选择
   5. 用户名：默认root
   6. 密码：目标机器用户名为root的密码
   7. GPU：按需选择

6. 点击蓝色【监控】按钮可监控节点，可以从Pod、CPU、内存、硬盘、网络等维度监控

7. 对节点的可以的操作如下图所示：

   ![](https://github.com/tkestack/tke/blob/master/docs/images/nodecaozuo.png?raw=true)

   1. 移出：仅针对worker节点，将节点移出集群

   2. 驱逐：节点驱逐后，将会把节点内的所有Pod（不包含DaemonSet管理的Pod）从节点中驱逐到集群内其他节点，并将节点设置为封锁状态。

      > 注意：本地存储的Pod被驱逐后数据将丢失，请谨慎操作

   3. 编辑标签：编辑节点标签

   4. 编辑Taint：编辑Taint后，新的pod不能被调度到该节点，但可以通过编辑pod的toleration使其可以调度到具有匹配的taint节点上。

   5. 封锁：封锁节点后，将不接受新的Pod调度到该节点，需要手动取消封锁的节点。

8. 点击其中一个节点名，例如上图中的【172.19.0.154】，可以看到该节点更多的信息，具体包括：

   ![](https://github.com/tkestack/tke/blob/master/docs/images/nodespod.png?raw=true)

   1. Pod管理：可查看当前节点下的pod
      1. 销毁重建：销毁该pod，重新新建该pod
      2. 远程登录：登录到该pod的shell里
   2. 事件：关于该节点上资源的事件
   3. 详情：包括节点主机信息以及Kubernetes信息
   4. YAML：节点的YAML文件