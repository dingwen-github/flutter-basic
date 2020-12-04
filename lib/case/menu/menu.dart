
import 'package:flutter/material.dart';
import 'package:flutter_basic/case/dialog/dialogs.dart';
import 'package:flutter_basic/case/menu/base/base_menu.dart';
import 'package:flutter_basic/case/menu/model/condition_model.dart';
import 'package:flutter_basic/case/menu/model/menu_model.dart';
import 'package:flutter_basic/case/menu/widget/alert_bottom_form.dart';
import 'package:gzx_dropdown_menu/gzx_dropdown_menu.dart';

/// 下拉菜单widget
/// dingwen
/// 2020/12/3
class Menu extends StatefulWidget {
  ///整个菜单页面的标题AppBar
  String title;

  /// 页面标题是否居中
  bool titleIsCenter;

  ///菜单的信息
  List<MenuModel> menus;

  ///子菜单项
  List<List<ConditionModel>> childMenuConditions;

  ///默认显示的是哪一个条件，支持传参自定义
  List<ConditionModel> defaultConditions;

  ///没有数据时，构建页面内容显示,必须返回widget
  Function buildTip;

  Menu(
      {this.title,
      this.titleIsCenter = true,
      this.menus,
      this.childMenuConditions,
      this.defaultConditions,
      this.buildTip})
      : assert(title != null),
        assert(menus != null),
        assert(childMenuConditions != null),
        assert(defaultConditions != null),
        assert(buildTip != null);

  @override
  _MenuState createState() => _MenuState();
}

class _MenuState extends State<Menu> with BaseMenu {
  //todo 自定义实现
  ///数据集合
  List dataList = [];
  var name = TextEditingController();
  String nameVal = '';
  var score = TextEditingController();
  String scoreVal = '';

  ///当前所有条件的集合
  List<ConditionModel> _currentConditions;

  ///下拉菜单控制器
  GZXDropdownMenuController _dropdownMenuController;

  ///key
  var _scaffoldKey;
  GlobalKey _stackKey;

  ///判断用户是否点击筛选条件
  bool isClick = false;

  ///初始化
  @override
  void initState() {
    super.initState();
    _dropdownMenuController = new GZXDropdownMenuController();
    _scaffoldKey = new GlobalKey<ScaffoldState>();
    _stackKey = GlobalKey();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: widget.titleIsCenter,
      ),
      body: Stack(
        key: _stackKey,
        children: <Widget>[
          ///下拉菜单头部向构建等
          Column(
            children: <Widget>[
              ///下拉菜单的头部项，目前每一项，只能自定义显示的文字、图标、图标大小修改
              GZXDropDownHeader(
                  items: _buildDropDownHeader(),
                  stackKey: _stackKey,
                  controller: _dropdownMenuController,
                  //头部的高度
                  height: 50,
                  // 头部背景颜色
                  color: Colors.white54,
                  // 头部边框宽度
                  borderWidth: 1,
                  // 头部边框颜色
//                borderColor: Color(0xFFeeede6),
                  // 分割线高度
//                dividerHeight: 20,
//                 分割线颜色
//                dividerColor: Color(0xFFeeede6),
                  // 文字样式
                  style: TextStyle(color: Color(0xFF666666), fontSize: 16),
                  // 下拉时文字样式
                  dropDownStyle: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).primaryColor,
                  ),
                  // 图标大小
//                iconSize: 20,
                  // 图标颜色
//                iconColor: Color(0xFFafada7),
                  // 下拉时图标颜色
//                iconDropDownColor: Theme.of(context).primaryColor,

                  ///点击菜单的点击事件，此处进行菜单类型为1的，底部弹出菜单进行处理
                  onItemTap: (index) {
                    _buildMenuOne(index);
                  }),

              ///没有数据时，显示的内容
              Offstage(
                offstage: dataList.length != 0,
                child: widget.buildTip(),
              ),

              ///内容显示
              Expanded(
                child: ListView.separated(
                    itemCount: dataList.length,
                    separatorBuilder: (BuildContext context, int index) =>
                        Divider(height: 1.0),
                    itemBuilder: (BuildContext context, int index) {
                      return buildContent();
                    }),
              ),
            ],
          ),

          ///下拉菜单构建
          GZXDropDownMenu(
            // controller用于控制menu的显示或隐藏
            controller: _dropdownMenuController,
            // 下拉菜单显示或隐藏动画时长
            animationMilliseconds: 300,
            // 下拉后遮罩颜色
            maskColor: Colors.grey.withOpacity(0.8),
            dropdownMenuChanging: (isShow, index) {
              //下拉菜单显示之前
            },
            //下拉菜单显示之后，此处进行
            dropdownMenuChanged: (isShow, index) {
              if (isClick) {
                ///进行条件初始化话，进行网络请求
                queryInit();
                isClick = !isClick;
              }
            },
            // 下拉菜单，高度自定义，你想显示什么就显示什么，完全由你决定，你只需要在选择后调用_dropdownMenuController.hide();即可
            menus: _buildGZXDropdownMenuBuilderList(),
          ),
        ],
      ),
    );
  }

  ///构建下拉菜单
  List<GZXDropdownMenuBuilder> _buildGZXDropdownMenuBuilderList() {
    List<GZXDropdownMenuBuilder> widgets = [];
    for (int i = 0; i < widget.childMenuConditions.length; i++) {
      for (int j = 0; j < widget.defaultConditions.length; j++) {
        if (i == j) {
          widgets.add(GZXDropdownMenuBuilder(
              dropDownHeight: 66.0 * widget.childMenuConditions[i].length,
              dropDownWidget: _buildConditionListWidget(
                  widget.childMenuConditions[i], (value) {
                widget.defaultConditions[i] = value;
                widget.menus[i].text = value.name;
                _dropdownMenuController.hide();
                setState(() {});
              })));
          break;
        }
      }
    }
    return widgets;
  }

  ///构建下拉菜单widget
  _buildConditionListWidget(
      items, void itemOnTap(ConditionModel sortCondition)) {
    return ListView.separated(
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      itemCount: items.length,
      // item 的个数
      separatorBuilder: (BuildContext context, int index) =>
          Divider(height: 1.0),
      // 添加分割线
      itemBuilder: (BuildContext context, int index) {
        ConditionModel sortCondition = items[index];
        return GestureDetector(
          onTap: () {
            for (var value in items) {
              value.isSelected = false;
            }
            sortCondition.isSelected = true;
            setState(() {
              isClick = true;
            });
            itemOnTap(sortCondition);
          },
          child: Container(
//            color: Colors.blue,
            height: 60,
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

  ///构建下拉菜单头部
  List<GZXDropDownHeaderItem> _buildDropDownHeader() {
    List<GZXDropDownHeaderItem> widgets = [];
    widget.menus.forEach((menu) {
      if (menu.defaultFlag) {
        ///使用默认
        widgets.add(GZXDropDownHeaderItem(menu.text));
      } else {
        ///定制图标样式
        widgets.add(GZXDropDownHeaderItem(menu.text,
            iconData: menu.iconData,
            iconSize: menu.iconsSize,
            style: menu.textStyle));
      }
    });
    return widgets;
  }

  ///此处进行菜单类型为1的，底部弹出菜单进行处理
  void _buildMenuOne(index) {
    for (int i = 0; i < widget.menus.length; i++) {
      if (i == index && widget.menus[i].menuType == 1) {
        ///父一级传下来的可以正常底部弹出菜单的方法
        buildBottomView();
      }
    }
  }

  ///构建底部弹出表单类型
  @override
  buildBottomView() {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return AlertBottomForm(
            tabs: [
              Tab(
                child: Text('title'),
              ),
              Tab(
                child: Text('title2'),
              )
            ],
            childes: <Widget>[alertFrom(), alertFrom()],
          );
        });
    return null;
  }

  Widget alertFrom() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 24.0),
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
                    controller: name,
                    decoration: InputDecoration(
                        labelText: "name",
                        hintText: "please input name",
                        icon: Icon(Icons.bubble_chart)),
                    // 当用户确定已经完成编辑时触发
                    onChanged: (value) {
                      setState(() {
                        nameVal = value;
                      });
                    },
                  ),
                  TextFormField(
                      controller: score,
                      decoration: InputDecoration(
                          labelText: "score",
                          hintText: "please input score",
                          icon: Icon(Icons.flag)),
                      onChanged: (value) {
                        setState(() {
                          scoreVal = value;
                        });
                      }),
                  // 按钮
                  Padding(
                    padding: const EdgeInsets.only(top: 28.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(right: 0.0),
                          child: RaisedButton(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text("reset", style: TextStyle(fontSize: 16)),
                            color: Colors.white,
                            textColor: Theme.of(context).primaryColor,
                            onPressed: () {
                              name.text = '';
                              score.text = '';
                              setState(() {
//                                _currentConditions.removeWhere((condition) => [
//                                  'nameLike',
//                                  'itemName',
//                                  'processInstanceBusinessKeyLike'
//                                ].contains(condition.name));
                              });
                            },
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 0, left: 0),
                          child: RaisedButton(
                            padding: EdgeInsets.all(10.0),
                            child:
                                Text("search", style: TextStyle(fontSize: 16)),
                            color: Theme.of(context).primaryColor,
                            textColor: Colors.white,
                            onPressed: () {
                              setState(() {
                                if (score.text.toString().trim().isNotEmpty) {
//                                  _currentConditions.add(ConditionQuery(
//                                      name: 'nameLike',
//                                      isSelected: true,
//                                      object: '%' + nameLikeVal + '%'));
                                }
                                if (name.text.toString().trim().isNotEmpty) {
//                                  _currentConditions.add(ConditionQuery(
//                                      name: 'itemName',
//                                      isSelected: true,
//                                      object: '%' + itemNameVal + '%'));
                                }

                                //去重
//                                _currentConditions =
//                                    _currentConditions.toSet().toList();

                                ///此处必须在请求网络之前进行关闭，否则导致context为空报错
                                //关闭弹窗
                                Navigator.pop(context);

                                ///组装查询条件
                                generateQueryCondition();
                              });
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
  }

  ///构建页面内容
  @override
  buildContent() {
    return Text('buildContent');
  }

  ///获取服务器数据
  @override
  fetchData(int fetchType,Map params) async{
    await Dialogs.showNormalProgressDialog(context, '加载中，请稍后...', () async {
      try {
        //todo 接口数据请求
        await Future.delayed(const Duration(seconds: 1));
      } catch (error) {}
    });
  }

  ///组装查询条件
  @override
  generateQueryCondition() {
    // TODO: implement generateQueryCondition
    Map params = {};
    prepareFetch(params);
    return null;
  }

  ///拉取数据前准备,组装接口所需要的参数列表
  @override
  prepareFetch(Map params) {
    int fetchType = 0;
    // TODO: implement prepareFetch
    fetchData(fetchType,params);
    return null;
  }

  ///查询初始化
  @override
  queryInit() {
    // TODO: implement queryInit
    generateQueryCondition();
    return null;
  }

  /// 关闭资源
  @override
  void dispose() {
    super.dispose();
    _dropdownMenuController?.dispose();
  }
}
