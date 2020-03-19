## 简介

StorageClass 描述存储的类型，集群管理员可以为集群定义不同的存储类别。腾讯云 TKE 服务默认提供块存储类型的 StorageClass，通过 StorageClass 配合 PersistentVolumeClaim 可以动态创建需要的存储资源。

## StorageClass 控制台操作指引
目前仅支持yaml文件创建

## Kubectl 操作 StorageClass 指引

以下仅提供示例文件，您可直接通过 Kubectl 进行创建操作。

### 创建 StorageClass

如果不创建 StorageClass， 集群内将默认存在 name 为 CBS 的 StorageClass。
```yaml
apiVersion: storage.k8s.io/v1
kind: StorageClass
metadata:
  # annotations:
  #   storageclass.beta.kubernetes.io/is-default-class: "true"
  #   如果有这一条，则会成为 default-class，创建 PVC 时不指定类型则自动使用此类型
  name: cloud-premium
provisioner: cloud.tencent.com/qcloud-cbs ## TKE 集群自带的 provisioner
parameters:
  type: CLOUD_PREMIUM
  # 支持 CLOUD_BASIC,CLOUD_PREMIUM,CLOUD_SSD  如果不识别则当做 CLOUD_BASIC
  # paymode: PREPAID
  # paymode为云盘的计费模式，PREPAID模式（包年包月：仅支持Retain保留的回收策略），默认是 POSTPAID（按量计费：支持 Retain 保留和 Delete 删除策略，Retain 仅在高于1.8的集群版本生效）
  # aspid:asp-123
  # 支持指定快照策略，创建云盘后自动绑定此快照策略,绑定失败不影响创建
```
支持参数有：
- type：StorageClass 的类型，包括 CLOUD_BASIC、CLOUD_PREMIUM 和 CLOUD_SSD（注意全大写）。
- zone：指定 zone。如果指定，则云盘将创建到此 zone；如果不指定，则拉取所有 node 的 zone 信息，随机选取一个 zone。 腾讯云各地域标识符请参见 [地域和可用区](https://cloud.tencent.com/document/product/213/6091)。
- paymode：云盘的计费模式，默认设置为 POSTPAID 模式（即按量计费，支持 Retain 保留和 Delete 删除策略，Retain 仅在高于1.8的集群版本生效）。还可设置为 PREPAID 模式（即包年包月，仅支持 Retain 保留的回收策略）。
- aspid：指定快照 ID，创建云盘后自动绑定此快照策略，绑定失败不影响创建。

### 创建多实例 StatefulSet

使用云硬盘 CBS 创建多实例 StatefulSet，示例如下所示：
``` yaml
apiVersion: apps/v1beta1
kind: StatefulSet
metadata:
  name: web
spec:
  serviceName: "nginx"
  replicas: 3
  template:
    metadata:
      labels:
        app: nginx
    spec:
      terminationGracePeriodSeconds: 10
      containers:
      - name: nginx
        image: nginx
        ports:
        - containerPort: 80
          name: web
        volumeMounts:
        - name: www
          mountPath: /usr/share/nginx/html
  volumeClaimTemplates:  # 自动创建pvc，进而自动创建pv
  - metadata:
      name: www
    spec:
      accessModes: [ "ReadWriteOnce" ]
      storageClassName: cloud-premium
      resources:
        requests:
          storage: 10Gi
```