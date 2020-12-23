# 1.5

## TKEStack Release v1.5.0

TKEStack 1.5.0 版本，相较于上一版本（v1.4.x），增加了集群升级，master节点扩容，导入外部应用商店功能等，同时对监控组件，工作负载等页面也进行了优化，满足海量 pod 工作负载的分页和查询。

### Installation

参考 [QuickStart](https://github.com/tkestack/tke#quickstart) 指引快速安装部署TKEStack平台。

AMD64版本

```text
arch=amd64 version=v1.5.0 && wget https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-$arch-$version.run{,.sha256} && sha256sum --check --status tke-installer-linux-$arch-$version.run.sha256 && chmod +x tke-installer-linux-$arch-$version.run && ./tke-installer-linux-$arch-$version.run
```

ARM64版本

```text
arch=arm64 version=v1.5.0 && wget https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-$arch-$version.run{,.sha256} && sha256sum --check --status tke-installer-linux-$arch-$version.run.sha256 && chmod +x tke-installer-linux-$arch-$version.run && ./tke-installer-linux-$arch-$version.run
```

### Changelog since v1.4.0

完整的修改日志请查阅 [changelog](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.4.md)

A complete changelog for the release notes please check at [changelog](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.4.md)

### Major Feature and Enhancements

集群功能

* 提供了集群升级的功能，支持将独立集群或global集群的K8S 版本 vx.y.z 升级，支持次要版本升级\(y+1\)，以及补丁版本升级\(z\)。 提供Auto 自动和Manual 手动升级两种模式，自动模式下TKEStack按顺序滚动升级所有master 节点和worker 节点；手动模式下可单独升级master 节点，单独选择部分或所有 worker 节点进行升级。所有升级过程可观察，并且支持配置节点驱逐和最大不可用pod数，保证升级过程的稳定。
* 支持master节点扩容和缩容能力，以满足对性能和高可用的需求。该功能需要集群apiserver地址为高可用 vip或 loadbalance地址，且待添加master节点与原节点在同一网段，操作系统与环境相同。
* 支持通过 kubeconfig 文件自动导入集群，优化导入集群操作体验。

应用商店和镜像仓库

* 支持导入外部应用商店，常用helm仓库地址都可快速导入和同步。
* 支持根据多用户或业务创建和分配模板仓库。
* 同时镜像仓库部分也进行了代码重构，支持对接distribution和harbor作为存储后端。

前端分页和搜索

* 优化workload下的pod管理页面的分页和搜索功能，支持按 pod 名称，IP，状态及自定义label字段查询。
* 页面支持修改节点 Taint。
* 支持为 TAPP 类型工作负载开启监控。

其他

* 新增了监控组件的配置页面，用户可根据集群运行环境配置合理的监控参数。
* 审计，日志和事件等功能支持对接至 ElasticSearch 7.5.1 版本，支持修改 ES 地址，index patern，用户名密码等。

### Bugs Fixed

自 v1.4.0 以来修复的主要问题

* 参见 [Bug Fixes](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.5.md#bug-fixes)

### Versions

#### 离线安装包地址

```text
https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-amd64-v1.5.0.run
```

arm64版本

```text
https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-arm64-v1.5.0.run
```

Kubernetes 版本

```text
kube-apiserver-amd64:v1.16.9
kube-apiserver-amd64:v1.17.13
kube-apiserver-amd64:v1.18.3
kube-apiserver-arm64:v1.16.9
kube-apiserver-arm64:v1.17.13
kube-apiserver-arm64:v1.18.3
kube-controller-manager-amd64:v1.16.9
kube-controller-manager-amd64:v1.17.13
kube-controller-manager-amd64:v1.18.3
kube-controller-manager-arm64:v1.16.9
kube-controller-manager-arm64:v1.17.13
kube-controller-manager-arm64:v1.18.3
kube-proxy-amd64:v1.16.9
kube-proxy-amd64:v1.17.13
kube-proxy-amd64:v1.18.3
kube-proxy-arm64:v1.16.9
kube-proxy-arm64:v1.17.13
kube-proxy-arm64:v1.18.3
kube-scheduler-amd64:v1.16.9
kube-scheduler-amd64:v1.17.13
kube-scheduler-amd64:v1.18.3
kube-scheduler-arm64:v1.16.9
kube-scheduler-arm64:v1.17.13
kube-scheduler-arm64:v1.18.3
```

镜像版本

```text
tke-application-api-amd64:v1.5.0
tke-application-api-arm64:v1.5.0
tke-application-controller-amd64:v1.5.0
tke-application-controller-arm64:v1.5.0
tke-audit-api-amd64:v1.5.0
tke-audit-api-arm64:v1.5.0
tke-auth-api-amd64:v1.5.0
tke-auth-api-arm64:v1.5.0
tke-auth-controller-amd64:v1.5.0
tke-auth-controller-arm64:v1.5.0
tke-business-api-amd64:v1.5.0
tke-business-api-arm64:v1.5.0
tke-business-controller-amd64:v1.5.0
tke-business-controller-arm64:v1.5.0
tke-gateway-amd64:v1.5.0
tke-gateway-arm64:v1.5.0
tke-logagent-api-amd64:v1.5.0
tke-logagent-api-arm64:v1.5.0
tke-logagent-controller-amd64:v1.5.0
tke-logagent-controller-arm64:v1.5.0
tke-monitor-api-amd64:v1.5.0
tke-monitor-api-arm64:v1.5.0
tke-monitor-controller-amd64:v1.5.0
tke-monitor-controller-arm64:v1.5.0
tke-notify-api-amd64:v1.5.0
tke-notify-api-arm64:v1.5.0
tke-notify-controller-amd64:v1.5.0
tke-notify-controller-arm64:v1.5.0
tke-platform-api-amd64:v1.5.0
tke-platform-api-arm64:v1.5.0
tke-platform-controller-amd64:v1.5.0
tke-platform-controller-arm64:v1.5.0
tke-registry-api-amd64:v1.5.0
tke-registry-api-arm64:v1.5.0
tke-registry-controller-amd64:v1.5.0
tke-registry-controller-arm64:v1.5.0
```

其他addon镜像版本

```text
addon-resizer-amd64:1.8.11
addon-resizer-arm64:1.8.11
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
galaxy-amd64:v1.0.6
galaxy-arm64:v1.0.6
galaxy-ipam-amd64:v1.0.6
galaxy-ipam-arm64:v1.0.6
gpu-manager:v1.0.4
gpu-quota-admission:v1.0.0
helm-api:v1.3
influxdb-amd64:1.7.9
influxdb-arm64:1.7.9
k8s-prometheus-adapter:4c67353
keepalived-amd64:2.0.16-r0
keepalived-arm64:2.0.16-r0
kube-state-metrics:v1.9.5
lbcf-controller:v1.0.0.rc.2
log-agent:v1.1.0
log-collector:v1.1.0
log-file:v1.1.0
metrics-server-amd64:v0.3.6
metrics-server-arm64:v0.3.6
node-exporter:v0.18.1
node-problem-detector:v0.8.2
nvidia-device-plugin:1.0.0-beta4
pause-amd64:3.1
pause-arm64:3.1
prometheus-config-reloader:v0.31.1
prometheus-operator:v0.31.1
prometheus:v2.16.0
prometheusbeat:6.4.1
provider-res-amd64:v1.18.3-2
provider-res-arm64:v1.18.3-2
registry-amd64:2.7.1
registry-arm64:2.7.1
swift:0.9.0
tapp-controller:v1.1.1
tiller:v2.10.0
tke-audit-collector:v1.10.0
tke-event-watcher:v0.1
volume-decorator:v1.0.1
```

### Known Issues

### Upgrades Notes

暂不支持自动升级，需要人工升级操作，升级过程保证configmap，workload 配置以及组件镜像的同时升级。

