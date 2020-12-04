///复用Menu自定义实现方法
///dingwen
///2020/12/4
abstract class BaseMenu {
  ///构建页面内容
  buildContent();

  ///查询初始化
  queryInit();

  ///组装查询条件
  generateQueryCondition();

  ///拉取数据前准备
  prepareFetch(Map params);

  ///获取服务器数据
  fetchData(int fetchType,Map params);

  ///构建底部弹出表单类型
  buildBottomView();
}
