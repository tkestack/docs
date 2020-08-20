# TKEStack 产品手册

* [Introduction](README.md)

## 產品部署指南

<!-- * [产品部署指南](installation) -->
* [部署架构](zh/installation/installation-architecture.md)
* [部署环境要求](zh/installation/installation-requirement.md)
* [安装步骤](zh/installation/installation-procedures.md)
  
## 產品快速入門
<!-- * [产品快速入门](QuickStart) -->
* [快速入门](zh/QuickStart/快速入门.md)

## 入門示例
<!-- * [入门示例](zh/QuickStart/examples) -->
* [创建简单的 Nginx 服务](zh/QuickStart/examples/创建简单nginx服务.md)
* [编写 Hello World 程序](zh/QuickStart/examples/编写Hello-World程序.md)
* [如何构建 Docker 镜像](zh/QuickStart/examples/如何构建Docker镜像.md)
  
<!-- * [产品使用指南](products) -->
## 產品使用指南

* [切换控制台](zh/products/controlpannel.md)

  <!-- * [平台侧](products/platform) -->

## 平台側

* [集群管理](zh/products/platform/cluster.md)
* [业务管理](zh/products/platform/business.md)
* [扩展组件](zh/products/platform/extender.md)
* [组织资源](zh/products/platform/resource.md)
* [访问管理](zh/products/platform/access.md)
* [监控&告警](zh/products/platform/monitor&alert.md)
* [运维中心](zh/products/platform/operation.md)

## 業務側

* [命名空间](zh/products/business-control-pannel/application/namespace.md)
* [日志](zh/products/business-control-pannel/application/log.md)
* [事件](zh/products/business-control-pannel/application/events.md)
* [Helm 应用](zh/products/business-control-pannel/helm/helm.md)
* [业务管理](zh/products/business-control-pannel/business-manage.md)

## 工作負載

* [Deployment](zh/products/business-control-pannel/application/workload/deployment.md)
* [StatefulSet](zh/products/business-control-pannel/application/workload/stateful-set.md)
* [DaemonSet](zh/products/business-control-pannel/application/workload/daemon-set.md)
* [Job](zh/products/business-control-pannel/application/workload/job.md)
* [CronJob](zh/products/business-control-pannel/application/workload/cron-job.md)
* [TApp](zh/products/business-control-pannel/application/workload/tapp.md)
* [设置工作负载的资源限制](zh/products/business-control-pannel/application/workload/resource-limit.md)

## 服務

* [Service](zh/products/business-control-pannel/application/services/service.md)
* [Ingress](zh/products/business-control-pannel/application/services/ingress.md)

## 配置管理

* [ConfigMap](zh/products/business-control-pannel/application/configurations/ConfigMap.md)
* [Secret](zh/products/business-control-pannel/application/configurations/secret.md)

## 存儲

* [PV和PVC](zh/products/business-control-pannel/application/storage/persistent-volume-claim.md)
* [StorageClass](zh/products/business-control-pannel/application/storage/storave-class.md)

## 组织资源

* [仓库管理](zh/products/business-control-pannel/resource/registry.md)
* [访问凭证](zh/products/business-control-pannel/resource/credentials.md)

## 監控與告警

* [设置告警](zh/products/business-control-pannel/monitor-alert/alert.md)
* [通知管理](zh/products/business-control-pannel/monitor-alert/notifition.md)

## 運維中心

* [日志采集](zh/products/business-control-pannel/operation/logcollect.md)

## 產品特色功能

* [Galaxy](zh/features/galaxy.md)
* [TAPP](zh/features/tapp.md)
* [GPUManager](zh/features/gpumanager.md)
* [CronHPA](zh/features/cron-hpa.md)
* [LBCF](zh/features/lbcf.md)

## FAQ

* [如何规划部署资源](zh/FAQ/Installation/规划部署资源.md)
* [如何使用存储](zh/FAQ/Installation/如何使用存储.md)
* [如何重新部署](zh/FAQ/Installation/如何重新部署.md)
* [如何接入LDAP&OIDC](zh/FAQ/Feature/如何接入LDAP&OIDC.md)
* [如何实现自定义监控](zh/FAQ/Feature/如何实现自定义监控.md)
* [如何做日志分析](zh/FAQ/Feature/如何做日志分析.md)
* [业务管理与平台管理的区别](zh/FAQ/Authority/业务管理与平台管理的区别.md)
* [如何设置自定义策略](zh/FAQ/Authority/如何设置自定义策略.md)
* [Docker-login权限错误](zh/FAQ/Authority/Docker-login权限错误.md)
* [常见错误事件](zh/FAQ/Events/常见错误事件.md)
* [平台使用常见问题](zh/FAQ/Platform/平台使用常见问题.md) 