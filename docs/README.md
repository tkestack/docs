# Introduction

![](https://avatars0.githubusercontent.com/u/57258287?s=200&v=4)

![TKEStack Logo](https://github.com/tkestack/tke/workflows/build/badge.svg?branch=master) ![build-web](https://github.com/tkestack/tke/workflows/build-web/badge.svg) [![Go Report Card](https://goreportcard.com/badge/tkestack.io/tke)](https://goreportcard.com/report/tkestack.io/tke) [![Release](https://img.shields.io/github/release/tkestack/tke.svg?style=flat-square)](https://github.com/tkestack/tke/releases)

> 在线文档地址：[https://tkestack.github.io/docs/](https://tkestack.github.io/docs/)

_**TKEStack**_ 是一个开源项目，为在生产环境中部署容器的组织提供一个**统一的容器管理平台**。 _**TKEStack**_ 可以简化部署和使用 Kubernetes，满足 IT 要求，并增强 DevOps 团队的能力。

## 特点

* **统一集群管理**
  * 提供 Web 控制台和命令行客户端，用于集中管理多个 Kubernetes 集群
  * 可与现有的身份验证机制集成，包括 LDAP，Active Directory，front proxy 和 public OAuth providers（例如GitHub）
  * 统一授权管理，不仅在集群管理级别，甚至在Kubernetes资源级别
  * 多租户支持，包括团队和用户对容器、构建和网络通信的隔离
* **应用程序工作负载管理**
  * 提供直观的UI界面，以支持可视化、YAML导入、其他资源创建和编辑方法，使用户无需预先学习所有Kubernetes概念即可运行容器
  * 抽象的项目级资源容器，以支持跨多个集群的多个名称空间管理和部署应用程序
* **运维管理**
  * 集成的系统监控和应用程序监控
  * 支持对接外部存储，以实现持久化Kubernetes事件和审计日志
  * 限制，跟踪和管理平台上的开发人员和团队
* **插件支持和管理**
  * Authentication identity provider 插件
  * Authorization provider 插件
  * 事件持久化存储插件
  * 系统和应用程序日志持久化存储插件

