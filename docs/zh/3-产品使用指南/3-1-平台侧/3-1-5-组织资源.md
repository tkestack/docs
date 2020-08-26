

# 组织资源

## 概念
**这里用户可以管理镜像仓库和凭据。**

## 镜像仓库管理
**这里用户可以在镜像仓库里创建属于自己的命名空间，管理镜像。**

### 操作步骤
#### 新建命名空间
  1. 登录 TKEStack。
  2. 切换至【平台管理】控制台，选择 【组织资源】->【镜像仓库管理】。
  3. 点击【新建】按钮。如下图所示：
      ![新建命名空间](https://github.com/tkestack/tke/blob/master/docs/images/新建命名空间.png?raw=true)
  4. 在弹出的“新建命名空间”页面，填写命名空间信息，如下图所示：
      ![新建命名空间窗口](https://github.com/tkestack/tke/blob/master/docs/images/新建命名空间窗口.png?raw=true)
     + **名称：** 命名空间名字，不超过63字符
     + **描述：** 命名空间描述信息（可选）
     + **权限类型：** 选择命名空间权限类型
       + **公有：** 所有人均可访问该命名空间下的镜像
       + **私有：** 个人用户命名空间
  5. 单击【确认】按钮
 #### 删除命名空间
  1. 登录 TKEStack。
  2. 切换至 【平台管理】控制台，选择 【组织资源】->【镜像仓库管理】。点击列表最右侧【删除】按钮。如下图所示：
      ![命名空间删除按钮](https://github.com/tkestack/tke/blob/master/docs/images/命名空间删除按钮.png?raw=true)
#### 镜像上传
  1. 登录 TKEStack。

  2. 切换至 【平台管理】控制台，选择 【组织资源】->【镜像仓库管理】，查看命名空间列表。点击列表中命名空间【名称】。如下图所示：
      ![命名空间名称](https://github.com/tkestack/tke/blob/master/docs/images/命名空间名称.png?raw=true)
      
  4. 此时进入了“镜像列表”页面，点击【镜像上传指引】按钮。如下图所示：
     
      > 注意：此页面可以通过上传的镜像最右边的【删除】按钮来删除上传的镜像
      
      ![镜像上传指引](https://github.com/tkestack/tke/blob/master/docs/images/镜像上传指引.png?raw=true)
      
  4. 根据指引内容，在物理节点上执行相应命令。如下图所示：
      ![镜像上传指引内容](https://github.com/tkestack/tke/blob/master/docs/images/镜像上传指引内容.png?raw=true)
## Chart 包仓库管理
**这里用户可以在 Chart 包仓库里创建属于自己的 Chart 包命名空间，管理 Chart。**

### 操作步骤
#### 新建 Chart 包命名空间
  1. 登录 TKEStack。
  2. 切换至 【平台管理】控制台，选择 【组织资源】->【 Chart 包仓库管理】，查看 “Chart 包命名空间”列表
  3. 点击【新建】按钮。如下图所示：
      ![新建Chart包命名空间](https://github.com/tkestack/tke/blob/master/docs/images/新建Chart包命名空间.png?raw=true)
  4. 在弹出的新建 ChartGroup 页面，填写 ChartGroup 信息，如下图所示：
      ![新建ChartGroup窗口](https://github.com/tkestack/tke/blob/master/docs/images/新建ChartGroup窗口.png?raw=true)
     + **名称：** ChartGroup 名字，不超过63字符
     + **描述：** ChartGroup 描述信息（可选）
     + **权限类型：** 选择 ChartGroup 权限类型
       + **公有：** 所有人均可访问该 ChartGroup 下的Chart
       + **私有：** 个人用户C hartGroup
  5. 单击【确认】按钮
 #### 删除 Chart 包命名空间
  1. 登录 TKEStack。
  2. 切换至 【平台管理】控制台，选择 【组织资源】-> 【Chart 包仓库管理】，查看 “Chart 包命名空间”列表。
  3. 点击列表最右侧【删除】按钮。如下图所示：
      ![Chart包命名空间删除按钮](https://github.com/tkestack/tke/blob/master/docs/images/Chart包命名空间删除按钮.png?raw=true)
#### Chart上传
  1. 登录 TKEStack。
  2. 切换至 【平台管理】控制台，选择 【组织资源】-> 【Chart 包仓库管理】，查看 “Chart 包命名空间”列表。
  3. 点击列表中 Chart 包命名空间【名称】。如下图所示：
      ![Chart包命名空间名称](https://github.com/tkestack/tke/blob/master/docs/images/Chart包命名空间名称.png?raw=true)
  4. 点击命名空间的【Chart上传指引】按钮。如下图所示：
      ![Chart上传指引](https://github.com/tkestack/tke/blob/master/docs/images/Chart上传指引.png?raw=true)
  5. 根据指引内容，在物理节点上执行相应命令。如下图所示：
      ![Chart上传指引内容](https://github.com/tkestack/tke/blob/master/docs/images/Chart上传指引内容.png?raw=true)



## 访问凭证
**这里用户可以管理自己的凭据**
### 操作步骤
#### 新建访问凭证
  1. 登录 TKEStack。
  2. 切换至 【平台管理】控制台，选择 【组织资源】下的【访问凭证】，点击【新建】按钮。如下图所示：
      ![新建按钮](https://github.com/tkestack/tke/blob/master/docs/images/新建访问凭证.png?raw=true)
  3. 在弹出创建访问凭证页面，填写凭证信息。如下图所示：
      ![创建访问凭证](https://github.com/tkestack/tke/blob/master/docs/images/创建访问凭证.png?raw=true)
      
      * **凭证描述：** 描述当前凭证信息
      
      * **过期时间：** 填写过期时间，选择小时/分钟为单位
      
  4. 单击【确认】按钮

#### 停用/启用/删除访问凭证
  1. 登录 TKEStack。

  2. 切换至 【平台管理】控制台，选择 【组织资源】-> 【访问凭证】，查看“访问凭证”列表。单击列表右侧【禁用】/【启用】/【删除】按钮。如下图所示：
     
      > 注意：点击【禁用】之后，【禁用】按钮就变成了【启用】
      
      ![禁用启用按钮](https://github.com/tkestack/tke/blob/master/docs/images/禁用启用.png?raw=true)
      
  3. 单击【确认】按钮