import 'package:flutter/foundation.dart';

/// 用于表示商品信息的类
/// @author: dingwen
/// @date: 2020/12/25

class Goods {
  double price;
  String name;
  int count;

  Goods({@required this.name, @required this.price, this.count = 1})
      : assert(name != null && price != null);

  @override
  String toString() {
    return 'name: $name, price: $price, count: $count';
  }
}
