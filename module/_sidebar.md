<style>
.sidebar-nav ul {
  list-style: none;
  padding: 0;
  margin: 0;
}

.sidebar-nav li {
  cursor: pointer;
  background-color: transparent !important; 
  padding: 0; 
}

.sidebar-nav > ul > li > a {
  border-radius: 10px;
  padding-left:10px;
  display: block;
  padding: 10px 15px;
  color: #333333;
  text-decoration: none !important;
  transition: all 0.2s ease;
}

.sidebar-nav > ul > li > ul > li > a {
  border-radius: 10px;
  padding-left:10px;
  display: block;
  padding: 8px 15px 8px 30px;
  color: #333333;
  text-decoration: none !important;
  transition: all 0.2s ease;
}

.sidebar-nav > ul > li > a:hover {
  border-radius: 10px;
  padding-left:10px;
  background-color: #e8f4ff;
  color: #409eff;
}
.sidebar-nav > ul > li > ul > li > a:hover {
  border-radius: 10px;
  padding-left:10px;
  background-color: #e8f4ff;
  color: #409eff;
}

.sidebar-nav > ul > li.active > a {
  border-radius: 10px;
  padding-left:10px;
  background-color: #409eff !important;
  color: #ffffff !important;
}
.sidebar-nav > ul > li > ul > li.active > a {
  border-radius: 10px;
  padding-left:10px;
  background-color: #409eff !important;
  color: #ffffff !important;
}
</style>

<script>
// 页面加载完成后初始化
document.addEventListener('DOMContentLoaded', function() {
  // 1. 给原有MD列表包裹sidebar-nav容器（让样式生效）
  const originalUl = document.querySelector('ul');
  if (originalUl) {
    const sidebarContainer = document.createElement('div');
    sidebarContainer.className = 'sidebar-nav';
    originalUl.parentNode.replaceChild(sidebarContainer, originalUl);
    sidebarContainer.appendChild(originalUl);
  }

  // 2. 绑定一级目录点击事件
  const level1Items = document.querySelectorAll('.sidebar-nav > ul > li');
  level1Items.forEach(item => {
    item.addEventListener('click', function(e) {
      e.stopPropagation(); // 阻止冒泡到父级
      // 清空所有目录项的选中状态
      document.querySelectorAll('.sidebar-nav li').forEach(li => {
        li.classList.remove('active');
      });
      // 仅给当前点击的一级目录添加选中样式
      this.classList.add('active');
    });
  });

  // 3. 绑定二级目录点击事件
  const level2Items = document.querySelectorAll('.sidebar-nav > ul > li > ul > li');
  level2Items.forEach(item => {
    item.addEventListener('click', function(e) {
      e.stopPropagation(); // 阻止冒泡到一级目录
      // 清空所有目录项的选中状态
      document.querySelectorAll('.sidebar-nav li').forEach(li => {
        li.classList.remove('active');
      });
      // 仅给当前点击的二级目录添加选中样式
      this.classList.add('active');
    });
  });
});
</script>

- [元数据管理](module/meatData.md)
- [数据标准](module/dataStandard.md)
- [数据集成](module/dataIntegration/dataIntegration.md)
  - [数据源管理](module/dataIntegration/component/dataSource.md)
  - [数据加工](module/dataIntegration/component/dataProcessing.md)
  - [集成任务](module/dataIntegration/component/integrationTask.md)
  - [规则管理](module/dataIntegration/component/ruleManage.md)
  - [Worker分组管理](module/dataIntegration/component/workerGroupManage.md)
  - [环境管理](module/dataIntegration/component/environmentManage.md)
  - [告警组管理](module/dataIntegration/component/alertManage.md)
  - [告警实例管理](module/dataIntegration/component/alertInstanceManage.md)
- [数据治理](module/dataGovernance.md)
- [数据资产](module/dataAssets/dataAssets.md)
  - [标签管理](module/dataAssets/component/label.md)
  - [目录管理](module/dataAssets/component/catalog.md)
  - [数据资源](module/dataAssets/component/resource.md)
  - [资产管理](module/dataAssets/component/assets.md)
  - [资产总览](module/dataAssets/component/assetsOverview.md)
- [数据产品管理](module/dataProduct.md)
- [数据安全](module/dataSecurity.md)
- [系统运维管理](module/systemOMManagement.md)
- [审批流程](module/approvalProcess/approvalProcess.md)
  - [待审核](module/approvalProcess/component/pendingReview.md)
  - [已审核](module/approvalProcess/component/reviewed.md)
  - [流程管理](module/approvalProcess/component/processManagement.md)
- [系统管理](module/systemManage/systemManagement.md)
  - [用户管理](module/systemManage/component/userManage.md)
  - [组织管理](module/systemManage/component/organManage.md)
  - [角色管理](module/systemManage/component/roleManage.md)
  - [队列管理](module/systemManage/component/queueManage.md)
  - [租户管理](module/systemManage/component/tenantManage.md)
  - [主题管理](module/systemManage/component/topicManage.md)
  - [权限管理](module/systemManage/component/permissionManage.md)
  - [系统日志](module/systemManage/component/systemLog.md)
- [应用管理](module/applicationManagement.md)
- [值域管理](module/rangeManagement.md)
- [通知中心](module/notificationCenter.md)
- [分发编码管理](module/distCodeManagement.md)