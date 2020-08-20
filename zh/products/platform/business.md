# 业务管理
## 概念
**在这里用户可以管理线上业务。**

## 操作步骤
### 新建业务

> 注：业务可以实现跨集群资源的使用

1. 登录 TKEStack。
2. 在【平台管理】控制台的【业务管理】中，单击 【新建业务】。如下图所示：
   ![新建业务](https://github.com/tkestack/tke/blob/master/docs/images/createbusiness.png?raw=true)
3. 在“新建业务”页面，填写业务信息。如下图所示：
   ![业务信息](https://github.com/tkestack/tke/blob/master/docs/images/bussinessInfo.png?raw=true)

- **业务名称**：不能超过63个字符，这里以`my-business`为例
- **业务成员**： [【访问管理】](../platform/access.md)中【用户管理】中的用户，这里以`admin`例，即该用户可以访问这个业务。
- **集群**：
  - 【集群管理】中的集群，这里以`gobal`集群为例
  - 【填写资源限制】可以设置当前业务使用该集群的资源上限（可不限制）
  - 【新增集群】可以添加多个集群，此业务可以使用多个集群的资源（按需添加）
- **上级业务**：支持多级业务管理，按需选择（可不选）

4. 单击最下方 【完成】 按钮即可创建业务。

### 添加业务成员
1. 登录 TKEStack。
2. 切换至 【平台管理】控制台，点击【业务管理】。
3. 在“业务管理”页面中，可以看到已创建的业务列表。鼠标移动到要修改的业务上(无需点击)，成员列会出现修改图标按钮。如下图所示：
    ![修改图标按钮](https://github.com/tkestack/tke/blob/master/docs/images/修改业务成员图标.png?raw=true)

  > 注意：修改业务成员仅限状态为Active的业务，这里可以新建和删除成员。

### 查看业务监控
1. 登录 TKEStack。
2. 切换至 【管理】控制台，点击【业务管理】。
3. 在“业务管理”页面中，可以看到已创建的业务列表。点击监控按钮，如下图所示：
![监控按钮](https://github.com/tkestack/tke/blob/master/docs/images/查看业务监控.png?raw=true)
5. 在右侧弹出窗口里查看业务监控情况，如下图所示：
![业务监控详情](https://github.com/tkestack/tke/blob/master/docs/images/业务监控详情.png?raw=true)

### 删除业务
1. 登录 TKEStack。
2. 切换至 【平台管理】控制台，点击【业务管理】。
3. 在“业务管理”页面中，可以看到已创建的业务列表。点击删除按钮，如下图所示：
![删除业务](https://github.com/tkestack/tke/blob/master/docs/images/删除业务.png?raw=true)
> 注意：删除业务成员仅限状态为Active的业务

### 对业务的操作

1. 登录 TKEStack。

2. 在【平台管理】控制台的【业务管理】中，单击【业务id】。如下图所示： ![业务id](https://github.com/tkestack/tke/blob/master/docs/images/businessid.png?raw=true)

   a. **业务信息：** 在这里可以对业务名称、关联的集群、关联集群的资源进行限制等操作。

   ![业务信息](https://github.com/tkestack/tke/blob/master/docs/images/业务信息1.png?raw=true)

   b. **成员列表：** 在这里可以对业务名称、关联的集群、关联集群的资源进行限制等操作。

   ![业务信息](https://github.com/tkestack/tke/blob/master/docs/images/成员列表设置.png?raw=true)

   c. **子业务：** 在这里可以**新建本业务的子业务**或**通过导入子业务将已有业务变成本业务的子业务**

   ![业务信息](https://github.com/tkestack/tke/blob/master/docs/images/子业务.png?raw=true)

   d. **业务下Namespace列表：** 这里可以管理业务下的Namespace

   ![业务信息](https://github.com/tkestack/tke/blob/master/docs/images/业务Namespace列表.png?raw=true)

   ​	单击【新建Namespace】。在“新建Namespace”页面中，填写相关信息。如下图所示： 

   ![新建空间列表](https://github.com/tkestack/tke/blob/master/docs/images/my-ns.png?raw=true?raw=true)

   ​	**名称**：不能超过63个字符，这里以`new-ns`为例

   ​	**集群**：`my-business`业务中的集群，这里以`global`集群为例

   ​	*资源限制**：这里可以限制当前命名空间下各种资源的使用量，可以不设置。