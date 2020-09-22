import 'package:flutter/material.dart';

///Flutter 基础组件 PhysicalModel 和ClipRRect 的主要区别是不能设置Z轴高度和阴影
class PhysicalModelWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PhysicalModel'),
        leading: BackButton(),
      ),
      body: Container(
        width: 300,
        height: 200,
        margin: EdgeInsets.only(left: (MediaQuery
            .of(context)
            .size
            .width - 300) / 2, top: 15),
        child: PhysicalModel(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(6)),
          //裁切行为
          clipBehavior: Clip.antiAlias,
          //Z轴高度
          elevation: 6.0,
          //阴影颜色
          shadowColor: Colors.grey,
          child: GridView.count(
            crossAxisCount: 3,
            /*
                  * 列表滚动至边缘后继续拖动的物理效果，Android与iOS效果不同。Android会呈现出一个波纹状（对
                    应ClampingScrollPhysics），而iOS上有一个回弹的弹性效果（对应BouncingScrollPhysics）。如果
                    你想不同的平台上呈现各自的效果可以使用AlwaysScrollableScrollPhysics，它会根据不同平台自
                    动选用各自的物理效果。如果你想禁用在边缘的拖动效果，那可以使用NeverScrollableScrollPhysics；
                  * */
            physics: NeverScrollableScrollPhysics(), //禁止滚动
            /*
                  * 该属性将决定列表的长度是否仅包裹其内容的长度。当ListView嵌在一个无限长的容器组件中时，shrinkWrap必须为true，否则Flutter会给出警告
                  * */
            shrinkWrap: true,
            children: _itemList(),
          ),
        ),
      ),
    );
  }

  Widget _item(ItemViewModel itemViewModel, int index) {
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          itemViewModel.icon,
          Padding(
            padding: EdgeInsets.only(top: 5),
            child: Text(itemViewModel.title),
          ),
        ],
      ),
    );
  }

  List<ItemViewModel> fetchData() {
    double iconSize = 25;
    List<ItemViewModel> itemDataList = [];
    itemDataList.add(ItemViewModel(
        title: '精选早餐',
        icon: Icon(
          Icons.free_breakfast,
          size: iconSize,
          color: Colors.lightBlue,
        )));
    itemDataList.add(ItemViewModel(
        title: '包子',
        icon: Icon(
          Icons.camera_front,
          size: iconSize,
          color: Colors.green,
        )));
    itemDataList.add(ItemViewModel(
        title: '相机',
        icon: Icon(
          Icons.camera,
          size: iconSize,
          color: Colors.orange,
        )));
    itemDataList.add(ItemViewModel(
        title: '手机',
        icon: Icon(
          Icons.phone,
          size: iconSize,
          color: Colors.blue,
        )));
    itemDataList.add(ItemViewModel(
        title: '相机',
        icon: Icon(
          Icons.camera,
          size: iconSize,
          color: Colors.orange,
        )));
    itemDataList.add(ItemViewModel(
        title: '手机',
        icon: Icon(
          Icons.phone,
          size: iconSize,
          color: Colors.blue,
        )));

    return itemDataList;
  }

  List<Widget> _itemList() {
    int index = 0;
    return fetchData().map((itemData) {
      index ++;
      return _item(itemData, index);
    }).toList();
  }
}

class ItemViewModel {
  final String title;
  final Icon icon;

  ItemViewModel({this.title, this.icon});
}
