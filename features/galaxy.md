# Galaxy

Kubernetes没有提供默认可用的容器网络，但kubernetes网络的设计文档要求容器网络的实现能做到下面的三点：

1. all containers can communicate with all other containers without NAT
1. all nodes can communicate with all containers (and vice-versa) without NAT
1. the IP that a container sees itself as is the same IP that others see it as

即集群包含的每一个容器都拥有一个与其他集群中的容器和节点可直接路由的独立IP地址。但是Kubernetes并没有具体实现这样一个网络模型，而是实现了一个开放的容器网络标准CNI，可以自由选择使用开源的网络方案或者实现一套遵循CNI标准的网络，为用户提供两种网络类型：

1. Overlay Network，即通用的虚拟化网络模型，不依赖于宿主机底层网络架构，可以适应任何的应用场景，方便快速体验。但是性能较差，因为在原有网络的基础上叠加了一层Overlay网络，封包解包或者NAT对网络性能都是有一定损耗的。
1. Underlay Network，即基于宿主机物理网络环境的模型，容器与现有网络可以直接互通，不需要经过封包解包或是NAT，其性能最好。但是其普适性较差，且受宿主机网络架构的制约，比如MAC地址可能不够用。

为满足复杂应用容器化的特殊需求，大幅拓展了容器应用的场景，TKEStack利用Galaxy网络组件提供多种解决方案，支持overlay和underlay网络类型，支持高转发性能和高隔离性等场景应用。

[Galaxy](https://github.com/tkestack/galaxy)是一个Kubernetes网络项目，旨在为POD提供通用Overlay和高性能的Underlay网络。

TKEStack使用Galaxy网络组件，支持四种网络模式，并且可以为工作负载单独配置指定的网络模式，拓展了容器应用场景，满足复杂应用容器化的特殊需求。

1. Overlay网络

   TKEStack的默认网络模式，基于IPIP和host gateway的flannel方案，同节点容器通信不走网桥，报文直接利用主机路由转发；跨节点容器通信利用IPIP协议封装, etcd记录节点间路由。该方案控制层简单稳定，网络转发性能优异，并且可以通过network policy实现多种网络策略。
1. Floating IP

   容器IP由宿主机网络提供，打通了容器网络与underlay网络，容器与物理机可以直接路由，性能更好。容器与宿主机的二层连通, 支持了Linux bridge/MacVlan/IPVlan和SRIOV, 根据业务场景和硬件环境，具体选择使用哪种网桥
1. NAT

   基于k8s中的hostPort配置，并且如果用户没有指定Port地址，galaxy会给实例配置容器到主机的随机端口映射
1. Host

   利用k8s中的hostNetwork配置，直接使用宿主机的网络环境，最大的好处是其性能优势，但是需要处理端口冲突问题，并且也有安全隐患。

## Galaxy架构

Galaxy在架构上由三部分组成：

1. Galaxy:  以DaemonSet方式运行在每个节点上，通过调用各种CNI插件来配置k8s容器网络
1. CNI plugins: 符合CNI标准的二进制文件，用于网络资源的配置和管理, 支持CNI插件[Supported CNI plugins](https://github.com/tkestack/galaxy/blob/master/doc/supported-cnis.md)
1. Galaxy IPAM: K8S调度插件，用于Float IP的配置和管理

### Galaxy Overlay 网络

![Galaxy Overlay Networks](image/galaxy.png)

[tke-installer](https://github.com/tkestack/tke/blob/master/docs/user/tke-installer/README.md)安装tkestack并自动配置galaxy为overlay网络模式，在该模式下：

1. Flannel在每个Kubelet上分配一个子网，并将其保存在etcd和本地磁盘上(/run/ Flannel /subnet.env)
1. Kubelet根据CNI配置启动SDN CNI进程
1.SDN CNI进程通过unix socket调用Galaxy，所有的args都来自Kubelet
1. Galaxy调用FlannelCNI来解析来自/run/flannel/subnet.env的子网信息
1. Flannel CNI调用Bridge CNI或Veth CNI来为POD配置网络

### Galaxy Underlay 网络

![Galaxy Underlay Networks](image/galaxy-ipam.png)

如需配置underlay网络，需要启用Galaxy-ipam组件，Galaxy-ipam根据配置为POD分配或释放IP：

1. 规划容器网络使用的Underlay IP，配置floatingip-config ConfigMap
1. Kubernetes调度器在filter/priority/bind方法上调用Galaxy-ipam
1. Galaxy-ipam检查POD是否配置了reserved IP，如果是，则Galaxy-ipam仅将此IP所在的可用子网的节点标记为有效节点，否则所有都将被标记为有效节点。在POD绑定IP期间，Galaxy-ipam分配一个IP并将其写入到POD annotations中
1. Galaxy从POD annotations获得IP，并将其作为参数传递给CNI，通过CNI配置POD IP

## Galaxy配置

- [Galaxy configuration](https://github.com/tkestack/galaxy/blob/master/doc/galaxy-config.md)
- [Galaxy-ipam configuration](https://github.com/tkestack/galaxy/blob/master/doc/galaxy-ipam-config.md)
- [Float IP usage](https://github.com/tkestack/galaxy/blob/master/doc/float-ip.md)


## 常见问题

1. 为pod配置float ip失败
    1. 检查ipam扩展组件是否已正确安装
    1. 检查kube-scheduler是否正确配置scheduler-policy
    1. 检查floatingip-config ConfigMap是否配置正确
    1. 检查创建的Deployment工作负载：
        1. 容器限额中配置 tke.cloud.tencent.com/eni-ip:1
        1. 容器annotation中配置 k8s.v1.cni.cncf.io/networks=galaxy-k8s-vlan
    如果上述配置都正确，pod会被成功创建并运行，galaxy-ipam会自动为pod分配指定的Float IP