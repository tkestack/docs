# 1.4

## TKEStack Release v1.4.0

TKEStack v1.4.0 版本继续增强平台健壮性和易用性，修复社区和用户发现的问题Issue，升级Tapp应用和Galaxy网络扩展组件版本。 新增 Helm 模板和仓库功能，支持 Helm v3 应用的安装部署。 新增集群概览页面，集中展示多集群资源和负载情况，增加了更多的metrics监控指标，帮助用户更相信准确的评估健康状态。 独立出 HPA 和 CronHPA 自动伸缩页面，允许客户更灵活的自定义弹性伸缩规则。 增强了集群的管理和安全能力，支持为集群独立开启或关闭功能组件，支持使用主机 hostname 作为集群节点名称，加固TKEStack底层基础镜像。

### Installation

参考 [QuickStart](https://github.com/tkestack/tke#quickstart) 指引快速安装部署TKEStack平台。

AMD64版本

```text
arch=amd64 version=v1.4.0 && wget https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-$arch-$version.run{,.sha256} && sha256sum --check --status tke-installer-linux-$arch-$version.run.sha256 && chmod +x tke-installer-linux-$arch-$version.run && ./tke-installer-linux-$arch-$version.run
```

ARM64版本

```text
arch=arm64 version=v1.4.0 && wget https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-$arch-$version.run{,.sha256} && sha256sum --check --status tke-installer-linux-$arch-$version.run.sha256 && chmod +x tke-installer-linux-$arch-$version.run && ./tke-installer-linux-$arch-$version.run
```

### Changelog since v1.3.1

完整的修改日志请查阅 [changelog](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.4.md)

A complete changelog for the release notes please check at [changelog](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.4.md)

### Major Feature and Enhancements

Helm charts仓库和应用中心

* 新增 Helm 模板和仓库功能，支持 Helm v3 应用的安装部署。

集群概览

* 新增集群概览页面，集中展示多集群资源和负载情况，增加了更多的metrics监控指标，帮助用户更相信准确的评估健康状态

HPA 和 CronHPA

* 独立出 HPA 和 CronHPA 自动伸缩页面，允许客户更灵活的自定义弹性伸缩规则。

其他

* 增强了集群的管理和安全能力，支持为集群独立开启或关闭功能组件
* 支持使用主机 hostname 作为集群节点名称
* 加固TKEStack底层基础镜像。

### Bugs Fixed

自 v1.3.1 以来修复的主要问题

* 参见 [Bug Fixes](https://github.com/tkestack/tke/blob/master/CHANGELOG/CHANGELOG-1.4.md#bug-fixes)

### Versions

#### 离线安装包地址

```text
https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-amd64-v1.4.0.run
```

arm64版本

```text
https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tke-installer-linux-arm64-v1.4.0.run
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
tkestack/tke-auth-api-amd64:v1.4.0
tkestack/tke-auth-api-arm64:v1.4.0
tkestack/tke-auth-controller-amd64:v1.4.0
tkestack/tke-auth-controller-arm64:v1.4.0
tkestack/tke-business-api-amd64:v1.4.0
tkestack/tke-business-api-arm64:v1.4.0
tkestack/tke-business-controller-amd64:v1.4.0
tkestack/tke-business-controller-arm64:v1.4.0
tkestack/tke-gateway-amd64:v1.4.0
tkestack/tke-gateway-arm64:v1.4.0
tkestack/tke-logagent-api-amd64:v1.4.0
tkestack/tke-logagent-api-arm64:v1.4.0
tkestack/tke-logagent-controller-amd64:v1.4.0
tkestack/tke-logagent-controller-arm64:v1.4.0
tkestack/tke-monitor-api-amd64:v1.4.0
tkestack/tke-monitor-api-arm64:v1.4.0
tkestack/tke-monitor-controller-amd64:v1.4.0
tkestack/tke-monitor-controller-arm64:v1.4.0
tkestack/tke-notify-api-amd64:v1.4.0
tkestack/tke-notify-api-arm64:v1.4.0
tkestack/tke-notify-controller-amd64:v1.4.0
tkestack/tke-notify-controller-arm64:v1.4.0
tkestack/tke-platform-api-amd64:v1.4.0
tkestack/tke-platform-api-arm64:v1.4.0
tkestack/tke-platform-controller-amd64:v1.4.0
tkestack/tke-platform-controller-arm64:v1.4.0
tkestack/tke-registry-api-amd64:v1.4.0
tkestack/tke-registry-api-arm64:v1.4.0
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
provider-res-amd64:v1.18.3-1
provider-res-arm64:v1.18.3-1
registry-amd64:2.7.1
registry-arm64:2.7.1
swift:0.9.0
tapp-controller:v1.1.1
tiller:v2.10.0
tke-audit-collector:v0.3
tke-event-watcher:v0.1
volume-decorator:v1.0.1
```

### Known Issues

### Upgrades Notes

暂不支持自动升级，需要人工升级操作，升级过程保证configmap，workload 配置以及组件镜像的同时升级。

