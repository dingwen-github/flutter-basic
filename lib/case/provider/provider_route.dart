import 'package:flutter/material.dart';
import 'package:flutter_basic/case/provider/cart_model.dart';
import 'package:flutter_basic/case/provider/change_notifier_provider.dart';
import 'package:flutter_basic/case/provider/consumer.dart';
import 'package:flutter_basic/case/provider/goods.dart';

/// Provider 根 widget 测试
/// @author: dingwen
/// @date: 2020/12/25

class ProviderRoute extends StatefulWidget {
  @override
  _ProviderRouteState createState() => _ProviderRouteState();
}

class _ProviderRouteState extends State<ProviderRoute> {

  ///context 需要时同一层级的，否则data == null
  var _context;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ProviderRoute'),
        centerTitle: true,
        leading: BackButton(),
      ),
      body: Center(
        child: ChangeNotifierProvider<CartModel>(
          data: CartModel(),
          child: Builder(
            builder: (context) {
              return Column(
                children: [
//                  Builder(builder: (context) {
//                     cart = ChangeNotifierProvider.of<CartModel>(context);
//                    return Text("总价: ${cart.totalPrice}");
//                  }),
                Consumer<CartModel>(
                  builder: (context,carts){
                    _context = context;
                    return Text("总价: ${carts.totalPrice}, $carts");
                  },
                ),
                ],
              );
            },
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => ChangeNotifierProvider.of<CartModel>(_context,listen: false).add(Goods(price: 99.0, name: 'M1', count: 3)),
      ),
    );
  }
}
