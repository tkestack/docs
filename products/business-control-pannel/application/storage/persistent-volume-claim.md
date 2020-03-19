## 简介
PersistentVolume（PV）：集群内的存储资源。例如，节点是集群的资源。PV 独立于 Pod 的生命周期，根据不同的 StorageClass 类型创建不同类型的 PV。
PersistentVolumeClaim（PVC）：集群内的存储请求。例如，PV 是 Pod 使用节点资源，PVC 则声明使用 PV 资源。当 PV 资源不足时，PVC 也可以动态创建 PV。



## 注意事项

- CBS 盘不支持跨可用区挂载。若挂载 CBS 类型 PV 的 Pod 迁移到其他可用区，将会导致挂载失败。
## PersistentVolumeClaim 控制台操作指引
目前仅支持ymal文件创建

## Kubectl 操作 PV 及 PVC 指引

当前仅支持 CBS 及 CFS 类型的 PV 及 PVC。如选择 CBS 类型的 PV 及 PVC，您可通过 [StorageClass 管理](https://cloud.tencent.com/document/product/457/31714) 指定 PV 绑定的云盘的类型。以下仅提供示例文件，您可直接通过 Kubectl 进行创建操作。



### （可选）创建 PV<span id="createPV"></span>

通过已有 CBS 创建 PV。若未创建 PV，在 [创建 PVC](#createPVC) 时，系统将自动创建对应的 PV。
```Yaml
apiVersion: v1
kind: PersistentVolume
metadata:
  name: nginx-pv
spec:
  capacity:
    storage: 10Gi
  accessModes:
    - ReadWriteOnce
  qcloudCbs:
      cbsDiskId: disk-xxxxxxx ## 指定已有的CBS id
      fsType: ext4
  storageClassName: cbs
```



### 创建 PVC<span id="createPVC"></span>

若未 [创建 PV](#createPV)，在创建 PVC 时，系统将自动创建对应的 PV。YAML 示例如下：
```yaml
kind: PersistentVolumeClaim
apiVersion: v1
metadata:
  name: nginx-pv-claim
spec:
  storageClassName: cbs
  accessModes:
    - ReadWriteOnce
  resources:
    requests:
      storage: 10Gi
```

- 普通云盘大小必须是10的倍数，最小为10GB。
- 高性能云硬盘最小为50GB。
- SSD 云硬盘最小为100GB，详情请参见 [云硬盘类型](https://cloud.tencent.com/product/cbs/types)。

### 使用 PVC

YAML 示例如下：
```yaml
apiVersion: extensions/v1beta1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      qcloud-app: nginx-deployment
  template:
    metadata:
      labels:
        qcloud-app: nginx-deployment
    spec:
      containers:
      - image: nginx
        imagePullPolicy: Always
        name: nginx
        volumeMounts:
        - mountPath: "/opt/"
          name: pvc-test
      volumes:
      - name: pvc-test
        persistentVolumeClaim:
          claimName: nginx-pv-claim # 已经创建好的 PVC
```