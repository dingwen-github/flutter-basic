import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

class ConditionQuery {
  String name;
  bool isSelected;
  Object object;
  String value;

  ConditionQuery({this.name, this.isSelected, this.object, this.value});
}

class GZXDropDownMenuPage extends StatefulWidget {
  @override
  _GZXDropDownMenuPageState createState() => _GZXDropDownMenuPageState();
}

class _GZXDropDownMenuPageState extends State<GZXDropDownMenuPage> {
  List<String> _dropDownHeaderItemStrings = ['所有任务', '所有业务', '所有时间', '其他查询'];
  List<ConditionQuery> _businessConditions = [];
  List<ConditionQuery> _timeLimitConditions = [];
  List<ConditionQuery> _taskConditions = [];
  List<ConditionQuery> _currentConditions = [];
  ConditionQuery _selectTaskCondition;
  ConditionQuery _selectTimeLimitCondition;
  ConditionQuery _selectBusinessCondition;
  GZXDropdownMenuController _dropdownMenuController =
      GZXDropdownMenuController();
  var _scaffoldKey = new GlobalKey<ScaffoldState>();
  GlobalKey _stackKey = GlobalKey();

  //项目名称
  var itemName = TextEditingController();

  //节点名称
  var processInstanceBusinessKeyLike = TextEditingController();

  @override
  void initState() {
    super.initState();
    _taskConditions.addAll([
      ConditionQuery(name: '全部任务', isSelected: true),
      ConditionQuery(name: '个人任务', isSelected: false, object: 'my'),
      ConditionQuery(name: '组任务', isSelected: false, object: 'group'),
      ConditionQuery(name: '已处理任务', isSelected: false, object: 'completed'),
    ]);
    _selectTaskCondition = _taskConditions[0];
    _businessConditions.add(ConditionQuery(name: '全部业务', isSelected: true));
    _businessConditions
        .add(ConditionQuery(name: '采矿权新立', isSelected: false, value: 'C10'));
    _businessConditions
        .add(ConditionQuery(name: '采矿权变更', isSelected: false, value: 'C20'));
    _businessConditions
        .add(ConditionQuery(name: '采矿权延续', isSelected: false, value: 'C30'));
    _businessConditions
        .add(ConditionQuery(name: '采矿权注销', isSelected: false, value: 'C70'));
    _businessConditions
        .add(ConditionQuery(name: '探矿权新立', isSelected: false, value: 'T10'));
    _businessConditions
        .add(ConditionQuery(name: '探矿权变更', isSelected: false, value: 'T20'));
    _businessConditions
        .add(ConditionQuery(name: '探矿权延续', isSelected: false, value: 'T30'));
    _businessConditions
        .add(ConditionQuery(name: '探矿权保留', isSelected: false, value: 'T40'));
    _businessConditions
        .add(ConditionQuery(name: '探矿权注销', isSelected: false, value: 'T70'));
    _selectBusinessCondition = _businessConditions[0];

    _timeLimitConditions.add(ConditionQuery(name: '所有日期', isSelected: true));
    _timeLimitConditions
        .add(ConditionQuery(name: '即将过期', isSelected: false, value: '1'));
    _timeLimitConditions
        .add(ConditionQuery(name: '超期', isSelected: false, value: '2'));

    _selectTimeLimitCondition = _timeLimitConditions[0];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('查询'),
        centerTitle: true,
      ),
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          Column(
            children: <Widget>[
              // 下拉菜单头部
              GZXDropDownHeader(
                // 下拉的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
                items: [
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[0]),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[1]),
                  GZXDropDownHeaderItem(
                    _dropDownHeaderItemStrings[2],
                  ),
                  GZXDropDownHeaderItem(_dropDownHeaderItemStrings[3],
                      iconData: Icons.filter_frames, iconSize: 18),
                ],
                // GZXDropDownHeader对应第一父级Stack的key
                stackKey: _stackKey,
                // controller用于控制menu的显示或隐藏
                controller: _dropdownMenuController,
                // 当点击头部项的事件，在这里可以进行页面跳转或openEndDrawer
                onItemTap: (index) {
                  if (index == 3) {
                    _dropdownMenuController.hide();
                    showModalBottomSheet(
                        context: context,
                        builder: (BuildContext context) {
                          return SingleChildScrollView(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 24.0),
                              child: SingleChildScrollView(
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                  child: Form(
                                    autovalidate: true, //开启自动校验
                                    child: Column(
                                      children: <Widget>[
                                        TextFormField(
                                          autofocus: false,
                                          controller:
                                              processInstanceBusinessKeyLike,
                                          decoration: InputDecoration(
                                              labelText: "节点名称",
                                              hintText: "请输入节点名称",
                                              icon: Icon(Icons
                                                  .control_point_duplicate)),
                                          // 当用户确定已经完成编辑时触发
                                          onFieldSubmitted: (value) {},
                                        ),
                                        TextFormField(
                                          controller: itemName,
                                          decoration: InputDecoration(
                                              labelText: "项目名称",
                                              hintText: "请输入项目名称",
                                              icon: Icon(Icons.flag)),
                                        ),
                                        // 按钮
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(top: 28.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0.0),
                                                child: RaisedButton(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text("重置",
                                                      style: TextStyle(
                                                          fontSize: 16)),
                                                  color: Colors.white,
                                                  textColor: Theme.of(context)
                                                      .primaryColor,
                                                  onPressed: () {
                                                    processInstanceBusinessKeyLike
                                                        .text = '';
                                                    itemName.text = '';
                                                    setState(() {
                                                      _currentConditions.removeWhere(
                                                          (condition) =>
                                                              condition.name ==
                                                                  'processInstanceBusinessKeyLike' ||
                                                              condition.name ==
                                                                  'itemName');
                                                    });
                                                  },
                                                ),
                                              ),
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                    right: 0, left: 0),
                                                child: RaisedButton(
                                                  padding: EdgeInsets.all(10.0),
                                                  child: Text("搜索",
                                                      style: TextStyle(
                                                          fontSize: 16)),
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  textColor: Colors.white,
                                                  onPressed: () {
                                                    setState(() {
                                                      if (processInstanceBusinessKeyLike
                                                          .text
                                                          .toString()
                                                          .trim()
                                                          .isNotEmpty) {
                                                        _currentConditions.add(
                                                            ConditionQuery(
                                                                name:
                                                                    'processInstanceBusinessKeyLike',
                                                                isSelected:
                                                                    true,
                                                                object: '%' +
                                                                    processInstanceBusinessKeyLike
                                                                        .text +
                                                                    '%'));
                                                      }
                                                      if (itemName.text
                                                          .toString()
                                                          .trim()
                                                          .isNotEmpty) {
                                                        _currentConditions.add(
                                                            ConditionQuery(
                                                                name:
                                                                    'itemName',
                                                                isSelected:
                                                                    true,
                                                                object: '%' +
                                                                    itemName
                                                                        .text +
                                                                    '%'));
                                                      }
                                                      //去重
                                                      _currentConditions =
                                                          _currentConditions
                                                              .toSet()
                                                              .toList();

                                                      ///组装查询条件
                                                      generateQueryCondition();
                                                    });
                                                    //关闭弹窗
                                                    Navigator.of(context)
                                                        .pop('');
                                                  },
                                                ),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        });
                  }
                },
//                // 头部的高度
                height: 50,
//                // 头部背景颜色
                color: Colors.white54,
//                // 头部边框宽度
//                borderWidth: 1,
//                // 头部边框颜色
//                borderColor: Color(0xFFeeede6),
//                // 分割线高度
//                dividerHeight: 20,
//                // 分割线颜色
//                dividerColor: Color(0xFFeeede6),
//                // 文字样式
                style: TextStyle(color: Color(0xFF666666), fontSize: 16),
//                // 下拉时文字样式
                dropDownStyle: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).primaryColor,
                ),
//                // 图标大小
//                iconSize: 20,
//                // 图标颜色
//                iconColor: Color(0xFFafada7),
//                // 下拉时图标颜色
//                iconDropDownColor: Theme.of(context).primaryColor,
              ),
              Expanded(
                child: ListView.separated(
                    itemCount: _currentConditions.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return GestureDetector(
                        child: ListTile(
                          leading: Text(
                              '${_currentConditions[index].name}\t${_currentConditions[index].isSelected}\t${_currentConditions[index].object}\t${_currentConditions[index].value}'),
                        ),
                        onTap: () {},
                      );
                    }),
              ),
            ],
          ),
          // 下拉菜单
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 300,
            // 下拉后遮罩颜色
            maskColor: Colors.grey.withOpacity(0.8),
            dropdownMenuChanging: (isShow, index) {
              //下拉菜单显示之前
              setState(() {});
            },
            //下拉菜单显示之后，此处进行
            dropdownMenuChanged: (isShow, index) {
              setState(() {
                ConditionQuery conditionTask = _taskConditions
                    .where((condition) => condition.isSelected == true)
                    .toList()[0];
                ConditionQuery conditionBusiness = _businessConditions
                    .where((condition) => condition.isSelected == true)
                    .toList()[0];
                ConditionQuery conditionTimeLimit = _timeLimitConditions
                    .where((condition) => condition.isSelected == true)
                    .toList()[0];
                //清除之前的条件
                _currentConditions = [];
                _currentConditions.addAll([
                  ConditionQuery(
                      name: 'sortBy', isSelected: true, object: 'created'),
                  ConditionQuery(
                      name: 'sortOrder', isSelected: true, object: 'desc'),
                ]);
                _currentConditions.addAll(
                    [conditionTask, conditionBusiness, conditionTimeLimit]);
                //去重
                _currentConditions = _currentConditions.toSet().toList();

                ///组装查询条件
                generateQueryCondition();
              });
            },
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: [
              GZXDropdownMenuBuilder(
                  dropDownHeight: 46.0 * _taskConditions.length,
                  dropDownWidget:
                      _buildConditionListWidget(_taskConditions, (value) {
                    _selectTaskCondition = value;
                    _dropDownHeaderItemStrings[0] = _selectTaskCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 46.0 * _businessConditions.length,
                  dropDownWidget:
                      _buildConditionListWidget(_businessConditions, (value) {
                    _selectBusinessCondition = value;
                    _dropDownHeaderItemStrings[1] =
                        _selectBusinessCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
              GZXDropdownMenuBuilder(
                  dropDownHeight: 46.0 * _timeLimitConditions.length,
                  dropDownWidget:
                      _buildConditionListWidget(_timeLimitConditions, (value) {
                    _selectTimeLimitCondition = value;
                    _dropDownHeaderItemStrings[2] =
                        _selectTimeLimitCondition.name;
                    _dropdownMenuController.hide();
                    setState(() {});
                  })),
            ],
          ),
        ],
      ),
    );
  }

  _buildConditionListWidget(
      items, void itemOnTap(ConditionQuery sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        ConditionQuery sortCondition = items[index];
        return GestureDetector(
          onTap: () {
            for (var value in items) {
              value.isSelected = false;
            }
            sortCondition.isSelected = true;

            itemOnTap(sortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 40,
            child: Row(
              children: <Widget>[
                SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Text(
                    sortCondition.name,
                    style: TextStyle(
                      color:
                          sortCondition.isSelected ? Colors.blue : Colors.black,
                      fontSize: 16,
                      fontWeight: sortCondition.isSelected
                          ? FontWeight.bold
                          : FontWeight.normal,
                    ),
                  ),
                ),
                sortCondition.isSelected
                    ? Icon(
                        Icons.check,
                        color: Colors.blue,
                        size: 16,
                      )
                    : SizedBox(),
                SizedBox(
                  width: 16,
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  ///生成查询条件
  void generateQueryCondition() {
    Map<String, String> params = {};
    _currentConditions.forEach((condition) {
      switch (condition.name) {
        case 'sortBy':
          params.putIfAbsent('${condition.name}', () => condition.object);
          break;
        case 'sortOrder':
          params.putIfAbsent('${condition.name}', () => condition.object);
          break;
        case 'itemName':
          params.putIfAbsent('itemName', () => condition.object);
          break;
        case 'processInstanceBusinessKeyLike':
          params.putIfAbsent('nameLike', () => condition.object);
          break;
      }
      if (condition?.value?.isNotEmpty ?? false) {
        if (condition.name.indexOf('期') > -1) {
          params.putIfAbsent('termState', () => condition.value);
        } else {
          params.putIfAbsent('businessCode', () => condition.value);
        }
      }
    });
    prepare(params);
  }

  ///拉取数据渲染列表准备
  prepare(Map params) {
    String taskType = 'my';
    _currentConditions.forEach((condition) {
      if (condition?.object?.toString()?.isNotEmpty ?? false) {
        if (['my', 'group', 'completed']
            .contains(condition.object.toString())) {
          if (condition.isSelected) {
            taskType = condition.object.toString();
          }
        }
      }
    });
    print(taskType);
    fetchData(taskType,params);
  }

  ///请求数据
  void fetchData(String taskType,Map params) {
    switch (taskType) {
      case 'my':

        break;
      case 'group':
        break;
      case 'completed':
        break;
    }
  }
}
