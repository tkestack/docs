# TKEStack 产品手册

* [产品部署指南](https://github.com/tkestack/docs/tree/master/installation)
  * [部署架构](https://github.com/tkestack/docs/blob/master/installation/installation-architecture.md)
  * [部署环境要求](https://github.com/tkestack/docs/blob/master/installation/installation-requirement.md)
  * [安装步骤](https://github.com/tkestack/docs/blob/master/installation/installation-procedures.md)
* [产品使用指南](https://github.com/tkestack/docs/tree/master/products)
  * [平台侧](https://github.com/tkestack/docs/tree/master/products/platform)
    * [集群管理](https://github.com/tkestack/docs/blob/master/products/platform/cluster.md)
    * [业务管理](https://github.com/tkestack/docs/blob/master/products/platform/business.md)
    * [切换控制台](https://github.com/tkestack/docs/blob/master/products/platform/controlpannel.md)
    * [拓展组件管理](https://github.com/tkestack/docs/blob/master/products/platform/extender.md)
    * [组织资源](https://github.com/tkestack/docs/blob/master/products/platform/resource.md)
    * [访问管理](https://github.com/tkestack/docs/blob/master/products/platform/access.md)
    * [监控与告警](https://github.com/tkestack/docs/blob/master/products/platform/monitor%26alert.md)
    * [运维中心](https://github.com/tkestack/docs/blob/master/products/platform/operation.md)
  * [业务侧](https://github.com/tkestack/docs/tree/master/products/business-control-pannel)
    * [Kubernetes对象管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/monitor-alert/alert.md)
      * [Namepsaces](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/namespace.md)
      * [工作负载](https://github.com/tkestack/docs/tree/master/products/business-control-pannel/application/workload)
        * [Deployment 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/workload/deployment.md)
        * [StatefulSet 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/workload/stateful-set.md)
        * [DaemonSet 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/workload/daemon-set.md)
        * [Job 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/workload/job.md)
        * [CronJob 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/workload/cron-job.md)
        * [设置工作负载的资源限制](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/workload/resource-limit.md)
      * [服务](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/namespace.md)
        * [Service 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/services/service.md)
        * [Ingress 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/services/ingress.md)
      * [配置](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/monitor-alert/alert.md)
        * [ConfigMap 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/configurations/ConfigMap.md)
        * [Secret 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/configurations/secret.md)
      * [存储](https://github.com/tkestack/docs/tree/master/products/business-control-pannel/application/storage)
        * [PV 和 PVC 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/storage/persistent-volume-claim.md)
        * [StorageClass 管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/storage/storave-class.md)
      * [事件管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/log.md)
      * [日志管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/application/log.md)
    * [Helm应用](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/helm/helm.md)
    * [监控与告警](https://github.com/tkestack/docs/tree/master/products/business-control-pannel/monitor-alert)
      * [设置告警](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/monitor-alert/alert.md)
      * [通知管理](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/monitor-alert/notifition.md)
    * [访问凭证](https://github.com/tkestack/docs/blob/master/products/business-control-pannel/resource/credentials.md)
* [产品特色功能](https://github.com/tkestack/docs/tree/master/features)
  * [Galaxy](https://github.com/tkestack/docs/blob/master/features/galaxy.md)
  * [TAPP](https://github.com/tkestack/docs/blob/master/features/tapp.md)
  * [GPUManager](https://github.com/tkestack/docs/blob/master/features/gpumanager.md)
  * [CronHPA](https://github.com/tkestack/docs/blob/master/features/cron-hpa.md)
  * [LBCF](https://github.com/tkestack/docs/blob/master/features/lbcf.md)
* [FAQ](https://github.com/tkestack/docs/tree/master/FAQ)
  * [部署类](https://github.com/tkestack/docs/blob/master/features/galaxy.md)
    * [如何规划部署资源](https://github.com/tkestack/docs/blob/master/FAQ/installation.md#如何规划部署资源)
    * [如何使用存储](https://github.com/tkestack/docs/blob/master/FAQ/installation.md#如何使用存储)
    * [常见报错解决方案](https://github.com/tkestack/docs/blob/master/FAQ/installation.md#常见报错解决方案)
    * [如何重新部署集群](https://github.com/tkestack/docs/blob/master/FAQ/installation.md#如何重新部署集群)
  * [功能类](https://github.com/tkestack/docs/blob/master/FAQ/features.md)
    * [如何接入LDAP、OIDC](https://github.com/tkestack/docs/blob/master/FAQ/features.md#如何接入LDAP、OIDC)
    * [如何实现自定义监控](https://github.com/tkestack/docs/blob/master/FAQ/features.md#如何实现自定义监控)
    * [如何做日志分析](https://github.com/tkestack/docs/blob/master/FAQ/features.md#如何做日志分析)
  * [权限类](https://github.com/tkestack/docs/blob/master/FAQ/access.md)
    * [业务管理、平台管理的区别](https://github.com/tkestack/docs/blob/master/FAQ/access.md#业务管理、平台管理的区别)
    * [如何设置自定义策略](https://github.com/tkestack/docs/blob/master/FAQ/access.md#如何设置自定义策略)