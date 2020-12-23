# 1.3

## TKEStack Release v1.3.0

TKEStack v1.3.0 版本已于本周发布，相较上一版本（v1.2.x）增强了用户权限，业务能力，优化日志、审计及监控告警等功能，支持最新 K8S v1.18.3 及 v1.16.9 版本，同时修复大量影响业务功能和使用体验的bug。

TKEStack 是腾讯内部几大团队合力打造的开源版本，总结了多年来腾讯在云原生领域的经验和技术积累，吸收了 Gaia 平台、TKE 公有云以及腾讯内部众多容器产品的优点，全新打造的面向私有云业务场景的开源容器平台。

本次版本重点增强用户权限及业务管理能力，区分平台用户和业务用户，平台用户负责维护平台下集群，节点，业务及运维中心等资源，保障平台的正常运行和资源的可用； 业务用户专注自身业务应用的配置管理和部署发布，通过统一提供的配额、命名空间以及镜像仓库等管理能力，方便用户在多集群场景下编排业务应用。

本版本还在日志功能上有较大重构和增强，对原有 logcollector 扩展组件进行降级处理，增加了 logagent 日志组件设置页面，用以控制集群的日志采集功能。 支持在工作负载创建时配置日志目录，指定日志输出的数据卷和挂载点；在详情页的日志面板下，支持查看日志文件的内容并能够下载日志文件。 增加了业务管理视图下日志采集页面，支持对命名空间下的工作负载、容器等配置日志采集规则。完备的采集策略将支持用户全程监控记录业务应用运行数据，及时高效地发现和定位问题。

新增审计功能，记录并保存用户操作记录，并提供独立的页面方便管理员集中查看和搜索审计记录，满足相关机构对平台安全合规的要求。 同时优化大量监控告警等指标参数，并支持多种通知告警渠道帮助管理员第一时间发现平台问题。更多优化请参考 [Major Feature and Enhancements](https://github.com/tkestack/tke/wiki/release-1.3#major-feature-and-enhancements)

### Installation

参考 [QuickStart](https://github.com/tkestack/tke#quickstart) 指引快速安装部署TKEStack平台。

AMD64版本

```text
arch=amd64 version=v1.3.0 && wget https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-$arch-$version.run{,.sha256} && sha256sum --check --status tke-installer-linux-$arch-$version.run.sha256 && chmod +x tke-installer-linux-$arch-$version.run && ./tke-installer-linux-$arch-$version.run
```

ARM64版本

```text
arch=arm64 version=v1.3.0 && wget https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-$arch-$version.run{,.sha256} && sha256sum --check --status tke-installer-linux-$arch-$version.run.sha256 && chmod +x tke-installer-linux-$arch-$version.run && ./tke-installer-linux-$arch-$version.run
```

### Changelog since v1.2.4

完整的修改日志请查阅 [changelog](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.3.md)

A complete changelog for the release notes please check at [changelog](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.3.md)

### Major Feature and Enhancements

用户权限

* 增加预设平台策略：平台管理员、平台用户、平台租户，允许用户在新建或更新时绑定不同的平台策略权限，更支持为用户自定义独立的权限，方便管理平台视图下集群，业务，扩展组件及运维中心等功能。
* 增加预设业务策略：业务管理员、业务成员、只读成员，同时支持配置自定义业务权限，允许用户为不同业务绑定不同的业务权限，方便用户在业务视图下实现更细粒度的权限控制。

业务管理

* 增强业务管理功能，支持用户在业务管理视图下查看自身业务详情，包括资源配额、成员列表、子业务及命名空间，具有业务管理员权限的用户可以管理自身业务的成员、子业务和命名空间。
* 平台管理员负责管理各个业务的配额，支持根据不同集群设置不同配额。支持子业务的解除和导入，支持命名空间在不同业务下迁移。
* 支持生成业务下命名空间访问凭证，获得访问凭证\(kubeconfig\) 的用户有权限访问和操作\(kubectl\) 指定命名空间下的资源.

日志

* 新建工作负载时支持配置日志目录，指定日志输出的数据卷和挂载点。在pod详情页中的日志面板下，支持查看文件日志的内容。
* 平台管理视图下增加了日志组件设置页面，同时在集群基本信息页面也增加日志组件按钮，用以控制开启或关闭集群的日志采集功能。
* 业务管理视图下增加日志采集页面，支持命名空间下的工作负载、容器等配置日志采集规则。
* 对 logcollector 组件进行降级处理，已安装 log-collector 组件的可以删除，未安装 log-collector 组件的将无法新增安装，前台代码还对各处的 logAgent 和 logCollector 做了兼容处理

审计

* 新增审计功能，记录并保存用户操作记录，包括时间、操作人、操作类、集群、命名空间、资源类型、操作对象及操作结果，并有独立的页面方便管理员集中查看审计记录。

监控告警

* 升级后台 prometheus 至 v2.16.0，增加对 prometheus 的资源配额限制
* 优化业务指标页面数据，优化工作负载监控页面展示
* 创建告警支持选择某一个 ns 下所有 pod/ 某一个 ns 下某一类工作负载的 pod。新增对 tapp 类型的告警和监控支持。
* 新增历史告警记录功能，记录保存平台下所有触发的告警记录.
* 新增 webhook 告警渠道，增加通知模板说明指引，累计已支持邮件、短信、微信公众号及 webhook 通知渠道。

其他

* 新建工作负载页面支持配置 pod annotatoion，支持配置多行容器运行命令，支持 field 环境变量引用类型，支持权限集配置，支持滚动列表展示指定节点调度。
* 新增导入集群检查机制，对已导入的集群或版本不符合要求的集群禁止导入。
* 登录 pod 支持多种命令行。
* tke-installer 增加对 logagent，audit 等组件的安装配置管理。
* 优化 tke 组件的资源配额
* 支持对接外部 etcd

### Bugs Fixed

自 v1.2.5 以来修复的主要问题

* 修复由k8s升级导致的 Deployment 无法在控制台里回滚
* 业务管理控制台 pod 销毁重建操作前台发起的api中namespace参数不对
* 业务管理控制台 helm 应用展示没有区分ns
* namespace detail page is always loading
* 私有镜像仓库设置 Secret，密码长度输入限制
* Chart 包地址和镜像路径显示不全，且没有复制的按钮
* 业务管理控制台无法新建通知模板
* 扩展组件新建异常或一直检查
* Namespace 状态无法自动恢复
* 安装 VolumeDecorator失败
* Master 支持通过keepalive + iptables 实现负载均衡
* Create ClusterCredential before create Cluster
* Delete Imported cluster hang in Terminating
* Docker startup err not detected
* 节点列表搜索一个 nodename，点开后的 yaml 显示的并不是该节点的 yaml
* 创建应用时环境变量支持小数点
* 告警策略创建时，pod ready 的默认值调整为 false，包括平台管理和业务管理
* Webshell 使用 vim 时卡住
* QR code into wechat group is not valid any more

### Versions

#### 离线安装包地址

```text
https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-amd64-v1.3.0.run
```

arm64版本

```text
https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-arm64-v1.3.0.run
```

Kubernetes 版本

```text
kube-apiserver-amd64:v1.16.9
kube-apiserver-amd64:v1.18.3
kube-apiserver-arm64:v1.16.9
kube-apiserver-arm64:v1.18.3
kube-controller-manager-amd64:v1.16.9
kube-controller-manager-amd64:v1.18.3
kube-controller-manager-arm64:v1.16.9
kube-controller-manager-arm64:v1.18.3
kube-proxy-amd64:v1.16.9
kube-proxy-amd64:v1.18.3
kube-proxy-arm64:v1.16.9
kube-proxy-arm64:v1.18.3
kube-scheduler-amd64:v1.16.9
kube-scheduler-amd64:v1.18.3
kube-scheduler-arm64:v1.16.9
kube-scheduler-arm64:v1.18.3
```

镜像版本

```text
tkestack/tke-auth-api-amd64:v1.3.0
tkestack/tke-auth-api-arm64:v1.3.0
tkestack/tke-auth-controller-amd64:v1.3.0
tkestack/tke-auth-controller-arm64:v1.3.0
tkestack/tke-business-api-amd64:v1.3.0
tkestack/tke-business-api-arm64:v1.3.0
tkestack/tke-business-controller-amd64:v1.3.0
tkestack/tke-business-controller-arm64:v1.3.0
tkestack/tke-gateway-amd64:v1.3.0
tkestack/tke-gateway-arm64:v1.3.0
tkestack/tke-logagent-api-amd64:v1.3.0
tkestack/tke-logagent-api-arm64:v1.3.0
tkestack/tke-logagent-controller-amd64:v1.3.0
tkestack/tke-logagent-controller-arm64:v1.3.0
tkestack/tke-monitor-api-amd64:v1.3.0
tkestack/tke-monitor-api-arm64:v1.3.0
tkestack/tke-monitor-controller-amd64:v1.3.0
tkestack/tke-monitor-controller-arm64:v1.3.0
tkestack/tke-notify-api-amd64:v1.3.0
tkestack/tke-notify-api-arm64:v1.3.0
tkestack/tke-notify-controller-amd64:v1.3.0
tkestack/tke-notify-controller-arm64:v1.3.0
tkestack/tke-platform-api-amd64:v1.3.0
tkestack/tke-platform-api-arm64:v1.3.0
tkestack/tke-platform-controller-amd64:v1.3.0
tkestack/tke-platform-controller-arm64:v1.3.0
tkestack/tke-registry-api-amd64:v1.3.0
tkestack/tke-registry-api-arm64:v1.3.0
```

其他addon镜像版本

```text
alertmanager:v0.18.0
busybox-amd64:1.31.0
busybox-amd64:1.31.1
busybox-arm64:1.31.0
busybox-arm64:1.31.1
configmap-reload:v0.1
coredns-amd64:1.6.7
coredns-arm64:1.6.7
cron-hpa-controller:v1.0.0
csi-operator:v1.0.2
etcd-amd64:v3.4.7
etcd-arm64:v3.4.7
flannel-amd64:v0.10.0
flannel-arm64:v0.10.0
galaxy-amd64:v1.0.4
galaxy-arm64:v1.0.4
galaxy-ipam-amd64:v1.0.4
galaxy-ipam-arm64:v1.0.4
gpu-manager:v1.0.4
gpu-quota-admission:v1.0.0
helm-api:v1.3
influxdb-amd64:1.7.9
influxdb-arm64:1.7.9
keepalived-amd64:2.0.16-r0
keepalived-arm64:2.0.16-r0
kube-state-metrics:v1.9.5
lbcf-controller:v1.0.0.rc.2
log-agent:v1.1.0
log-collector:v1.1.0
log-file:v1.1.0
node-exporter:v0.18.1
nvidia-device-plugin:1.0.0-beta4
pause-amd64:3.1
pause-arm64:3.1
prometheus-config-reloader:v0.31.1
prometheus-operator:v0.31.1
prometheus:v2.16.0
prometheusbeat:6.4.1
provider-res-amd64:v1.18.3-1
provider-res-arm64:v1.18.3-1
registry-amd64:2.7.1
registry-arm64:2.7.1
swift:0.9.0
tapp-controller:v1.0.0
tiller:v2.10.0
volume-decorator:v1.0.1
```

### Known Issues

### Upgrades Notes

暂不支持自动升级，需要人工升级操作，升级过程保证configmap，workload 配置以及组件镜像的同时升级。

