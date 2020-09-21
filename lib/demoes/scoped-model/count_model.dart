import 'package:scoped_model/scoped_model.dart';

///在Scoped中，Model是一个只包含与状态相关信息的单位。我们应该把状态数据与操作数据的方法抽象出来封装到Model中
///我们需要让我们自定义的CountModel继承至Model。
///在状态发生变化时（increment）通知所有用到了该model的子项更新状态。(notifyListeners)
class CountModel extends Model {
  int _count = 0;

  ///计算属性
  get count => _count;

  void increment() {
    _count++;
    notifyListeners();
  }

  ///我们在顶层创建了一个CountModel的实例。
  ///ScopedModel<T extends Model>是一个StatelessWidget，它接收一个model，并提供给需要它的所有部件。
  ///将ScopedModel<T extends Model>的model属性绑定我们的CountModel对象

  CountModel of(context)=> ScopedModel.of<CountModel>(context);

}
