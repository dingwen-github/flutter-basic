import 'dart:collection';

import 'package:flutter_basic/case/provider/goods.dart';
import 'package:flutter_basic/case/provider/my_change_notifier.dart';

/// 保存公购物车内商品信息的CatModel类
/// @author: dingwen
/// @date: 2020/12/25

class CartModel extends MyChangeNotifier {
  ///购物车中商品列表
  List<Goods> _goodsList = [];

  ///禁止改变购物车中的商品信息
  UnmodifiableListView<Goods> get goodsList => UnmodifiableListView(_goodsList);

  ///购物车里面的商品总价
  double get totalPrice => _goodsList.fold(0.0,
      (previousValue, goods) => previousValue + (goods.price * goods.count));


  ///添加[Goods]商品到购物车
  void add(Goods goods){
    _goodsList.add(goods);

    //通知监听器(订阅者)，重新构建InheritedProvider,更新状态
    notifyListeners();
  }

  @override
  String toString() {
    return _goodsList.toString();
  }
}
