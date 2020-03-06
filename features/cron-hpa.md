#CronHPA

Cron Horizontal Pod Autoscaler(CronHPA)使我们能够使用[crontab](https://en.wikipedia.org/wiki/Cron)模式定期自动扩容工作负载(那些支持扩展子资源的负载，例如deployment、statefulset)。

## CronHPA 资源结构

CronHPA定义了一个新的CRD，cron-hpa-controller是该CRD对应的controller/operator，它解析CRD中的配置，根据系统时间信息对相应的工作负载进行扩缩容操作。

```go
// CronHPA represents a set of crontabs to set target's replicas.
type CronHPA struct {
	metav1.TypeMeta   `json:",inline"`
	metav1.ObjectMeta `json:"metadata,omitempty"`

	// Spec defines the desired identities of pods in this cronhpa.
	Spec CronHPASpec `json:"spec,omitempty"`

	// Status is the current status of pods in this CronHPA. This data
	// may be out of date by some window of time.
	Status CronHPAStatus `json:"status,omitempty"`
}

// A CronHPASpec is the specification of a CronHPA.
type CronHPASpec struct {
	// scaleTargetRef points to the target resource to scale
	ScaleTargetRef autoscalingv2.CrossVersionObjectReference `json:"scaleTargetRef" protobuf:"bytes,1,opt,name=scaleTargetRef"`

	Crons []Cron `json:"crons" protobuf:"bytes,2,opt,name=crons"`
}

type Cron struct {
	// The schedule in Cron format, see https://en.wikipedia.org/wiki/Cron.
	Schedule string `json:"schedule" protobuf:"bytes,1,opt,name=schedule"`

	TargetReplicas int32 `json:"targetReplicas" protobuf:"varint,2,opt,name=targetReplicas"`
}

// CronHPAStatus represents the current state of a CronHPA.
type CronHPAStatus struct {
	// Information when was the last time the schedule was successfully scheduled.
	// +optional
	LastScheduleTime *metav1.Time `json:"lastScheduleTime,omitempty" protobuf:"bytes,2,opt,name=lastScheduleTime"`
}

// +k8s:deepcopy-gen:interfaces=k8s.io/apimachinery/pkg/runtime.Object

// CronHPAList is a collection of CronHPA.
type CronHPAList struct {
	metav1.TypeMeta `json:",inline"`
	metav1.ListMeta `json:"metadata,omitempty"`
	Items           []CronHPA `json:"items"`
}
```

## CronHPA 参考用例

1. 指定deployment每周五20点扩容到60个实例，周日23点缩容到30个实例

```yaml
apiVersion: extensions.tkestack.io/v1
kind: CronHPA
metadata:
  name: example-cron-hpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: demo-deployment
  crons:
    - schedule: "0 23 * * 5"  // Set replicas to 60 every Friday 23:00
      targetReplicas: 60
    - schedule: "0 23 * * 7"  // Set replicas to 30 every Sunday 23:00
      targetReplicas: 30
```

2. 指定deployment每天8点到9点，19点到21点扩容到60，其他时间点恢复到10

```yaml
apiVersion: extensions.tkestack.io/v1
kind: CronHPA
metadata:
  name: web-servers-cronhpa
spec:
  scaleTargetRef:
    apiVersion: apps/v1
    kind: Deployment
    name: web-servers
  crons:
    - schedule: "0 8 * * *"  // Set replicas to 60 every day 8:00
      targetReplicas: 60
    - schedule: "0 9 * * *"  // Set replicas to 10 every day 9:00
      targetReplicas: 10
    - schedule: "0 19 * * *"  // Set replicas to 60 every day 19:00
      targetReplicas: 60
    - schedule: "0 21 * * *"  // Set replicas to 10 every day 21:00
      targetReplicas: 10
```
