# 常见报错解决方法

当前 TKEStack 使用 tke-Installer 一键安装，安装过程中的错误主要集中在硬件和软件配置上，安装前请仔细阅读环境要求文档：

* [部署环境要求](../../installation/environment-requirement.md)

### 如何重新部署集群

#### 重试安装

若安装报错后，请先排障，再登录到 Installer 节点执行如下命令后，重新打开 `http://[tke-installer-IP]:8080/index.html` 安装控制台。

```text
docker restart tke-installer
```

#### 重新安装

安装报错后，请先排障，再登录到 Installer 节点执行如下命令后，重新打开 `http://[tke-installer-IP]:8080/index.html` 安装控制台。

```text
rm -rf /opt/tke-installer && docker restart tke-installer
```

`注：重新安装前，请先清理节点上的残留：`[`清除残留`](frequently-answer.md#qing-chu-can-liu) 

#### 清除残留

在添加新的节点或者重装环境之前，需要彻底清理节点，请对 Installer 或所有加入的节点执行下方脚本清理残留配置和文件。

```text
curl -s https://tke-release-1251707795.cos.ap-guangzhou.myqcloud.com/tools/clean.sh | sh
```

或者使用如下脚本：

```text
#!/bin/bash

rm -rf /etc/kubernetes

systemctl stop kubelet 2>/dev/null

docker rm -f $(docker ps -aq) 2>/dev/null
systemctl stop docker 2>/dev/null

ip link del cni0 2>/etc/null

for port in 80 2379 6443 8086 {10249..10259} ; do
    fuser -k -9 ${port}/tcp
done

rm -rfv /etc/kubernetes
rm -rfv /etc/docker
rm -fv /root/.kube/config
rm -rfv /var/lib/kubelet
rm -rfv /var/lib/cni
rm -rfv /etc/cni
rm -rfv /var/lib/etcd
rm -rfv /var/lib/postgresql /etc/core/token /var/lib/redis /storage /chart_storage

systemctl start docker 2>/dev/null
```

> 注：如有混合部署其他业务，请基于实际情况评估目录内数据是否可删除。



### 安装密码报错

错误情况：使用密码安装 Global 集群报 `ssh:unable to authenticate` 错误

解决方案：将 Global 集群节点`/etc/ssh/sshd_config`配置文件中的`PasswordAuthentication`设为`yes`，重启`sshd`服务。

